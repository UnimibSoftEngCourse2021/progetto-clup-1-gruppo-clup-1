package main.webapp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import main.webapp.model.User;
import main.webapp.util.DBConnection;

public class RegistrationDao {
	private final static Logger log = Logger.getLogger(LoginDao.class.getName());

	public int registerEmployee(User user) throws ClassNotFoundException {
		String insert_user_sql = "INSERT INTO User"
				+ "  (Name, Surname, BirthdayDate, Sesso, TelephoneNumber, Email, Username, Password, idRole) VALUES "
				+ " (?, ?, ?, ?, ?,?,?, ?, ?);";

		int result = 0;

		try (Connection connection = DBConnection.createConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(insert_user_sql)) {

			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getSurname());
			preparedStatement.setDate(3, user.getBirthdayDate());
			preparedStatement.setString(4, user.getSesso());
			preparedStatement.setString(5, user.getTelephoneNumber());
			preparedStatement.setString(6, user.getEmail());
			preparedStatement.setString(7, user.getUserName());
			preparedStatement.setString(8, user.getPassword());
			preparedStatement.setInt(9, 1);
			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			log.log(Level.FINE, e.toString());
		}

		return result;
	}

	public int insertGuestUser(User user) throws SQLException, ClassNotFoundException {

		String insert_user_sql = "INSERT INTO User" + "  (Name, Surname, TelephoneNumber, Email, guest, idRole) VALUES "
				+ " (?, ?, ?, ?, ?, ?);";

		int result = 0;

		try (Connection connection = DBConnection.createConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(insert_user_sql)) {

			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getSurname());
			preparedStatement.setString(3, user.getTelephoneNumber());
			preparedStatement.setString(4, user.getEmail());
			preparedStatement.setInt(5, 1);
			preparedStatement.setInt(6, 2);

			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			log.log(Level.FINE, e.toString());
		}

		return result;

	}

	public int getGuestUserId(String email) {

		String query = "SELECT idUser FROM clup_engsw2020.user Where email = ?";

		int id = 0;
		try (Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStatement = con.prepareStatement(query)) {

			preparedStatement.setString(1, email);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					id = resultSet.getInt("idUser");

				}
				return id;
			}

		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return id;
	}
}