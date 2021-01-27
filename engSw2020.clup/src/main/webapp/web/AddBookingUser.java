package main.webapp.web;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.webapp.DAO.BookingDao;
import main.webapp.DAO.CategoryInBookingDao;

/**
 * Servlet implementation class AddBookingUser
 */
public class AddBookingUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(AddServlet.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddBookingUser() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookingDao bookingDao = new BookingDao();
		CategoryInBookingDao categoryInBookingDao = new CategoryInBookingDao();
		int[] result_insert = new int[2];
		int result = 0;
		try {
			int idUser = Integer.parseInt(request.getParameter("idUser"));
			int idStore = Integer.parseInt(request.getParameter("idStore"));
			Date bookingDate = Date.valueOf(request.getParameter("bookingDate"));
			Time arrivalTime = Time.valueOf(request.getParameter("arrivalTime") + ":00");
			Time finishTime = Time.valueOf(request.getParameter("finishTime") + ":00");
			String[] category = request.getParameterValues("category");
			result_insert = bookingDao.insertBooking(bookingDate, arrivalTime, finishTime, idStore, idUser);
			result = result_insert[0];
			int idBooking = result_insert[1];
			if (result == 1) {
				for (int i = 0; i < category.length; i++) {
					result = categoryInBookingDao.insertCategory(idBooking, Integer.parseInt(category[i]));
				}
			}

		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		try {
			if (result == 1) {
				request.setAttribute("successMsg", "Prenotazione avvenuta con successo");
				request.getRequestDispatcher("/homepageCustomer.jsp").forward(request, response);
			}
			if (result == 0) {
				request.setAttribute("errorMsg", "Orario non disponibile per la prenotazione");
				request.getRequestDispatcher("/customerAddBooking.jsp").forward(request, response);
			}
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}

	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		doGet(request, response);
		}catch (IOException e) {
			log.log(Level.FINE, e.toString());
		}catch (ServletException e) {
			log.log(Level.FINE, e.toString());
		}catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
	}

}
