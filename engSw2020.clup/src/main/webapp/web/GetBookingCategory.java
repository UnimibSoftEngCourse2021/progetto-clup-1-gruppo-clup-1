package main.webapp.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import main.webapp.DAO.CategoryDao;
import main.webapp.model.Category;

/**
 * Servlet implementation class GetBookingCategory
 */
public class GetBookingCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetBookingCategory() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Logger log = Logger.getLogger(GetCategoryServlet.class.getName());
		CategoryDao categoryDao = new CategoryDao();
		int idStore = 0;
		ArrayList<Category> category = new ArrayList<Category>();
		try {
			idStore = Integer.parseInt(request.getParameter("store"));
		} catch (NumberFormatException e) {
			log.log(Level.FINE, e.toString());
		}
		try {
			category = categoryDao.getCategory(Integer.parseInt(request.getParameter("store")));
		} catch (NumberFormatException e) {
			log.log(Level.FINE, e.toString());
		} catch (SQLException e) {
			log.log(Level.FINE, e.toString());
		}
		try {
			String json = new Gson().toJson(category);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		} catch (IOException e) {
			log.log(Level.FINE, e.toString());
		}

	}

}
