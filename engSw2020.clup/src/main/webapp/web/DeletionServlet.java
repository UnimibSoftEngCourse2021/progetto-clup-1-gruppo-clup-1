package main.webapp.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.webapp.DAO.BookingDao;

/**
 * Servlet implementation class DeletionServlet
 */
public class DeletionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Logger log = Logger.getLogger(DeletionServlet.class.getName());
		BookingDao bookingDao = new BookingDao();
	    int result = 0;
		try {
			result = bookingDao.deleteBooking(Integer.parseInt(request.getParameter("idBooking")));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			log.log(Level.FINE, e.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			log.log(Level.FINE, e.toString());
		}
	    if(result==1)
	    {	    	
	    	response.sendRedirect("BookingServlet");
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    
	}
}
