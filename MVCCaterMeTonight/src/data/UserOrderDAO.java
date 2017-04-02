package data;

import java.util.List;

import entities.OrderItem;

public interface UserOrderDAO {
	public List<OrderItem> getUserOrder();
	public List<OrderItem> updateUserOrder(int id);
	public boolean cancelUserOrder(int id);

}
