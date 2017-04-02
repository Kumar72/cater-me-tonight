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
@Table(name="order_item")
public class OrderItem {
	
	
	@ManyToOne
	@JoinColumn(name="menu_item_id")
	private MenuItem menuItem;
	
	@ManyToOne
	@JoinColumn(name="placed_order_id")
	private PlacedOrder placedOrder;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String comment;
	
	private int quantity;
	
//	@Column(name="placed_order_id")
//	private int orderId;
//	
//	@Column(name="menu_item_id")
//	private int menuItemId;
}
