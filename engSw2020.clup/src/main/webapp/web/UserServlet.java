package main.webapp.web;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.webapp.DAO.UserDao;
import main.webapp.model.User;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao userDao = new UserDao();
		User user = null;
		user=userDao.getUserInformation(Integer.parseInt(request.getParameter("iduser")));
		if(user==null)
		{
			request.setAttribute("errorMsg","User non trovato"); 
        	request.getRequestDispatcher("/homepageManager.jsp").forward(request, response);
		}
		else {
			request.setAttribute("user", user);
			request.getRequestDispatcher("/userInformation.jsp").forward(request,response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao userDao = new UserDao();
		int idUser=Integer.parseInt(request.getParameter("idUser"));
		String name = request.getParameter("name").trim();
		String surname = request.getParameter("surname").trim();
		String email = request.getParameter("email").trim();
		String userName = request.getParameter("username").trim();
		String telephoneNumber = request.getParameter("telephoneNumber").trim();
		Date birthdayDate = Date.valueOf(request.getParameter("birthdayDate"));
		int result=0;
		result = userDao.modifyBooking(idUser, name, surname, email, userName, telephoneNumber, birthdayDate);
	    if(result==1)
	    {	  
	    	request.setAttribute("iduser", idUser);
	    	request.getRequestDispatcher("/homepageManager.jsp").forward(request, response);
	    }
	    /*if(result == 0) {
	    	 request.getRequestDispatcher("/homepageManager.jsp").forward(request, response);
	    }*/
	}

}
