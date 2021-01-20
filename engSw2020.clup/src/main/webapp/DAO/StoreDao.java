package main.webapp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import main.webapp.model.Booking;
import main.webapp.model.Store;
import main.webapp.model.User;
import main.webapp.util.DBConnection;

public class StoreDao {
	
	public Store getStoreInfo(int idStoreUser) throws SQLException{
		  Store store = new Store();
		  Connection con = null;
	      Statement statement = null;
	      ResultSet resultSet = null;
	      
	      try{        	 
	    	  

	          con = DBConnection.createConnection(); 
	          statement = con.createStatement();
	          String query = "SELECT * FROM clup_engsw2020.store INNER JOIN User ON User.idStore = store.idStore WHERE User.idStore = ? ";
	          
	          	PreparedStatement preparedStatement  = con.prepareStatement(query);
	      		preparedStatement.setInt(1, idStoreUser);
	      		resultSet = preparedStatement.executeQuery(); 
	          while(resultSet.next()) {
	        	  store.setIdStore(resultSet.getInt("idStore"));
	        	  store.setName(resultSet.getString("name"));
	        	  store.setDesprition(resultSet.getString("description"));
	        	  store.setTelephoneNumber(resultSet.getString("telephoneNumber"));
	        	  store.setAddress(resultSet.getString("address"));
	        	  store.setCity(resultSet.getString("city"));
	        	  store.setCapacity(resultSet.getInt("capacity"));
	        	  store.setBookableCapacity(resultSet.getInt("bookableCapacity"));

	          }
	          return store;
	       }
	      		
	      catch(Exception e)
	      {
	    	  e.printStackTrace();
	      }
	      finally {
	    	  con.close();
	    	  statement.close();
	    	  resultSet.close();
	      }
		return store;
		}
	public int updateData(Store store) throws SQLException{
		  Connection con = null;
	      Statement statement = null;
	      ResultSet resultSet = null;
	      int result = 0;
	      try{        	 
	          con = DBConnection.createConnection(); 
	          statement = con.createStatement();
	 	        System.out.println(store.getDesprition());
	 	        System.out.println(store.getIdStore());
	          String query = "update store set description = ?, telephoneNumber = ?, address = ?, city = ?, capacity = ?, bookableCapacity = ? where idStore = ?";
	          PreparedStatement preparedStmt = con.prepareStatement(query);
	          preparedStmt.setString(1, store.getDesprition());
	          preparedStmt.setString(2, store.getTelephoneNumber());
	          preparedStmt.setString(3, store.getAddress());
	          preparedStmt.setString(4, store.getCity());
	          preparedStmt.setInt(5, store.getCapacity());
	          preparedStmt.setInt(6, store.getBookableCapacity());
	          preparedStmt.setInt(7, store.getIdStore());
	          result = preparedStmt.executeUpdate();	

	          return result;
	       }
	      		
	      catch(Exception e)
	      {
	    	  e.printStackTrace();
	      }
	      finally {
	    	  con.close();
	    	  statement.close();
	      }
		return result;
		}

}
