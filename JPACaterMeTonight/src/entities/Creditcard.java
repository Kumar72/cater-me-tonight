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
	private double creditcardNumber;
		
	@Column(name="security_code")
	private int securityCode;

	
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToOne
	@JoinColumn(name="billing_address_id")
	private Address billingAddress;

	//GETTERS and SETTERS below (no setter for 'id')
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

	public double getCreditcardNumber() {
		return creditcardNumber;
	}

	public void setCreditcardNumber(double creditcardNumber) {
		this.creditcardNumber = creditcardNumber;
	}

	public int getSecurityCode() {
		return securityCode;
	}

	public void setSecurityCode(int securityCode) {
		this.securityCode = securityCode;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Address getBillingAddress() {
		return billingAddress;
	}

	public void setBillingAddress(Address billingAddress) {
		this.billingAddress = billingAddress;
	}

	public int getId() {
		return id;
	}

	
	
	
	

}
