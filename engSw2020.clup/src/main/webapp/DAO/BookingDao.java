package main.webapp.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import main.webapp.model.Booking;
import main.webapp.model.Store;
import main.webapp.model.User;
import main.webapp.util.DBConnection;

public class BookingDao {
	private final static Logger log = Logger.getLogger(BookingDao.class.getName());

	public ArrayList<Booking> getBooking(int idStoreUser) throws SQLException {
		ArrayList<Booking> bookingList = new ArrayList<Booking>();

		String query = "Select Name, Surname, Email,  TelephoneNumber, idBooking, bookingDate, ArrivalTime, FinishTime "
				+ "FROM User INNER JOIN clup_engsw2020.Booking ON " + "User.idUser = clup_engsw2020.booking.idUser "
				+ "WHERE booking.idStore = ? ORDER BY bookingDate ";
		try (Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStatement = con.prepareStatement(query)) {

			preparedStatement.setInt(1, idStoreUser);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {

				while (resultSet.next()) {
					Booking bookingBean = new Booking();
					User user = new User();
					bookingBean.setIdBooking(resultSet.getInt("idBooking"));
					bookingBean.setBookingDate(resultSet.getDate("bookingDate"));
					bookingBean.setArrivalTime(resultSet.getTime("ArrivalTime"));
					bookingBean.setFinishTime(resultSet.getTime("FinishTime"));
					user.setEmail(resultSet.getString("Email"));
					user.setName(resultSet.getString("Name"));
					user.setSurname(resultSet.getString("Surname"));
					user.setTelephoneNumber(resultSet.getString("TelephoneNumber"));
					bookingBean.setUser(user);
					bookingList.add(bookingBean);
				}
				return bookingList;
			} catch (Exception e) {
				log.log(Level.FINE, e.toString());

			}
		}

		catch (Exception e) {
			log.log(Level.FINE, e.toString());

		}
		return bookingList;
	}

