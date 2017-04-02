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
	public User showUser(int id) { //returning a single customer
		return em.find(User.class, 1);
	}

	@Override
	public User createNewUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateUserInfo(int id, User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteUser(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User getUserByUsernameAndPassword(User user) {
		User returnedUser = null;
		String queryString = "SELECT user " 
						+ "FROM User user "
						+ "WHERE user.username = :username "
						+ "AND user.password = :password ";
		try {
			System.out.println(user.getUsername());
			System.out.println(user.getPassword());
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
