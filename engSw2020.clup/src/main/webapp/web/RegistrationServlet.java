package main.webapp.web;
import java.sql.Date;
import java.text.SimpleDateFormat;  
import main.webapp.DAO.*;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.webapp.model.User;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private RegistrationDao userDao;

	private static Logger logger = Logger.getLogger(LoginServlet.class.getName());

    public RegistrationServlet() {
        super();
    }
    
    public void init() {
    	userDao  = new RegistrationDao();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int result = 0;

        if(request.getParameter("btn_register")!=null) {
        	String name = request.getParameter("Name");
            String surname = request.getParameter("Surname");
            String sesso = request.getParameter("Sesso");
            String telephoneNumber = request.getParameter("TelephoneNumber");
            String email = request.getParameter("Email");
            String username = request.getParameter("Username");
            String password = request.getParameter("Password");
            String str_date = request.getParameter("BirthdayDate");
        	Date date=Date.valueOf(str_date);
            User user = new User();
            user.setName(name);
            user.setSurname(surname);
            user.setBirthdayDate(date);
            user.setTelephoneNumber(telephoneNumber);
            user.setSesso(sesso);
            user.setEmail(email);
            user.setUserName(username);
            user.setPassword(password);
            try {
            	result = userDao.registerEmployee(user);
            } catch (Exception e) {
            	logger.log(Level.FINE, e.toString());
            }
            
    		request.setAttribute("successMsg","Register Successfully...! Please login"); //register success messeage            
            if(result == 1) 
            {
            	request.setAttribute("successMsg", "Registrazione effettuata con successo");
            	request.getRequestDispatcher("successSignUp.jsp").forward(request, response);
    			
            }
            else
            {
            	request.setAttribute("errorMsg", "Errore durante la registrazione. Riprovare!");
            	request.getRequestDispatcher("successSignUp.jsp").forward(request, response);
            	
            }     
        }
	}

}
