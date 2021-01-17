package main.webapp.web;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.webapp.DAO.BookingDao;

/**
 * Servlet implementation class AddServlet
 */
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idUser = Integer.parseInt(request.getParameter("idUser"));
		int idStore = Integer.parseInt(request.getParameter("idStore"));
		Date date = Date.valueOf(request.getParameter("date"));		
		String requestArrivalTime = request.getParameter("arrivalTime");
		requestArrivalTime += ":00";
		Time arrivalTime = Time.valueOf(requestArrivalTime);
		String requestFinishTime = request.getParameter("finishTime");
		requestFinishTime += ":00";
		Time finishTime = Time.valueOf(requestFinishTime);
		BookingDao bookingDao = new BookingDao();
	    int result = 0;
		try {
			result = bookingDao.insertBooking(date, arrivalTime, finishTime, idStore, idUser);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    if(result==1)
	    {	    	
	    	response.sendRedirect("BookingServlet");
	    }
	    if(result == 0) {
	    	 request.getRequestDispatcher("/homepageManager.jsp").forward(request, response);
	    }
	}

}
