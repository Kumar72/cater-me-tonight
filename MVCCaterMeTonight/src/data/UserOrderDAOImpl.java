package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.OrderItem;
@Transactional 
@Repository
public class UserOrderDAOImpl implements UserOrderDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<OrderItem> getUserOrder() {
		OrderItem uo = new OrderItem();
		List<OrderItem> order = new ArrayList<>();
//		em.getOrder();
		return order;
	}

	@Override
	public List <OrderItem> updateUserOrder(int id) {
		em.getTransaction().begin();
		OrderItem managed = em.find(OrderItem.class, id);
		//add logic to remove foodItems from list of userOrder
		em.flush();
		em.getTransaction().commit();
		return null;
	}

	@Override
	public boolean cancelUserOrder(int id) {
		em.getTransaction().begin();
		OrderItem managed = em.find(OrderItem.class, id);
		//add logic to cancel userOrder
		em.remove(managed);
		em.flush();
		em.getTransaction().commit();
		return false;
	}

}
