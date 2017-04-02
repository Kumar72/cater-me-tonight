package data;

import entities.UserOrder;

public interface UserOrderDAO {
	public UserOrder getUserOrder(int id);
	public UserOrder updateUserOrder(int id);
	public boolean cancelUserOrder(int id);

}
