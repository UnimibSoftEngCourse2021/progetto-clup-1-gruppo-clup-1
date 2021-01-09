package main.webapp.DAO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.*;
import java.util.ArrayList;

import main.webapp.model.Booking;
import main.webapp.util.*;

public class BookingDao {

	public ArrayList<Booking> getBooking(){
	  ArrayList<Booking> bookingList = new ArrayList<Booking>();
	  Connection con = null;
      Statement statement = null;
      ResultSet resultSet = null;
      
      try{        	 

          con = DBConnection.createConnection(); 
          statement = con.createStatement(); 
          resultSet = statement.executeQuery("select * from Booking");
          while(resultSet.next()) {
        	  Booking bookingBean = new Booking();
        	  bookingBean.setIdBooking(resultSet.getInt("idBooking"));
        	  bookingBean.setNumber(resultSet.getInt("Number"));
        	  bookingBean.setBookingDate(resultSet.getDate("bookingDate"));
        	  bookingBean.setArrivalTime(resultSet.getTime("ArrivalTime"));
        	  bookingBean.setFinishTime(resultSet.getTime("FinishTime"));
        	  bookingList.add(bookingBean);
          }
          return bookingList;
       }
      		
      catch(Exception e)
      {
    	  e.printStackTrace();
      }
	return bookingList;
	}
	
	public int deleteBooking(int idBooking) {
		String query = "DELETE FROM booking WHERE idBooking =" + idBooking;
		 Connection con = null;
	     Statement statement = null;
	     int result = 0;
	     try {
	    	  con = DBConnection.createConnection(); 
	          statement = con.createStatement(); 
	          result = statement.executeUpdate(query);
	          return result;
	     }		
		 catch(Exception e){
			e.printStackTrace();
		}
	     return result;
	}
}

