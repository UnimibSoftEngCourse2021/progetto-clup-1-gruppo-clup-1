package main.webapp.DAO;
import java.sql.Date;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.logging.Logger;

import main.webapp.model.Booking;
import main.webapp.model.User;
import main.webapp.util.*;
import java.sql.Date;
import java.sql.Date;
import java.sql.Date;

public class RegistrationDao {
    public int registerEmployee(User user) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO User" +
            "  (Name, Surname, BirthdayDate, Sesso, TelephoneNumber, Email, Username, Password, idRole) VALUES " +
            " (?, ?, ?, ?, ?,?,?, ?, ?);";

        int result = 0;

        try {
        	//TODO: modify bugs into sonarqube.
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection connection = DBConnection.createConnection();
        	if(connection == null) return 0;
        	PreparedStatement preparedStatement  = connection.prepareStatement(INSERT_USERS_SQL);
        	preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getSurname());
            preparedStatement.setDate(3, user.getBirthdayDate());
            preparedStatement.setString(4, user.getSesso());
            preparedStatement.setString(5, user.getTelephoneNumber());
            preparedStatement.setString(6, user.getEmail());
            preparedStatement.setString(7, user.getUserName());
            preparedStatement.setString(8, user.getPassword());
            preparedStatement.setInt(9, 1);
        	result = preparedStatement.executeUpdate();
	        System.out.println("Printing result insert: " +result);
	        

        }
        catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
       
        
        return result;
    }
        		

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }

}
    
    
    
    public int insertGuestUser(User user) throws SQLException, ClassNotFoundException {
    	
		   String INSERT_USERS_SQL = "INSERT INTO User" +
		            "  (Name, Surname, TelephoneNumber, Email, guest, idRole) VALUES " +
		            " (?, ?, ?, ?, ?, ?);";

		        int result = 0;

		        try {
		        	Class.forName("com.mysql.jdbc.Driver");
		        	Connection connection = DBConnection.createConnection();
		        	if(connection == null) return 0;
		        	PreparedStatement preparedStatement  = connection.prepareStatement(INSERT_USERS_SQL);
		        	preparedStatement.setString(1, user.getName());
		            preparedStatement.setString(2, user.getSurname());
		            preparedStatement.setString(3, user.getTelephoneNumber());
		            preparedStatement.setString(4, user.getEmail());
		            preparedStatement.setInt(5, 1);
		            preparedStatement.setInt(6, 2);

		        	result = preparedStatement.executeUpdate();
			        System.out.println("Printing guest result insert: " +result);
			        

		        }
		        catch (SQLException e) {
		            // process sql exception
		            printSQLException(e);
		        }
		       
		        
		        return result;
		  
	}
    
    
    
    
	public int getGuestUserId(String email){
		  
		  Connection con = null;
	      Statement statement = null;
	      ResultSet resultSet = null;
	      int id = 0;
	      try {
	    	  con = DBConnection.createConnection(); 
	          statement = con.createStatement();
	          String query = "SELECT idUser FROM clup_engsw2020.user Where email = ?"; 
	          PreparedStatement preparedStatement  = con.prepareStatement(query);
	      	  preparedStatement.setString(1, email);
	      	  resultSet = preparedStatement.executeQuery(); 
	          while(resultSet.next()) {
	        	  id = resultSet.getInt("idUser");
	        	 
	          }
	          return id;
	      }
	      catch(Exception e){
	    	  e.printStackTrace();
	      }
	      return id;
	}
}