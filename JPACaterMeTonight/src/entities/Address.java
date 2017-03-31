package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="address")
public class Address {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="address_id")
	private int id;
	
	private String city;
	
	@Column(name="state")
	private String state;
	
	@Column(name="address")
	private String streetAddress;
	
	@Column(name="postal_code")
	private int zipCode;
	
	@Column(name="phone")
	private String phoneNumber;

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Address [city=" + city + ", state=" + state + ", streetAddress=" + streetAddress + ", zipCode="
				+ zipCode + ", phoneNumber=" + phoneNumber + "]";
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

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	
}
