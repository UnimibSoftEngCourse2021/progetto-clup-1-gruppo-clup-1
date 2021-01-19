package main.webapp.web;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;

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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("idUser");
        System.out.println("Printing guest result insert: " +id);

		int idUser = 0;
		if(id != null && id != "")
		{
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
	    int result = 0;
	    int result_insertGuestUser = 0;
	    
		try {
			if(idUser == 0)
			{
				result_insertGuestUser = registrationDao.insertGuestUser(user);
				idUser = registrationDao.getGuestUserId(user.getEmail());
			}
			result = bookingDao.insertBooking(date, arrivalTime, finishTime, idStore, idUser);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    if(result==1)
	    {	    	
	    	response.sendRedirect("BookingServlet");
	    }
	    if(result == 0) {
	    	 request.getRequestDispatcher("/homepageManager.jsp").forward(request, response);
	    }
	}

}
