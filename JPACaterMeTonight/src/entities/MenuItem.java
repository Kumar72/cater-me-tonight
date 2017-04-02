package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="menu")
public class MenuItem {
	
	@OneToMany(mappedBy= "menuItem")
	private List <OrderItem> orderMenuItems;
	
	@ManyToOne
	@JoinColumn(name="kitchen_id")
	private Kitchen kitchen;
	
	@ManyToOne
	@JoinColumn(name="course_id")
	private Course course;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String name;
	
	private String description;
	
//	@Column(name="kitchen_id")
//	private int kitchenId;
	
//	@Column(name="course_id")
//	private int courseId;
//	
	private double price;
	
	private int quantity;
//	
//	@Column(name="order_id")
//	private int orderId;

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
//
//	public int getKitchenId() {
//		return kitchenId;
//	}
//
//	public void setKitchenId(int kitchenId) {
//		this.kitchenId = kitchenId;
//	}
//
//	public int getCourseId() {
//		return courseId;
//	}
//
//	public void setCourseId(int courseId) {
//		this.courseId = courseId;
//	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
//
//	public int getOrderId() {
//		return orderId;
//	}
//
//	public void setOrderId(int orderId) {
//		this.orderId = orderId;
//	}
//	
//	@Override
//	public String toString() {
//		return "Menu [name=" + name + ", description=" + description + ", kitchenId=" + kitchenId  + ", price=" + price + ", quantity=" + quantity + ", orderId=" + orderId + "]";
//	}
}
