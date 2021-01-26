package main.webapp.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.webapp.DAO.CategoryDao;

/**
 * Servlet implementation class DeletionCategoryServlet
 */
public class DeletionCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletionCategoryServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Logger log = Logger.getLogger(DeletionCategoryServlet.class.getName());
		CategoryDao categoryDao = new CategoryDao();
	    int result = 0;
		try {
			result = categoryDao.deleteCategory(Integer.parseInt(request.getParameter("idCategory")));
		} catch (NumberFormatException e) {
			log.log(Level.FINE, e.toString());
		} catch (SQLException e) {
			log.log(Level.FINE, e.toString());
		}
		try {
	    if(result==1)
	    {	    	
	    	response.sendRedirect("getCategoryServlet");
	    }
		}
		catch (IOException e) {
			log.log(Level.FINE, e.toString());
		}
	}

}
