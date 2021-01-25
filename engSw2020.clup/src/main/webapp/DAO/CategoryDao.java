package main.webapp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import main.webapp.model.Category;
import main.webapp.util.DBConnection;

public class CategoryDao {

	private final static Logger log = Logger.getLogger(CategoryDao.class.getName());

	public ArrayList<Category> getCategory(int idStoreUser) throws SQLException {

		ArrayList<Category> categoryList = new ArrayList<Category>();
		String query = "SELECT category.idCategory, Name, Description FROM category INNER JOIN categoryinstore ON category.idCategory = categoryinstore.idCategory WHERE idStore = ?";

		try (Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStatement = con.prepareStatement(query)) {

			preparedStatement.setInt(1, idStoreUser);

			try (ResultSet resultSet = preparedStatement.executeQuery()) {

				while (resultSet.next()) {
					Category categoryBean = new Category();
					categoryBean.setIdCategory(resultSet.getInt("idCategory"));
					categoryBean.setName(resultSet.getString("Name"));
					categoryBean.setDescription(resultSet.getString("Description"));
					categoryBean.setIdStore(idStoreUser);

					categoryList.add(categoryBean);
				}
				return categoryList;
			} catch (Exception e) {
				log.log(Level.FINE, e.toString());
			}

		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}

		return categoryList;

	}

	public int deleteCategory(int Idcategory) throws SQLException {
		String query = "DELETE FROM category WHERE idCategory = ?";
		int result = 0;
		try (Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStatement = con.prepareStatement(query)) {
			preparedStatement.setInt(1,  Idcategory);
			result = preparedStatement.executeUpdate();
			return result;
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}

		return result;
	}

	public ArrayList<Category> getAllCategory(int idStoreUser) throws SQLException {
		ArrayList<Category> categoryList = new ArrayList<Category>();
		String query = "SELECT category.idCategory, category.Name, category.Description FROM category WHERE category.idCategory NOT IN(SELECT idCategory FROM categoryinstore WHERE idStore = ? AND idCategory is not null)";

		try (Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStatement = con.prepareStatement(query)) {

			preparedStatement.setInt(1, idStoreUser);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Category categoryBean = new Category();
					categoryBean.setIdCategory(resultSet.getInt("idCategory"));
					categoryBean.setName(resultSet.getString("Name"));
					categoryBean.setDescription(resultSet.getString("Description"));
					categoryList.add(categoryBean);
				}
				return categoryList;
			} catch (Exception e) {
				log.log(Level.FINE, e.toString());
			}
		}

		catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return categoryList;
	}

	public int insertCategory(int idStore, int idCategory) throws SQLException {
		String insert_users_sql = "INSERT INTO categoryinstore" + "  (idStore, idCategory) VALUES " + " (?, ?);";
		int result = 0;
		try (Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStatement = con.prepareStatement(insert_users_sql)) {
			preparedStatement.setInt(1, idStore);
			preparedStatement.setInt(2, idCategory);
			result = preparedStatement.executeUpdate();
			return result;
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return result;
	}

	public int getIdCategoryByName(String name) throws SQLException {
		int id = 0;
		String query_insert = "SELECT idCategory FROM category WHERE Name =  ?";

		try (Connection con = DBConnection.createConnection();
				PreparedStatement preparedStatement = con.prepareStatement(query_insert)) {

			preparedStatement.setString(1, name);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					id = resultSet.getInt("idCategory");
				}
				return id;
			} catch (Exception e) {
				log.log(Level.FINE, e.toString());
			}

		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return id;
	}
	
	public int getMaxIdCategory(int idStore) {
		int max=0;
		String query ="SELECT MAX(categoryinbooking.idCategory) AS maxCategory FROM category INNER JOIN categoryinbooking on category.idCategory = categoryinbooking.idCategory INNER JOIN booking ON categoryinbooking.idBooking=booking.idBooking WHERE bookingDate=current_date() AND booking.idStore=?";
		try(Connection con = DBConnection.createConnection();
			Statement statement = con.createStatement();
			PreparedStatement preparedStmt = con.prepareStatement(query);)
		{
			preparedStmt.setInt(1, idStore);
			try(ResultSet rs = preparedStmt.executeQuery();) 
			{
				while(rs.next()) 
				{
					max=rs.getInt("maxCategory");
				}
			}
			catch(Exception e) 
			{
				log.log(Level.FINE, e.toString());
			}
			return max;
		}
		catch(Exception e) 
		{
			log.log(Level.FINE, e.toString());
		}
		return max;
	}
	
	public String getNameFromId(int idCategory) {
		String name = "";
		String query="SELECT category.Name FROM category WHERE idCategory = ?";
		try(Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStmt = con.prepareStatement(query);)
			{
				preparedStmt.setInt(1, idCategory);
				try(ResultSet rs = preparedStmt.executeQuery();) 
				{
					while(rs.next()) 
					{
						name=rs.getString("Name");
					}
				}
				catch(Exception e) 
				{
					log.log(Level.FINE, e.toString());
				}
				return name;
			}
			catch(Exception e) 
			{
				log.log(Level.FINE, e.toString());
			}
			return name;
	}
}
