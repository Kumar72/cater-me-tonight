package entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="placed_order")
public class PlacedOrder {
	
	@OneToMany(mappedBy="placedOrder")
	private List<OrderItem> orderItem;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToOne(cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name="address_id")
	private Address address;
	
	@OneToOne(cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name="creditcard_id")
	private CreditCard creditcard;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="user_id")
	private int userId;
	
	@Column(name="date_created")
	private String dateCreated;
	
	@Column(name="delivery_address_id")
	private String deliveryAddress;
	
	@Column(name="creditcard_id")
	private int creditCardId;

	public int getId() {
		return id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public int getCreditCardId() {
		return creditCardId;
	}

	public void setCreditCardId(int creditCardId) {
		this.creditCardId = creditCardId;
	}

	@Override
	public String toString() {
		return "PlacedOrder [userId=" + userId + ", dateCreated=" + dateCreated + ", deliveryAddress=" + deliveryAddress
				+ ", creditCardId=" + creditCardId + "]";
	}
	
	
	
	
}
