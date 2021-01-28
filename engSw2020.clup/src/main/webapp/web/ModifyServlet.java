package main.webapp.web;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Logger log = Logger.getLogger(ModifyServlet.class.getName());

		try {
			int id = Integer.parseInt(request.getParameter("idBooking"));
			Date date = Date.valueOf(request.getParameter("date"));
			String requestArrivalTime = request.getParameter("arrivalTime");
			requestArrivalTime += ":00";
			Time arrivalTime = Time.valueOf(requestArrivalTime);
			String requestFinishTime = request.getParameter("finishTime");
			requestFinishTime += ":00";
			Time finishTime = Time.valueOf(requestFinishTime);
			BookingDao bookingDao = new BookingDao();
			int result = 0;
			HttpSession session = request.getSession();
			int idRole = ((Integer) session.getAttribute("role")).intValue();
			try {
				result = bookingDao.modifyBooking(id, date, arrivalTime, finishTime);
			} catch (SQLException e) {
				log.log(Level.FINE, e.toString());
			}
			try {
				if (result == 1 && idRole == 1) {
					request.setAttribute("successModify", "Modifica avvenuta correttamente");
					response.sendRedirect("BookingServlet");
				}
				if (result == 0 && idRole == 1) {
					request.setAttribute("idBooking", id);
					request.setAttribute("errorMsg", "Modifica non avvenuta");
					request.getRequestDispatcher("/modifyBooking.jsp").forward(request, response);
				}
				if (result == 1 && idRole == 0) {
					request.getRequestDispatcher("/customerBooking.jsp").forward(request, response);
					;
				}
				if (result == 0 && idRole == 0) {
					request.getRequestDispatcher("/homepageCustomer.jsp").forward(request, response);
				}
			} catch (IOException e) {
				log.log(Level.FINE, e.toString());
			}catch (ServletException e) {
				log.log(Level.FINE, e.toString());
			}
		} catch (NumberFormatException e) {
			log.log(Level.FINE, e.toString());
		} 

	}

}
