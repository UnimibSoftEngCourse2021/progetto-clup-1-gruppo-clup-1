package main.webapp.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import main.webapp.model.User;
import main.webapp.util.*;

public class LoginDao {
	
    public String authenticateUser(User loginBean)
    {
        String userName = loginBean.getUserName(); 
        String password = loginBean.getPassword();

        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String userNameDB = "";
        String passwordDB = "";

        try
        {
            con = DBConnection.createConnection(); 
            if(con == null)
            {
            	return "Invalid connection";
            }
            statement = con.createStatement(); 
            resultSet = statement.executeQuery("select userName,password from users"); 

            while(resultSet.next()) 
            {
             userNameDB = resultSet.getString("userName"); 
             passwordDB = resultSet.getString("password");

              if(userName.equals(userNameDB) && password.equals(passwordDB))
              {
                 return "SUCCESS"; 
              }
            }}
            catch(SQLException e)
            {
               e.printStackTrace();
            }
            return "Invalid user credentials";
        }
    }
