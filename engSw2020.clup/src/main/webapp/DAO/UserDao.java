package main.webapp.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;

import main.webapp.model.User;
import main.webapp.util.DBConnection;

public class UserDao {

	public User getUserInformation(int idUser) {
			User user=null;
			String query = "SELECT * FROM user WHERE idUser =" + idUser;
		    Connection con = null;
		    Statement statement = null;
		    ResultSet resultSet = null;
		    try {
		    	con = DBConnection.createConnection();
		    	statement = con.createStatement();
		    	resultSet = statement.executeQuery(query);
		    	while(resultSet.next()) {
		    		user = new User();
		    		user.setBirthdayDate(resultSet.getDate("BirthdayDate"));
		    		user.setEmail(resultSet.getString("Email"));
		        	user.setName(resultSet.getString("Name"));
		        	user.setSurname(resultSet.getString("Surname"));
		        	user.setTelephoneNumber(resultSet.getString("TelephoneNumber"));
		        	user.setUserName(resultSet.getString("Username"));
		    	}
		    	return user;
		    	
		    }
		    catch(Exception e){
		    	e.printStackTrace();
		    }
		    return user;
		    
		
	}
	
	public int modifyBooking(int idUser, String name, String surname, String email, String userName, String telephoneNumber,Date birthdayDate ) {
		String query = "UPDATE user SET Name="+ "\""+name  +"\"" +"," + " Surname="+"\"" +surname+"\"" +"," + " BirthdayDate="+"\"" + birthdayDate +"\"" + "," +  " TelephoneNumber="+"\"" +telephoneNumber+"\"" +","+  " Email="+"\"" +email+"\"" +","+ " Username="+"\"" +userName+"\""  +" WHERE idUser=" + idUser; 
	    Connection con = null;
	    Statement statement = null;
	    ResultSet resultSet = null;
	    int result=0;
	    try {
	    	con = DBConnection.createConnection();
	    	statement = con.createStatement();
	    	result = statement.executeUpdate(query);
	    	return result;
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    return result;
	    }
	}

