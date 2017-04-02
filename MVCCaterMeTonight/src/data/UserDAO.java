package data;

import entities.User;

public interface UserDAO {
	public User showCustomer(int id);
	public User getCustomerByUsernameAndPassword(User customer);
	public User createANewCustomer(User customer);
	public User updateCustomerInfo(int id, User customer);
	public boolean deleteCustomer(int id);

}
