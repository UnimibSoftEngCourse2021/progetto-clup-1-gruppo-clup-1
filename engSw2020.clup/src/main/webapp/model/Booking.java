package main.webapp.model;

import java.sql.Date;
import java.sql.Time;

public class Booking {
	int idBooking;
	int number;
	Date bookingDate;
	Time arrivalTime;
	Time finishTime;
	User user;
	Store store;
	String address;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public User getUser() {
		return user;
	}	
	public void setUser(User u) {
		this.user = u;
	}	
	public int getIdBooking() {
		return idBooking;
	}
	public void setIdBooking(int idBooking) {
		this.idBooking = idBooking;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public Time getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(Time arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public Time getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(Time finishTime) {
		this.finishTime = finishTime;
	}
	public Date getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		this.bookingDate=bookingDate;
	}
	public Store getStore() {
	return store;
	}
	public void setStore(Store store) {
		this.store = store;
	}
}
