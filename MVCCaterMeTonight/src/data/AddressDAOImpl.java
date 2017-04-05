package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Address;
import entities.Creditcard;
import entities.Kitchen;

@Transactional
@Repository
public class AddressDAOImpl implements AddressDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Address getAddress(int id) {
		return em.find(Address.class, id);

	}

	@Override
	public Address makeANewAddress(Address address) {
		em.persist(address);
		em.flush();
		return address;
	}

	@Override
	public Address updateAddress(Address address, int id) {
		Address managed = em.find(Address.class, id);
		managed.setState(address.getState());
		managed.setCity(address.getCity());
		managed.setPostalCode(address.getPostalCode());
		managed.setStreetAddress(address.getStreetAddress());
		
		return address;
	}

	@Override
	public boolean removeAnAddress(int id) {
		Address managed = em.find(Address.class, id);
		em.remove(managed);
		if (em.find(Address.class, 1) == null) {
			return true;
		} else if (em.find(Address.class, 1) != null) {
			return false;
		}
		return false;
	}

	@Override
	public List<Address> getAllAddresses() {
		List<Address> addresses = new ArrayList<>();
		String query = "SELECT a FROM Address a";
		addresses = em.createQuery(query, Address.class).getResultList();
		return addresses;
	}

	@Override
	public List<Address> getSavedAddressesForUser(int id) {
		List<Address> addresses = null;
		String queryString = "SELECT address " 
				+ "FROM Address address";
		try {
			addresses = em.createQuery(queryString, Address.class)
					.getResultList();
		} catch (Exception e) {
			System.out.println(e);
		} 
		return addresses;
	}

}
