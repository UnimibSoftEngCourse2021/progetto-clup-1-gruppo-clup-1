package main.webapp.web;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import main.webapp.DAO.CategoryDao;

/**
 * Servlet implementation class GetMaxCategoryServlet
 */
public class GetMaxCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(GetMaxCategoryServlet.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetMaxCategoryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CategoryDao categoryDao = new CategoryDao();
		String name = "";
		HttpSession session = request.getSession();
		int idStore = (Integer) session.getAttribute("id");
		int idCategory = 0;
		try {
			idCategory = categoryDao.getMaxIdCategory(idStore);
			if (idCategory > 0) {
				name = categoryDao.getNameFromId(idCategory);
			}
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		try {
			String json = new Gson().toJson(name);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		} catch (IOException e) {
			log.log(Level.FINE, e.toString());
		}
	}

}
