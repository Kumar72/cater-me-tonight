package entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {
	//Total fields: 9		3 bidirectional fk's
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String email;
	private String username;
	private String password;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;

	private String status;

	@Column(name="phone")
	private String phoneNumber;
	
	@Column(name="picture_url")
	private String pictureUrl;

	
	
	@OneToMany(mappedBy="user")
	private List <PlacedOrder> placedOrder;
	
	@OneToMany(mappedBy="user")
	private List<Address> address;
	
	@OneToMany(cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name="user")
	private List<CreditCard> creditcard;
	
	
	//GETTERS and SETTERS below (no setter for 'id')
	
	public int getId() {
		return id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public List<PlacedOrder> getPlacedOrder() {
		return placedOrder;
	}
	public void setPlacedOrder(List<PlacedOrder> placedOrder) {
		this.placedOrder = placedOrder;
	}
	public List<Address> getAddress() {
		return address;
	}
	public void setAddress(List<Address> address) {
		this.address = address;
	}
	public List<CreditCard> getCreditcard() {
		return creditcard;
	}
	public void setCreditcard(List<CreditCard> creditcard) {
		this.creditcard = creditcard;
	}
	
	@Override
	public String toString() {
		return "User [email=" + email + ", username=" + username + ", password=" + password + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", status=" + status + ", phoneNumber=" + phoneNumber + ", pictureUrl="
				+ pictureUrl + "]";
	}
	
	
}
