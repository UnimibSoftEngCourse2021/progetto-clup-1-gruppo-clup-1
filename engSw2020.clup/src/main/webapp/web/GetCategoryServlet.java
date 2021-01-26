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
import javax.servlet.http.HttpSession;

import main.webapp.DAO.CategoryDao;
import main.webapp.model.Category;

/**
 * Servlet implementation class GetCategoryServlet
 */
public class GetCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCategoryServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Logger log = Logger.getLogger(GetCategoryServlet.class.getName());
		CategoryDao categoryDao = new CategoryDao();
    	HttpSession session = request.getSession();
    	int idStoreUser = ((Integer) session.getAttribute("idStore")).intValue();
		ArrayList<Category> categoryList = null;
		ArrayList<Category> AllCategoryList = null;

		try {
			categoryList = categoryDao.getCategory(idStoreUser);
			AllCategoryList = categoryDao.getAllCategory(idStoreUser);

			request.setAttribute("categoryList", categoryList);
			request.setAttribute("AllCategoryList", AllCategoryList);
	    	request.getRequestDispatcher("/category.jsp").forward(request, response);
		} catch (SQLException e) {
			log.log(Level.FINE, e.toString());
		}catch (IOException e) {
			log.log(Level.FINE, e.toString());
		}catch (ServletException e) {
			log.log(Level.FINE, e.toString());
		}

	}

}
