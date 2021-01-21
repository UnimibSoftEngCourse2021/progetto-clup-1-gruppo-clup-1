package main.webapp.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.webapp.DAO.CategoryDao;

/**
 * Servlet implementation class AddCategoryServlet
 */
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDao categoryDao = new CategoryDao();
    	HttpSession session = request.getSession();
    	int idStore = ((Integer) session.getAttribute("idStore")).intValue();
    	String category = request.getParameter("categoryToAdd");
    	int result = 0;
    	int id = 0;
		try {
			id = categoryDao.getIdCategoryByName(category);
			result = categoryDao.insertCategory(idStore, id);
			if(result > 0)
			{
				request.setAttribute("InsertResult", "OK");
				request.getRequestDispatcher("/homepageManager.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("InsertResult", "KO");
				request.getRequestDispatcher("/homepageManager.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


    	
    	
	}

}