package pojos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import entities.OrderItem;
/*This pojo is going to be a temporary place holder for all of the menu items added
 * to the customers overall order. Once the user wants to view their order, the 
 * cart will be emptied and will cease to be a menu item, and now be read as an 
 * order item.*/
public class ShoppingCart {
	
	private Map<Integer, OrderItem> orderItemsAddedToCart = new HashMap<>();

	public OrderItem addOrUpdateOrderItem(OrderItem orderItem){
		return orderItemsAddedToCart.put(orderItem.getMenuItem().getId(), orderItem);
	}

	public Map<Integer, OrderItem> getOrderItemsAddedToCart() {
		return orderItemsAddedToCart;
	}

	public void setOrderItemsAddedToCart(Map<Integer, OrderItem> orderItemsAddedToCart) {
		this.orderItemsAddedToCart = orderItemsAddedToCart;
	}

	
	
}
