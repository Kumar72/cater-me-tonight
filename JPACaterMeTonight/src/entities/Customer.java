package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="user_id")
	private int id;
	
	@Column(name="username")
	private String userName;
	
//	@Column(name="first_name")
//	private String firstName;
//	
//	@Column(name="last_name")
//	private String lastName;
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	private String email;
	
//	@Column(name="creditcard_id")
//	private int creditCardId;
	
//	@Column(name="address")
//	private int addressId;

//	public int getCcID() {
//		return creditCardId;
//	}
//
//	public void setCcID(int ccID) {
//		this.creditCardId = ccID;
//	}

//	public int getAddressId() {
//		return addressId;
//	}
//
//	public void setAddressId(int addressId) {
//		this.addressId = addressId;
//	}

	public int getId() {
		return id;
	}
	
//	public String getFirstName() {
//		return firstName;
//	}
//
//	public void setFirstName(String firstName) {
//		this.firstName = firstName;
//	}
//
//	public String getLastName() {
//		return lastName;
//	}
//
//	public void setLastName(String lastName) {
//		this.lastName = lastName;
//	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

//	@Override
//	public String toString() {
//		return "Customer [firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + "]";
//	}
	
	
	
}
