package main.webapp.web;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.webapp.DAO.BookingDao;
import main.webapp.DAO.RegistrationDao;
import main.webapp.model.User;

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
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Logger log = Logger.getLogger(AddServlet.class.getName());
		try {
			String id = request.getParameter("idUser");
			System.out.println("Printing guest result insert: " + id);

			int idUser = 0;
			if (!id.isEmpty() && id != null) {
				idUser = Integer.parseInt(request.getParameter("idUser"));
			}
			int idStore = Integer.parseInt(request.getParameter("idStore"));
			Date date = Date.valueOf(request.getParameter("date"));
			String requestArrivalTime = request.getParameter("arrivalTime");
			requestArrivalTime += ":00";
			Time arrivalTime = Time.valueOf(requestArrivalTime);
			String requestFinishTime = request.getParameter("finishTime");
			requestFinishTime += ":00";
			Time finishTime = Time.valueOf(requestFinishTime);
			// Information guest user
			String userName = request.getParameter("userName");
			String userSurname = request.getParameter("userSurname");
			String userEmail = request.getParameter("userEmail");
			String userTelephoneNumber = request.getParameter("userTelephoneNumber");
			User user = new User();
			user.setName(userName);
			user.setSurname(userSurname);
			user.setEmail(userEmail);
			user.setTelephoneNumber(userTelephoneNumber);
			RegistrationDao registrationDao = new RegistrationDao();
			BookingDao bookingDao = new BookingDao();
			int[] result = new int[2];
			int result_insertGuestUser = 0;

			try {
				if (idUser == 0) {
					result_insertGuestUser = registrationDao.insertGuestUser(user);
					idUser = registrationDao.getGuestUserId(user.getEmail());
				}
				result = bookingDao.insertBooking(date, arrivalTime, finishTime, idStore, idUser);
			} catch (SQLException e) {
				log.log(Level.FINE, e.toString());
			} catch (ClassNotFoundException e) {
				log.log(Level.FINE, e.toString());
			}
			try {
				if (result[0] == 1) {
					// response.sendRedirect("BookingServlet");
					request.setAttribute("successMsg", "Prenotazione aggiunta con successo");
					request.getRequestDispatcher("/homepageManager.jsp").forward(request, response);
				}
				if (result[0] == 0) {
					request.setAttribute("errorMsg", "Prenotazione non riuscita");
					request.getRequestDispatcher("/addBooking.jsp").forward(request, response);
				}
			} catch (ServletException e) {
				log.log(Level.FINE, e.toString());
			}catch (IOException e) {
				log.log(Level.FINE, e.toString());
			}
		} catch (NumberFormatException e) {
			log.log(Level.FINE, e.toString());
		}
	}

}
