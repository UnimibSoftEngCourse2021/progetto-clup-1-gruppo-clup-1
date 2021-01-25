package main.webapp.web;

import java.io.IOException;
import java.util.ArrayList;

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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookingDao bookingdao = new BookingDao();
		ArrayList<Booking> bookingList;
		HttpSession session = request.getSession();
		int idUser = ((Integer)session.getAttribute("id"));
		int status = ((Integer)session.getAttribute("StatusBooking"));
		if(status > 0)
		{
			bookingList = bookingdao.getAllUserBooking(idUser);
		}
		else
		{
			bookingList = bookingdao.getUserBooking(idUser);

		}
		String json = new Gson().toJson(bookingList);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
