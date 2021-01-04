package main.webapp.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {
	public static Connection createConnection()
	 {
	     Connection con = null;
	     String url = "jdbc:mysql://localhost:3306/Clup_engsw2020?serverTimezone=UTC"; 
	     String username = "root"; 
	     String password = ""; 
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
	         con = DriverManager.getConnection(url, username, password); 
	         System.out.println("Printing connection object "+con);
	     } 
	     catch (Exception e) 
	     {
	        logger.log(Level.FINE,e.toString());
	     }
	     return con; 
	 }

}