	public int deleteBooking(int idBooking) throws SQLException {
		String query = "DELETE FROM booking WHERE idBooking = ? ";
		int result = 0;
		try (Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStatement = con.prepareStatement(query)) {
			preparedStatement.setInt(1, idBooking);

			result = preparedStatement.executeUpdate();
			return result;
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return result;
	}

	
	
	public int modifyBooking(int id, Date date, Time arrivalTime, Time finishTime) throws SQLException {
		String query = "UPDATE booking SET ArrivalTime = ?, FinishTime = ?, bookingDate = ? WHERE idBooking = ? ";
		int result = 0;
		int idStore = this.getIdStoreFromBooking(id);
		if(checkAvailability(idStore,arrivalTime,finishTime,date)) 
		{
			try (Connection con = DBConnection.createConnection();
					Statement statement = con.createStatement();
					PreparedStatement preparedStatement = con.prepareStatement(query)) 
			{

				preparedStatement.setTime(1, arrivalTime);
				preparedStatement.setTime(2, finishTime);
				preparedStatement.setDate(3, date);
				preparedStatement.setInt(4, id);
				result = preparedStatement.executeUpdate();
				System.out.println("CIAO");
			
				return result;
			} 
			catch (Exception e) 
			{
				log.log(Level.FINE, e.toString());
			}
		}
		return result;
	}
	
	
	
	public int[] insertBooking(Date date, Time arrivalTime, Time finishTime, int idStore, int idUser)
			throws SQLException {
		int[] result = new int[2];
		if(checkAvailability(idStore,arrivalTime,finishTime,date)) {
		String query = "INSERT INTO booking" + "  (ArrivalTime, FinishTime, idUser, bookingDate, idStore) VALUES "
				+ " (?, ?, ?, ?, ?);";
		
		try (Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStatement = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setTime(1, arrivalTime);
			preparedStatement.setTime(2, finishTime);
			preparedStatement.setInt(3, idUser);
			preparedStatement.setDate(4, date);
			preparedStatement.setInt(5, idStore);
			result[0] = preparedStatement.executeUpdate();
			if(result[0]==1)
			{
				 try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
			            if (generatedKeys.next()) {
			                result[1]=(int) generatedKeys.getLong(1);
			                System.out.println(result[1]);
			            }
			            else {
			                throw new SQLException("Creating user failed, no ID obtained.");
			            }
				 }
			     catch(Exception e) {
			    	 log.log(Level.FINE, e.toString());
			     }
				 
				 
				 
			 }			
			return result;
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return result;
		}
	return result;
}
	
	

	public ArrayList<Booking> getLatestBooking(int idStoreUser) {
		ArrayList<Booking> bookingList = new ArrayList<Booking>();

		String query = "Select Name, Surname, Email,  TelephoneNumber, idBooking, bookingDate, ArrivalTime, FinishTime "
				+ "FROM User INNER JOIN clup_engsw2020.Booking ON " + "User.idUser = clup_engsw2020.booking.idUser "
				+ "WHERE  booking.idStore = ? AND bookingDate=current_date() AND ArrivalTime>current_time() AND ArrivalTime < date_add(now(), INTERVAL 3 hour)";

		try (Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStatement = con.prepareStatement(query)) {

			preparedStatement.setInt(1, idStoreUser);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {

				while (resultSet.next()) {
					Booking bookingBean = new Booking();
					User user = new User();
					bookingBean.setIdBooking(resultSet.getInt("idBooking"));
					bookingBean.setBookingDate(resultSet.getDate("bookingDate"));
					bookingBean.setArrivalTime(resultSet.getTime("ArrivalTime"));
					bookingBean.setFinishTime(resultSet.getTime("FinishTime"));
					user.setEmail(resultSet.getString("Email"));
					user.setName(resultSet.getString("Name"));
					user.setSurname(resultSet.getString("Surname"));
					user.setTelephoneNumber(resultSet.getString("TelephoneNumber"));
					bookingBean.setUser(user);
					bookingList.add(bookingBean);
				}
				return bookingList;
			} catch (Exception e) {
				log.log(Level.FINE, e.toString());
			}
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return bookingList;
	}

	public int getCountBooking(int idStoreUser) {
		int result = 0;
		String query = "SELECT COUNT(idBooking) AS todayBooking FROM booking WHERE booking.idStore = ? AND bookingDate=current_date();";

		try (Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStatement = con.prepareStatement(query)) {

			preparedStatement.setInt(1, idStoreUser);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {

				while (resultSet.next()) {
					result = resultSet.getInt("todayBooking");
				}
				return result;
			} catch (Exception e) {
				log.log(Level.FINE, e.toString());
			}
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return result;
	}

	public ArrayList<Booking> getUserBooking(int idUser) {
		ArrayList<Booking> bookingList = null;
		String query = " SELECT idBooking,  store.name, store.city, store.telephoneNumber, bookingDate, ArrivalTime , FinishTime  "
				+ "FROM User INNER JOIN clup_engsw2020.Booking ON " + "User.idUser = clup_engsw2020.booking.idUser "
				+ "INNER JOIN store ON booking.idStore = store.idStore "
				+ "WHERE  user.idUser = ? AND bookingDate < current_date() + 7 AND bookingDate >= current_date() + 0 ORDER BY bookingDate";
		try (Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStatement = con.prepareStatement(query)) {
			bookingList = new ArrayList<Booking>();

			preparedStatement.setInt(1, idUser);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {

				while (resultSet.next()) {
					System.out.println("CIAOOOOOOOO");
					Booking bookingBean = new Booking();
					Store store = new Store();
					bookingBean.setIdBooking(resultSet.getInt("idBooking"));
					bookingBean.setDateAsString(resultSet.getString("bookingDate"));
					bookingBean.setArrivalTime(resultSet.getTime("ArrivalTime"));
					bookingBean.setFinishTime(resultSet.getTime("FinishTime"));
					store.setName(resultSet.getString("name"));
					store.setCity(resultSet.getString("city"));
					store.setTelephoneNumber(resultSet.getString("telephoneNumber"));
					bookingBean.setStore(store);
					System.out.println(bookingBean.getDateAsString());
					bookingList.add(bookingBean);
				}
				return bookingList;
			} catch (Exception e) {
				log.log(Level.FINE, e.toString());
			}

		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return bookingList;
	}

	public ArrayList<String> getCities() {
		ArrayList<String> city = null;
		String query = "SELECT DISTINCT city FROM store";
		try (Connection con = DBConnection.createConnection(); Statement statement = con.createStatement()) {
			city = new ArrayList<String>();
			try (ResultSet resultSet = statement.executeQuery(query)) {

				while (resultSet.next()) {
					city.add(resultSet.getString("city"));
				}
				return city;
			} catch (Exception e) {
				log.log(Level.FINE, e.toString());
			}
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return city;
	}

	public ArrayList<Store> getStores(String city) {
		ArrayList<Store> store = null;
		Store storeBean = null;
		String query = "SELECT  idStore,name,city,address FROM store WHERE city=?";

		try (Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStatement = con.prepareStatement(query)) {
			store = new ArrayList<Store>();

			preparedStatement.setString(1, city);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {

				while (resultSet.next()) {
					storeBean = new Store();
					storeBean.setIdStore(resultSet.getInt("idStore"));
					storeBean.setCity(resultSet.getString("city"));
					storeBean.setName(resultSet.getString("name"));
					storeBean.setAddress(resultSet.getString("address"));
					store.add(storeBean);
				}
				return store;
			} catch (Exception e) {
				log.log(Level.FINE, e.toString());
			}
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return store;
	}
	
	public Boolean checkAvailability(int idStore, Time ArrivalTime, Time finishTime, Date bookingDate) {
		int capacity=0;
		int[] filled = new int[2];
		String[] query = {"SELECT COUNT(idBooking) AS persone, bookableCapacity FROM booking INNER JOIN store ON booking.idStore=store.idStore WHERE bookingDate = ? AND arrivalTime<=? AND FinishTime>=? AND booking.idStore = ?" ,
		                  "SELECT COUNT(idBooking) AS persone, bookableCapacity FROM booking INNER JOIN store ON booking.idStore=store.idStore WHERE bookingDate = ? AND arrivalTime<=? AND FinishTime>=? AND booking.idStore = ?"};
		for(int i=0;i<2;i++) {
		try (Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStatement = con.prepareStatement(query[i])){
			if(i==0) {
			preparedStatement.setDate(1, bookingDate);
			preparedStatement.setTime(2,ArrivalTime);
			preparedStatement.setTime(3, ArrivalTime);
			preparedStatement.setInt(4, idStore);}
			if(i==1) {
			preparedStatement.setDate(1, bookingDate);
			preparedStatement.setTime(2,finishTime);
			preparedStatement.setTime(3, finishTime);
			preparedStatement.setInt(4, idStore);}
			try(ResultSet resultSet = preparedStatement.executeQuery()){
				while(resultSet.next()) {
					filled[0]=resultSet.getInt("persone");
					capacity = resultSet.getInt("bookableCapacity");
				}
			}			
			catch(Exception e) {
				log.log(Level.FINE, e.toString());
			}
		}
		catch(Exception e) {
			log.log(Level.FINE, e.toString());
		}
		}
		if(capacity >= filled[0] && capacity >= filled[1] ) {
		return true;
		}
		else {
			return false;
		}
			
	}
	
	
	
	public ArrayList<Booking> getAllUserBooking(int idUser) {
		ArrayList<Booking> bookingList = null;
		String query = " SELECT idBooking,  store.name, store.address, store.city, store.telephoneNumber, bookingDate, ArrivalTime , FinishTime  "
				+ "FROM User INNER JOIN clup_engsw2020.Booking ON " + "User.idUser = clup_engsw2020.booking.idUser "
				+ "INNER JOIN store ON booking.idStore = store.idStore "
				+ "WHERE  user.idUser = ?  ORDER BY bookingDate";
		try (Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStatement = con.prepareStatement(query)) {
			bookingList = new ArrayList<Booking>();

			preparedStatement.setInt(1, idUser);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {

				while (resultSet.next()) {
					Booking bookingBean = new Booking();
					Store store = new Store();
					bookingBean.setIdBooking(resultSet.getInt("idBooking"));
					bookingBean.setDateAsString(resultSet.getString("bookingDate"));
					bookingBean.setArrivalTime(resultSet.getTime("ArrivalTime"));
					bookingBean.setFinishTime(resultSet.getTime("FinishTime"));
					store.setName(resultSet.getString("name"));
					store.setCity(resultSet.getString("city"));
					store.setAddress(resultSet.getString("address"));
					store.setTelephoneNumber(resultSet.getString("telephoneNumber"));
					bookingBean.setStore(store);
					System.out.println(bookingBean.getDateAsString());

					bookingList.add(bookingBean);
				}
				return bookingList;
			} catch (Exception e) {
				log.log(Level.FINE, e.toString());
			}

		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return bookingList;
	}
	public int getPeopleAtStore(int idStore) {
		String query="SELECT COUNT(idBooking) as persone FROM booking WHERE bookingDate = current_date() AND arrivalTime<current_time() AND FinishTime>current_time() AND booking.idStore=?"; 
				//"SELECT COUNT(idBooking) as persone FROM booking WHERE bookingDate = current_date() AND arrivalTime<date_add(now(), INTERVAL 1 hour) AND FinishTime>date_add(now(), INTERVAL 1 hour) AND booking.idStore=?";
		int people=0;
		try(Connection con = DBConnection.createConnection();
			Statement statement = con.createStatement();
			PreparedStatement preparedStmt = con.prepareStatement(query);) {
			preparedStmt.setInt(1, idStore);
			try(ResultSet resultSet = preparedStmt.executeQuery();)
			{
				while(resultSet.next()) 
				{
					people=resultSet.getInt("persone");
				}				
			}
			catch(Exception e) 
			{
				log.log(Level.FINE, e.toString());
			}
			return people;
		}
		catch(Exception e) {
			log.log(Level.FINE, e.toString());
		}
		return people;
	}
	
	public int getIdStoreFromBooking(int idBooking) 
	{
		String query = "SELECT * FROM booking WHERE idBooking = ?";
		int idStore = 0;
		try(Connection con = DBConnection.createConnection();
				Statement statement = con.createStatement();
				PreparedStatement preparedStmt = con.prepareStatement(query);)
		{
			preparedStmt.setInt(1, idBooking);
			try(ResultSet resultSet = preparedStmt.executeQuery();)
			{
				while(resultSet.next()) 
				{
					idStore=resultSet.getInt("idStore");
				}				
			}
			catch(Exception e) 
			{
				log.log(Level.FINE, e.toString());
			}
			return idStore;
		}
		catch(Exception e) 
		{
			log.log(Level.FINE, e.toString());
		}
		return idStore;
	}

}
