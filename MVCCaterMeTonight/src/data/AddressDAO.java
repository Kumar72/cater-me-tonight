package data;

import java.util.List;

import entities.Address;

public interface AddressDAO {

	public List<Address> getAllAddresses();
	public Address getAddress(int id);
	public Address makeANewAddress(Address address);
	public Address updateAddress(Address address, int id);
	public boolean removeAnAddress(int id);
	
}
