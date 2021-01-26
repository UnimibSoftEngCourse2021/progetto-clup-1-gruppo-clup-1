package main.webapp.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Logger log = Logger.getLogger(DeletionServlet.class.getName());
		BookingDao bookingDao = new BookingDao();
		HttpSession session = request.getSession();
		int role = ((Integer) session.getAttribute("role"));

		int result = 0;
		try {
			result = bookingDao.deleteBooking(Integer.parseInt(request.getParameter("idBooking")));
		} catch (NumberFormatException e) {
			log.log(Level.FINE, e.toString());
		} catch (SQLException e) {
			log.log(Level.FINE, e.toString());
		}
		try {
			if (result == 1 && role == 1) {
				response.sendRedirect("BookingServlet");
			}
			if (result == 1 && role == 0) {
				response.sendRedirect("customerBooking.jsp");
			}
		} catch (IOException e) {
			log.log(Level.FINE, e.toString());
		}
	}
}
