package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.User;

@Transactional
@Repository
public class UserDAOImpl implements UserDAO {

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
	public User getCustomerByUsernameAndPassword(User user) {
		User returnedUser = null;
		String queryString = "SELECT user " 
						+ "FROM User user "
						+ "WHERE user.username = :username"
						+ "AND user.password = :password ";
		try {
			returnedUser = em.createQuery(queryString, User.class)
					.setParameter("username", user.getUsername())
					.setParameter("password", user.getPassword())					
					.getSingleResult();
		} catch (Exception e) {
			System.out.println(e);
	
		}
		return returnedUser;
	}	

}
