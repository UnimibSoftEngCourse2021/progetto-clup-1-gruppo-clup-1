package main.webapp.DAO;

import main.webapp.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import main.webapp.model.User;
import main.webapp.util.*;

public class LoginDao {
	
    public String authenticateUser(User loginBean) throws Exception 
    {
        String userName = loginBean.getUserName(); 
        String password = PasswordHashing.doHashing(loginBean.getPassword());
        Logger log = Logger.getLogger(LoginDao.class.getName());
        String email = null;
       
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String userNameDB = null;
        String passwordDB = null;

        try{
        	String query_login = "SELECT Username, Email, Password FROM user where Username = ? OR Email = ?";


            con = DBConnection.createConnection(); 
        	PreparedStatement preparedStatement  = con.prepareStatement(query_login);
        	preparedStatement.setString(1, userName);
        	preparedStatement.setString(2, userName);

            resultSet = preparedStatement.executeQuery(); 

            while(resultSet.next()) 
            {
             userNameDB = resultSet.getString("Username"); 
             email = resultSet.getString("Email");
 	        System.out.println(email);

             passwordDB = PasswordHashing.doHashing(resultSet.getString("Password"));

              if((userName.equals(userNameDB) && password.equals(passwordDB)) || (userName.equals(email) && password.equals(passwordDB)))
              {
                 return "SUCCESS"; 
              }
            }}
            catch(Exception e)
            {
               log.log(Level.FINE, e.toString());
            }
        	
         finally {
        	 if(con!=null) {con.close();}
        	 if(statement!=null) {statement.close();}
        	 if(resultSet!=null) {resultSet.close();}        		
        	}
            return "Invalid user credentials";
        }
    }