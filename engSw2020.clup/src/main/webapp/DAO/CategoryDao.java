package main.webapp.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import main.webapp.model.Category;

import main.webapp.model.Booking;
import main.webapp.model.User;
import main.webapp.util.DBConnection;

public class CategoryDao {
	
	
	public ArrayList<Category> getCategory(int idStoreUser) throws SQLException{
		  ArrayList<Category> categoryList = new ArrayList<Category>();
		  Connection con = null;
	      Statement statement = null;
	      ResultSet resultSet = null;
	      
	      try{        	 

	          con = DBConnection.createConnection(); 
	          statement = con.createStatement();
	          String query = "SELECT category.idCategory, Name, Description FROM category INNER JOIN categoryinstore ON category.idCategory = categoryinstore.idCategory WHERE idStore = ?";
	          		
	          
	          	PreparedStatement preparedStatement  = con.prepareStatement(query);
	      		preparedStatement.setInt(1, idStoreUser);

	      		resultSet = preparedStatement.executeQuery(); 
	          while(resultSet.next()) {
	        	  Category categoryBean = new Category();
	        	  User user = new User();
	        	  categoryBean.setIdCategory(resultSet.getInt("idCategory"));
	        	  categoryBean.setName(resultSet.getString("Name"));
	        	  categoryBean.setDescription(resultSet.getString("Description"));
	        	  categoryBean.setIdStore(idStoreUser);

	        	  categoryList.add(categoryBean);
	          }
	          return categoryList;
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
		return categoryList;
		}
	
	
	
	public int deleteCategory(int Idcategory) throws SQLException {
		String query = "DELETE FROM category WHERE idCategory =" + Idcategory;
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
	     finally {
	    	 con.close();
	    	 statement.close();
	     }
	     return result;
	}
	
	public ArrayList<Category> getAllCategory() throws SQLException{
		  ArrayList<Category> categoryList = new ArrayList<Category>();
		  Connection con = null;
	      Statement statement = null;
	      ResultSet resultSet = null;
	      try{        	 

	          con = DBConnection.createConnection(); 
	          statement = con.createStatement();
	          String query = "SELECT * FROM category";
	          statement = con.createStatement();
	          resultSet = statement.executeQuery(query);
	          while(resultSet.next()) {
	        	  Category categoryBean = new Category();
	        	  categoryBean.setIdCategory(resultSet.getInt("idCategory"));
	        	  categoryBean.setName(resultSet.getString("Name"));
	        	  categoryBean.setDescription(resultSet.getString("Description"));
	        	  categoryList.add(categoryBean);
	          }
	          return categoryList;
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
		return categoryList;
		}
	
	
	public int insertCategory(int idStore, int idCategory) throws SQLException {
	        System.out.println("CIAOOOOOOOOOOOOO");
	        String INSERT_USERS_SQL = "INSERT INTO categoryinstore" +
	                "  (idStore, idCategory) VALUES " +
	                " (?, ?);";
		  Connection con = null;
		  Statement statement = null;
		  con = DBConnection.createConnection(); 

		  PreparedStatement preparedStatement  = con.prepareStatement(INSERT_USERS_SQL);
  		preparedStatement.setInt(1, 1);
  		preparedStatement.setInt(2, 9);
		  int result = 0;
		  try {
		    	con = DBConnection.createConnection();
		    	statement = con.createStatement();
		    	result = preparedStatement.executeUpdate();
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
	
	
	
	public int getIdCategoryByName(String name) throws SQLException{
		  Connection con = null;
	      Statement statement = null;
	      ResultSet resultSet = null;
	      int id = 0;
	      try{        	 

	          con = DBConnection.createConnection(); 
	          statement = con.createStatement();
	          String query = "SELECT idCategory FROM category WHERE Name = " + name;
	          statement = con.createStatement();
	          resultSet = statement.executeQuery(query);
	          while(resultSet.next()) {
	        	   id = resultSet.getInt("idCategory");
	          }
	          return id;
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
		return id;
		}

}
