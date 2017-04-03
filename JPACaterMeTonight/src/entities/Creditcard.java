package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="creditcard")
public class Creditcard {
	//Total fields: 7 		2fk(User,BillingAddr)
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="full_name")
	private String fullName;
	

	@Column(name="expiration_date")
	private String expirationDate;

	@Column(name="creditcard_number")
	private double ccNum;
		
	@Column(name="security_code")
	private int ccv;

	
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToOne
	@JoinColumn(name="billing_address_id")
	private Address billingAddressId;

	
	
	//GETTERS and SETTERS below (no setter for 'id')
	
	public int getId() {
		return id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	public double getCcNum() {
		return ccNum;
	}
	public void setCcNum(double ccNum) {
		this.ccNum = ccNum;
	}
	public int getCcv() {
		return ccv;
	}
	public void setCcv(int ccv) {
		this.ccv = ccv;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Address getBillingAddressId() {
		return billingAddressId;
	}
	public void setBillingAddressId(Address billingAddressId) {
		this.billingAddressId = billingAddressId;
	}
	

}
