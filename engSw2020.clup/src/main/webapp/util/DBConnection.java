package main.webapp.util;
import java.sql.Connection;
import java.sql.DriverManager;
<<<<<<< HEAD
import java.util.Properties;
=======
>>>>>>> refs/remotes/origin/develop_RegistrationPage
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {
	public static Connection createConnection()
	 {
	     Connection con = null;
	     Properties props = new Properties();
	     props.setProperty("username", "root");
	     props.setProperty("password", "");
	     String url = "jdbc:mysql://localhost:3306/Clup_engsw2020?serverTimezone=UTC"; 
<<<<<<< HEAD
=======
	     String username = "root"; 
	     String password = ""; 
>>>>>>> refs/remotes/origin/develop_RegistrationPage
	     Logger logger = Logger.getLogger(DBConnection.class.getName());
	     try 
	     {
	         try 
	         {
	            Class.forName("com.mysql.jdbc.Driver"); 
	         } 
	         catch (ClassNotFoundException e)
	         {
	        	 logger.log(Level.FINE,e.toString());
	         } 
	         con = DriverManager.getConnection(url, props); //NOSONAR
	         System.out.println("Printing connection object "+con);
	     } 
	     catch (Exception e) 
	     {
	        logger.log(Level.FINE,e.toString());
	     }
	     return con; 
	 }

}