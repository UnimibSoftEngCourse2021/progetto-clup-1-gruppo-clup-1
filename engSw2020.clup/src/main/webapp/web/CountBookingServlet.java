package main.webapp.web;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import main.webapp.DAO.BookingDao;

/**
 * Servlet implementation class CountBookingServlet
 */
public class CountBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CountBookingServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Logger log = Logger.getLogger(CountBookingServlet.class.getName());
		BookingDao bookingDao = new BookingDao();
		HttpSession session = request.getSession();
		int idStoreUser = ((Integer) session.getAttribute("id")).intValue();
		int result = 0;
		try {
			result = bookingDao.getCountBooking(idStoreUser);

		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		try {
			String json = new Gson().toJson(result);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		} catch (IOException e) {
			log.log(Level.FINE, e.toString());
		}
	}

}
