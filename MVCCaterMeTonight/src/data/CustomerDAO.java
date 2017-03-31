package data;

import entities.Customer;

public interface CustomerDAO {
	public Customer showCustomer(int id);
	public Customer createANewCustomer(Customer customer);
	public Customer updateCustomerInfo(int id, Customer customer);
	public boolean deleteCustomer(int id);

}
