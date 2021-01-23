package main.webapp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import main.webapp.model.User;
import main.webapp.util.ConnectionResult;
import main.webapp.util.DBConnection;

public class LoginDao {

	private ConnectionResult result;

	public ConnectionResult authenticateUser(User loginBean) throws Exception {
		String userName = loginBean.getUserName();
		String password = PasswordHashing.doHashing(loginBean.getPassword());
		Logger log = Logger.getLogger(LoginDao.class.getName());
		String email = null;
		int idUser = 0;
		int idStore = 0;
		int idRole = 0;

		String userNameDB = null;
		String passwordDB = null;
		result = new ConnectionResult();
		String query_login = "SELECT idUser,idStore, idRole,  Username, Email, Password FROM user where Username = ? OR Email = ?";

		try (Connection con = DBConnection.createConnection();
				PreparedStatement preparedStatement = con.prepareStatement(query_login);) {

			preparedStatement.setString(1, userName);
			preparedStatement.setString(2, userName);
			try (ResultSet resultSet = preparedStatement.executeQuery();) {
				while (resultSet.next()) {
					userNameDB = resultSet.getString("Username");
					email = resultSet.getString("Email");
					idUser = resultSet.getInt("idUser");
					idStore = resultSet.getInt("idStore");
					idRole = resultSet.getInt("idRole");

					passwordDB = PasswordHashing.doHashing(resultSet.getString("Password"));

					if ((userName.equals(userNameDB) && password.equals(passwordDB))
							|| (userName.equals(email) && password.equals(passwordDB))) {
						result.setResult("SUCCESS");
						User u = new User();
						u.setIdUser(idUser);
						u.setIdStore(idStore);
						u.setIdRole(idRole);
						result.setUser(u);
						System.out.println("OK");

						return result;
					}
				}
				result.setResult("Invalid user credentials");

			} catch (Exception e) {
				log.log(Level.FINE, e.toString());
			}

		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}

		return result;

	}
}