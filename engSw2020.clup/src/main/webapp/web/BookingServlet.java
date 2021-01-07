package main.webapp.web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.webapp.DAO.BookingDao;
import main.webapp.model.Booking;

public class BookingServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException  {
		BookingDao bookingDao = new BookingDao();
		ArrayList<Booking> bookingList = bookingDao.getBooking();
		req.setAttribute("bookingList", bookingList);

	    req.getRequestDispatcher("/bookings.jsp").forward(req, res);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
