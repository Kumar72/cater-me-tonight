package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "address")
public class Address {
	//Total fields:8 	1fk(User)

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "address")
	private String streetAddress;

	@Column(name = "address2")
	private String streetAddress2;

	@Column(name = "postal_code")
	private int postalCode;

	private String city;
	private String state;
	private String country;
	
	
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	//GETTERS and SETTERS below (no setter for 'id') 
	
	public int getId() {
		return id;
	}
	public String getStreetAddress() {
		return streetAddress;
	}
	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}
	public String getStreetAddress2() {
		return streetAddress2;
	}
	public void setStreetAddress2(String streetAddress2) {
		this.streetAddress2 = streetAddress2;
	}
	public int getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(int postalCode) {
		this.postalCode = postalCode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	//To Stirng (doesnot include id and user)
	@Override
	public String toString() {
		return "Address [streetAddress=" + streetAddress + ", streetAddress2=" + streetAddress2 + ", postalCode="
				+ postalCode + ", city=" + city + ", state=" + state + ", country=" + country + "]";
	}	
}
