package main.webapp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

}
