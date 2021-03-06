package main.webapp.web;

import java.io.IOException;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.webapp.DAO.LoginDao;
import main.webapp.DAO.UserDao;
import main.webapp.model.User;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(UserServlet.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao userDao = new UserDao();
		User user = null;
		try {
		HttpSession session = request.getSession();
		int idRole = ((Integer) session.getAttribute("role")).intValue();
		if (idRole == 1) {
			user = userDao.getUserInformation(Integer.parseInt(request.getParameter("iduser")));
			if (user == null) {
				request.setAttribute("errorMsg", "User non trovato");
				request.getRequestDispatcher("/userInformation.jsp").forward(request, response);
			} 
			else 
			{
				request.setAttribute("user", user);
				request.getRequestDispatcher("/userInformation.jsp").forward(request, response);
			}
		} 
		else 
		{
			user = userDao.getCustomerUserInformation(Integer.parseInt(request.getParameter("iduser")));
			if (user == null) {
				request.setAttribute("errorMsg", "User non trovato");
				request.getRequestDispatcher("/customerInformation.jsp").forward(request, response);
			} 
			else 
			{
				request.setAttribute("user", user);
				request.getRequestDispatcher("/customerInformation.jsp").forward(request, response);

			}
		} 
		}
		catch (ServletException e) {
			log.log(Level.FINE, e.toString());
		} 
		catch (IOException e) {
			log.log(Level.FINE, e.toString());
		} 
		catch (NumberFormatException e) {
			log.log(Level.FINE, e.toString());
		}

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		final Logger logger = Logger.getLogger(LoginDao.class.getName());
		try {
			HttpSession session = request.getSession();
			int idRole = ((Integer) session.getAttribute("role")).intValue();
			System.out.println(idRole);
			if (idRole == 1) {
				UserDao userDao = new UserDao();
			try{
				
				int idUser = Integer.parseInt(request.getParameter("idUser"));
				String name = request.getParameter("name").trim();
				String surname = request.getParameter("surname").trim();
				String email = request.getParameter("email").trim();
				String userName = request.getParameter("username").trim();
				String telephoneNumber = request.getParameter("telephoneNumber").trim();
				Date birthdayDate = Date.valueOf(request.getParameter("birthdayDate"));
				int result = 0;
				result = userDao.modifyUserInfo(idUser, name, surname, email, userName, telephoneNumber, birthdayDate);				
				if (result == 1) 
				{
					user = userDao.getUserInformation(idUser);
					request.setAttribute("iduser", idUser);
					request.setAttribute("user", user);
					request.setAttribute("successMsg", "Modifica dei dati completata con successo!");
					request.getRequestDispatcher("/userInformation.jsp").forward(request, response);
				}
			} 
			catch (IOException e) 
			{
				logger.log(Level.FINE, e.toString());
			}
		}
		else {
			UserDao userDao = new UserDao();
			try {
				int idUser = ((Integer) session.getAttribute("id")).intValue();
				String name = request.getParameter("name").trim();
				String surname = request.getParameter("surname").trim();
				String email = request.getParameter("email").trim();
				String userName = request.getParameter("username").trim();
				String telephoneNumber = request.getParameter("telephoneNumber").trim();
				String password = request.getParameter("password").trim();
				String new_password = request.getParameter("newPassword").trim();
				Date birthdayDate = Date.valueOf(request.getParameter("birthdayDate"));
				int result = 0;
				if(new_password != null)
					password = new_password;
				result = userDao.modifyCustomerUserInfo(idUser, name, surname, email, userName, telephoneNumber, birthdayDate, password);
				if (result == 1) {
					user = userDao.getUserInformation(idUser);
					request.setAttribute("user", user);
					request.setAttribute("iduser", idUser);
					request.setAttribute("successMsg", "Modifica dei dati completata con successo!");
					request.getRequestDispatcher("/customerInformation.jsp").forward(request, response);
				}
			} catch (IOException e) {
				logger.log(Level.FINE, e.toString());
			}catch (ServletException e) {
				logger.log(Level.FINE, e.toString());
			}
		}
		}
			catch (ServletException e) 
			{
				logger.log(Level.FINE, e.toString());
			} 
			catch (NumberFormatException e) 
			{
				logger.log(Level.FINE, e.toString());
			}
		}
	
	}

