package main.webapp.web;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
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

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao userDao = new UserDao();
		User user = null;
		HttpSession session = request.getSession();
		int idRole = ((Integer) session.getAttribute("role")).intValue();
		if (idRole == 1) {
			user = userDao.getUserInformation(Integer.parseInt(request.getParameter("iduser")));
			if (user == null) {
				request.setAttribute("errorMsg", "User non trovato");
				request.getRequestDispatcher("/homepageManager.jsp").forward(request, response);
			} else {
				request.setAttribute("user", user);
				request.getRequestDispatcher("/userInformation.jsp").forward(request, response);
			}
		} else {
			user = userDao.getCustomerUserInformation(Integer.parseInt(request.getParameter("iduser")));
			if (user == null) {
				request.setAttribute("errorMsg", "User non trovato");
				request.getRequestDispatcher("/homepageCustomer.jsp").forward(request, response);
			} else {
				request.setAttribute("user", user);
				

				request.getRequestDispatcher("/customerInformation.jsp").forward(request, response);
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final Logger logger = Logger.getLogger(LoginDao.class.getName());
		HttpSession session = request.getSession();
		int idRole = ((Integer) session.getAttribute("role")).intValue();
		System.out.println(idRole);
		if (idRole == 1) {

			UserDao userDao = new UserDao();
			try {
				int idUser = Integer.parseInt(request.getParameter("idUser"));
				String name = request.getParameter("name").trim();
				String surname = request.getParameter("surname").trim();
				String email = request.getParameter("email").trim();
				String userName = request.getParameter("username").trim();
				String telephoneNumber = request.getParameter("telephoneNumber").trim();
				Date birthdayDate = Date.valueOf(request.getParameter("birthdayDate"));
				int result = 0;
				result = userDao.modifyUserInfo(idUser, name, surname, email, userName, telephoneNumber, birthdayDate);
				if (result == 1) {
					request.setAttribute("iduser", idUser);
					request.getRequestDispatcher("/homepageManager.jsp").forward(request, response);
				}
			} catch (IOException e) {
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
					request.setAttribute("iduser", idUser);
					request.setAttribute("successMsgModifyData", "Modifica dei dati completata con successo!");
					request.getRequestDispatcher("/homepageCustomer.jsp").forward(request, response);
				}
			} catch (IOException e) {
				logger.log(Level.FINE, e.toString());
			}
		}

	}

}
