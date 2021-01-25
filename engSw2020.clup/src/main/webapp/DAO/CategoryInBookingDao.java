package main.webapp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import main.webapp.util.DBConnection;

public class CategoryInBookingDao {
	private final static Logger log = Logger.getLogger(CategoryInBookingDao.class.getName());
	public int insertCategory(int idBooking, int idCategory) {
		String query = "INSERT INTO categoryinbooking(idCategory,idBooking) VALUES(?,?)";
		int result = 0;
		try(Connection con = DBConnection.createConnection();
			Statement statement = con.createStatement();
			PreparedStatement preparedStatement = con.prepareStatement(query)){
			preparedStatement.setInt(1, idCategory);
			preparedStatement.setInt(2, idBooking);
			result=preparedStatement.executeUpdate();
			return result;
		}
		catch(Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return result;
	}
}
