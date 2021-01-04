package main.webapp.DAO;

import main.webapp.util.*;
import java.sql.Connection;
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
       
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String userNameDB = null;
        String passwordDB = null;

        try/*(
        		Connection con = DBConnection.createConnection(); 
        		Statement statement = con.createStatement(); 
        		ResultSet resultSet = statement.executeQuery("select userName,password from users")
        	)*/
        {	 

            con = DBConnection.createConnection(); 
            statement = con.createStatement(); 
            resultSet = statement.executeQuery("select Username, Password from user"); 

            while(resultSet.next()) 
            {
<<<<<<< HEAD
             userNameDB = resultSet.getString("userName"); 
             passwordDB = PasswordHashing.doHashing(resultSet.getString("password"));
=======
             userNameDB = resultSet.getString("Username"); 
             passwordDB = PasswordHashing.doHashing(resultSet.getString("Password"));
>>>>>>> refs/remotes/origin/develop_RegistrationPage

              if(userName.equals(userNameDB) && password.equals(passwordDB))
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