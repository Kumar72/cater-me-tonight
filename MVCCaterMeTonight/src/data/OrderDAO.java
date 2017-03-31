package data;

import entities.Order;

public interface OrderDAO {
	public Order getOrder(int id);
	public Order updateOrder(int id);
	public boolean cancelOrder(int id);

}
