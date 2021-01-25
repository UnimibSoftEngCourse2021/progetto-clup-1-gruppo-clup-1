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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Logger log = Logger.getLogger(GetCategoryServlet.class.getName());
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> category = new ArrayList<Category>();
		int idStore = Integer.parseInt(request.getParameter("store"));
		try {
			category = categoryDao.getCategory(Integer.parseInt(request.getParameter("store")));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			log.log(Level.FINE, e.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			log.log(Level.FINE, e.toString());
		}
		String json = new Gson().toJson(category);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
