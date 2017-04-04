package entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="order_item")
public class OrderItem {
	//Total fields:5	2fk(PlacedOrder, MenuItem)
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String comment;
	private int quantity;
	
	
	@ManyToOne
	@JoinColumn(name="menu_item_id")
	private MenuItem menu;
	
	@ManyToOne
	@JoinColumn(name="placed_order_id")
	private PlacedOrder order;
	
	
	//GETTERS and SETTERS below (no setter for 'id')
	public int getId() {
		return id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public MenuItem getMenu() {
		return menu;
	}
	public void setMenu(MenuItem menu) {
		this.menu = menu;
	}
	public PlacedOrder getOrder() {
		return order;
	}
	public void setOrder(PlacedOrder order) {
		this.order = order;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderItem [comment=");
		builder.append(comment);
		builder.append(", quantity=");
		builder.append(quantity);
		builder.append("]");
		return builder.toString();
	}	
}
