package main.webapp.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import main.webapp.DAO.ProprertiesDB;

public class DBConnection {
	
	public static String result = "";
	public static Connection createConnection() {
		Connection con = null;
		Logger logger = Logger.getLogger(DBConnection.class.getName());
		String url = "";
		String username = "";
		String password = "";
		try {
			ProprertiesDB  propreties = getPropValues();
			url = propreties.getDbUrl();
			username = propreties.getDbUsername();
			password = propreties.getDbPassword();
		} catch (IOException e) {
			logger.log(Level.FINE, e.toString());
		}

		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");

			} catch (ClassNotFoundException e) {
				logger.log(Level.FINE, e.toString());
			}
			con = DriverManager.getConnection(url, username, password);

			System.out.println("Printing connection object " + con);
		} catch (Exception e) {
			logger.log(Level.FINE, e.toString());
		}
		return con;
	}
	
	
	
	public static ProprertiesDB getPropValues() throws IOException {
		ProprertiesDB properties = new ProprertiesDB();
		String propFileName = "config.properties";

		try(InputStream inputStream = DBConnection.class.getClassLoader().getResourceAsStream(propFileName);
) {
			Properties prop = new Properties();
 
			if (inputStream != null) {
				prop.load(inputStream);
			} else {
				throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
			}
 
			Date time = new Date(System.currentTimeMillis());
 
			// get the property value and print it out
			String user = prop.getProperty("user");
			String pwd = prop.getProperty("passowrd");
			String url = prop.getProperty("url");
			
			properties.setDbPassword(pwd);
			properties.setDbUrl(url);
			properties.setDbUsername(user);


			result = "Company List = " + properties.getDbPassword() + ", " + properties.getDbUrl() + ", ";
			System.out.println(result + "\nProgram Ran on " + time + " by user=" + user);
		} catch (Exception e) {
			System.out.println("Exception: " + e);
		}
		return properties;
	}
	

}