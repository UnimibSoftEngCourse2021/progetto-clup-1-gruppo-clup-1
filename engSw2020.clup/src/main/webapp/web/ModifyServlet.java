package main.webapp.web;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.protobuf.TextFormat.ParseException;

import main.webapp.DAO.BookingDao;

/**
 * Servlet implementation class ModifyServlet
 */
public class ModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("idBooking"));
		Date date = Date.valueOf(request.getParameter("date"));		
		String requestArrivalTime = request.getParameter("arrivalTime");
		requestArrivalTime += ":00";
		Time arrivalTime = Time.valueOf(requestArrivalTime);
		String requestFinishTime = request.getParameter("finishTime");
		requestFinishTime += ":00";
		Time finishTime = Time.valueOf(requestFinishTime);
		BookingDao bookingDao = new BookingDao();
	    int result = bookingDao.modifyBooking(id,date,arrivalTime,finishTime);
	    if(result==1)
	    {	    	
	    	response.sendRedirect("BookingServlet");
	    }
	    if(result == 0) {
	    	 request.getRequestDispatcher("/homepageManager.jsp").forward(request, response);
	    }

	}

}
