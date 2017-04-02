package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.User;

@Transactional
@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User showCustomer(int id) { //returning a single customer
		return em.find(User.class, 1);
	}

	@Override
	public User createANewCustomer(User customer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateCustomerInfo(int id, User customer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteCustomer(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User getCustomerByUsernameAndPassword(User customer) {
		// TODO Auto-generated method stub
		return null;
	}

}
