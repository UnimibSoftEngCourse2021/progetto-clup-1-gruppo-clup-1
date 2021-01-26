package main.webapp.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import main.webapp.DAO.BookingDao;
import main.webapp.model.Booking;

/**
 * Servlet implementation class UserBookingServlet
 */
public class UserBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(UserBookingServlet.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserBookingServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookingDao bookingdao = new BookingDao();
		ArrayList<Booking> bookingList;
		try {
			HttpSession session = request.getSession();
			int idUser = ((Integer) session.getAttribute("id"));
			int status = ((Integer) session.getAttribute("StatusBooking"));
			System.out.println(status);
			if (status > 0) {
				bookingList = bookingdao.getAllUserBooking(idUser);
			} else {
				bookingList = bookingdao.getUserBooking(idUser);
			}
			try {
				String json = new Gson().toJson(bookingList);
				System.out.println(json);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json);
			} catch (IOException e) {
				log.log(Level.FINE, e.toString());
			}
		} catch (NumberFormatException e) {
			log.log(Level.FINE, e.toString());
		}

	}

}
