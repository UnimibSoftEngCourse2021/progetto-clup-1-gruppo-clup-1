package main.webapp.web;

import main.webapp.DAO.*;
import main.webapp.model.User;
import main.webapp.util.ConnectionResult;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static Logger logger = Logger.getLogger(LoginServlet.class.getName());
    public LoginServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String userName = request.getParameter("username");
        String password = request.getParameter("password");
 
        User loginBean = new User(); 
        loginBean.setUserName(userName); 
        loginBean.setPassword(password);
 
        LoginDao loginDao = new LoginDao(); 
        
        try {
        ConnectionResult userValidate = loginDao.authenticateUser(loginBean);  
        if(userValidate.getResult().equals("SUCCESS") && userValidate.getUser().getIdRole() == 1) 
         {
        	HttpSession session = request.getSession();
            session.setAttribute("id", userValidate.getUser().getIdUser());
            session.setAttribute("idStore", userValidate.getUser().getIdStore());
             request.setAttribute("userName", userName); 
             request.getRequestDispatcher("/homepageManager.jsp").forward(request, response);
         }
        else if (userValidate.getResult().equals("Invalid connection"))
        {
        	request.setAttribute("errorMsg","Connessione non riuscita al database."); 
        	request.setAttribute("errMessage", userValidate);
        	request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
         else
         {
        	 request.setAttribute("errorMsg","Email o Password errati."); 
             request.setAttribute("errMessage", userValidate); 
             request.getRequestDispatcher("/index.jsp").forward(request, response);
         }
        }
        catch(Exception e){
        	logger.log(Level.WARNING, e.toString());
        }
	}

}