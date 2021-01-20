package main.webapp.model;

public class Store {
	private int idStore;
	private String address;
	private String desprition;
	private String telephoneNumber;
	private String city;
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private int capacity;
	private int bookableCapacity;
	public int getIdStore() {
		return idStore;
	}
	public void setIdStore(int idStore) {
		this.idStore = idStore;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDesprition() {
		return desprition;
	}
	public void setDesprition(String desprition) {
		this.desprition = desprition;
	}
	public String getTelephoneNumber() {
		return telephoneNumber;
	}
	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getBookableCapacity() {
		return bookableCapacity;
	}
	public void setBookableCapacity(int bookableCapacity) {
		this.bookableCapacity = bookableCapacity;
	}
	

}
