package main.webapp.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import main.webapp.model.User;
import main.webapp.util.DBConnection;

public class UserDao {
	private final static Logger log = Logger.getLogger(LoginDao.class.getName());

	public int modifyUserPassword(String userName, String password, String email) {
		String query = "UPDATE user SET password = ? WHERE Username = ? and Email = ?";
		// String query = "UPDATE user SET password=" + "\"" + password + "\"" + " WHERE
		// Username="+ "\"" + userName + "\"" + "and Email=" + "\"" + email + "\"";
		System.out.println(query);
		int result = 0;
		try (Connection con = DBConnection.createConnection();
				PreparedStatement preparedStatement = con.prepareStatement(query)) {
			preparedStatement.setString(1, password);
			preparedStatement.setString(2, userName);
			preparedStatement.setString(3, email);
			result = preparedStatement.executeUpdate();
			return result;
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return result;
	}

	public User getUserInformation(int idUser) {

		User user = null;
		String query = "SELECT * FROM user WHERE idUser = ?";
		try (Connection con = DBConnection.createConnection();
				PreparedStatement preparedStatement = con.prepareStatement(query)) {
			preparedStatement.setInt(1, idUser);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					user = new User();
					user.setBirthdayDate(resultSet.getDate("BirthdayDate"));
					user.setEmail(resultSet.getString("Email"));
					user.setName(resultSet.getString("Name"));
					user.setSurname(resultSet.getString("Surname"));
					user.setTelephoneNumber(resultSet.getString("TelephoneNumber"));
					user.setUserName(resultSet.getString("Username"));
					user.setPassword(resultSet.getString("Password"));
				}
				return user;
			} catch (Exception e) {
				log.log(Level.FINE, e.toString());
			}

		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return user;

	}

	public User getCustomerUserInformation(int idUser) {
		User user = null;
		String query = "SELECT * FROM user WHERE idUser = ?";
		try (Connection con = DBConnection.createConnection();
				PreparedStatement preparedStatement = con.prepareStatement(query)) {
			preparedStatement.setInt(1, idUser);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					user = new User();
					user.setBirthdayDate(resultSet.getDate("BirthdayDate"));
					user.setEmail(resultSet.getString("Email"));
					user.setName(resultSet.getString("Name"));
					user.setSurname(resultSet.getString("Surname"));
					user.setTelephoneNumber(resultSet.getString("TelephoneNumber"));
					user.setUserName(resultSet.getString("Username"));
					user.setPassword(resultSet.getString("Password"));

				}
				return user;
			} catch (Exception e) {
				log.log(Level.FINE, e.toString());
			}

		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return user;

	}

	public int modifyUserInfo(int idUser, String name, String surname, String email, String userName,
			String telephoneNumber, Date birthdayDate) {
		String query = "UPDATE user SET Name = ? , Surname = ? , BirthdayDate = ? ,TelephoneNumber = ?, Email = ?, Username = ? WHERE idUser = ?";
//		String query = "UPDATE user SET Name=" + "\"" + name + "\"" + "," + " Surname=" + "\"" + surname + "\"" + ","
//				+ " BirthdayDate=" + "\"" + birthdayDate + "\"" + "," + " TelephoneNumber=" + "\"" + telephoneNumber
//				+ "\"" + "," + " Email=" + "\"" + email + "\"" + "," + " Username=" + "\"" + userName + "\""
//				+ " WHERE idUser=" + idUser;
		int result = 0;
		try (Connection con = DBConnection.createConnection();
				PreparedStatement preparedStatement = con.prepareStatement(query);) {
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, surname);

			preparedStatement.setDate(3, birthdayDate);

			preparedStatement.setString(4, telephoneNumber);

			preparedStatement.setString(5, email);

			preparedStatement.setString(6, userName);

			preparedStatement.setInt(7, idUser);
			result = preparedStatement.executeUpdate();
			return result;
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return result;
	}

	public int modifyCustomerUserInfo(int idUser, String name, String surname, String email, String userName,
			String telephoneNumber, Date birthdayDate, String passowrd) {
		String query = "UPDATE user SET Name = ? , Surname = ? , BirthdayDate = ? ,TelephoneNumber = ?, Email = ?, Username = ? , Password = ? WHERE idUser = ?";
//
//		String query = "UPDATE user SET Name=" + "\"" + name + "\"" + "," + " Surname=" + "\"" + surname + "\"" + ","
//				+ " BirthdayDate=" + "\"" + birthdayDate + "\"" + "," + " TelephoneNumber=" + "\"" + telephoneNumber
//				+ "\"" + "," + " Email=" + "\"" + email + "\"" + "," + " Username=" + "\"" + userName + "\""
//				+ ", Password=" + "\"" + passowrd + "\"" + " WHERE idUser=" + idUser;
		System.out.println(query);
		int result = 0;
		try (Connection con = DBConnection.createConnection();
				PreparedStatement preparedStatement = con.prepareStatement(query);) {
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, surname);
			preparedStatement.setDate(3, birthdayDate);
			preparedStatement.setString(4, telephoneNumber);
			preparedStatement.setString(5, email);
			preparedStatement.setString(6, userName);
			preparedStatement.setString(7, passowrd);
			preparedStatement.setInt(8, idUser);
			result = preparedStatement.executeUpdate();
			return result;
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return result;
	}
}
