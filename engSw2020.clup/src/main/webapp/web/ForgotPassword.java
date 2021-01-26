package main.webapp.web;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.webapp.DAO.UserDao;

/**
 * Servlet implementation class ForgotPassword
 */
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static Logger logger = Logger.getLogger(LoginServlet.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForgotPassword() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int result = 0;
		UserDao userDao = new UserDao();

		if (request.getParameter("btn_register") != null) {
			String username = request.getParameter("Username");
			String password = request.getParameter("Password");
			String email = request.getParameter("Email");
			System.out.println(username);
			System.out.println(password);

			try {
				System.out.println("CIAO");

				result = userDao.modifyUserPassword(username, password, email);
				System.out.println("CIAO");

			} catch (Exception e) {
				System.out.println(e);

				logger.log(Level.FINE, e.toString());
			}
			try {
				if (result == 1) {
					request.setAttribute("successMsg", "Cambio password effettuato con successo");
					request.setAttribute("TitleMsg", "Esito cambio password");
					request.getRequestDispatcher("successSignUp.jsp").forward(request, response);

				} else {
					request.setAttribute("TitleMsg", "Esito cambio password");
					request.setAttribute("errorMsg", "Errore durante il cambio password. Riprovare!");
					request.getRequestDispatcher("successSignUp.jsp").forward(request, response);

				}
			} catch (IOException e) {
				System.out.println(e);

				logger.log(Level.FINE, e.toString());
			}catch (ServletException e) {
				System.out.println(e);

				logger.log(Level.FINE, e.toString());
			}
		}

	}
}
