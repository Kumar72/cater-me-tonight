package entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="credit_card")
public class CreditCard {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="creditcard_id")
	private int id;
	
	@Column(name="expiration_date")
	private Date expirationDate;
	
	@Column(name="first_name")
	private String firstNameOnCard;
	
	@Column(name="last_name")
	private String lastNameOnCard;
	
	@Column(name="credit_card_number")
	private double ccNum;
	
	@Column(name="security_code")
	private int ccv;

	@Column(name="billing_address_id")
	private int billingAddressId;

	public int getId() {
		return id;
	}

	public String getFirstNameOnCard() {
		return firstNameOnCard;
	}

	public void setFirstNameOnCard(String firstNameOnCard) {
		this.firstNameOnCard = firstNameOnCard;
	}

	public String getLastNameOnCard() {
		return lastNameOnCard;
	}

	public void setLastNameOnCard(String lastNameOnCard) {
		this.lastNameOnCard = lastNameOnCard;
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

	public Date getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}

	public int getBillingAddress() {
		return billingAddressId;
	}

	public void setBillingAddress(int billingAddress) {
		this.billingAddressId = billingAddress;
	}

	
}
