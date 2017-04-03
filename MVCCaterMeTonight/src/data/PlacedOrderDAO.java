package data;

import java.util.List;

import javax.persistence.criteria.Order;

import entities.OrderItem;
import entities.PlacedOrder;

public interface PlacedOrderDAO {
	public List<OrderItem> getUserOrder(); 
	public List <PlacedOrder> createOrder(Order order);
	public List<PlacedOrder> updateOrder(int id, Order order);
	public boolean destroyOrder();
	
}
