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
 * Servlet implementation class AsyncServlet
 */
public class AsyncServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AsyncServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Logger log = Logger.getLogger(AsyncServlet.class.getName());
		BookingDao bookingDao = new BookingDao();
		HttpSession session = request.getSession();
		int idStoreUser = ((Integer) session.getAttribute("id")).intValue();
		ArrayList<Booking> bookingList = null;
		try {
			bookingList = bookingDao.getLatestBooking(idStoreUser);
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());

		}
		try {
			String json = new Gson().toJson(bookingList);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		} catch (IOException e) {
			log.log(Level.FINE, e.toString());

		}

	}

}
