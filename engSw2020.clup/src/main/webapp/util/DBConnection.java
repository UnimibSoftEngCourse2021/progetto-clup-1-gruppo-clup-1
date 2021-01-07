package main.webapp.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {
	public static Connection createConnection()
	 {
	     Connection con = null;
	     String url ="jdbc:mysql://clup.mysql.database.azure.com:3306/clup_engsw2020?serverTimezone=UTC&useSSL=true&requireSSL=false";
	     String username = "elvis@clup"; 
	     String password = "@Engsw2020"; 
	     Logger logger = Logger.getLogger(DBConnection.class.getName());
	     try 
	     {
	         try 
	         {
	            Class.forName("com.mysql.cj.jdbc.Driver"); 
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