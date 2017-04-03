package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.Order;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.OrderItem;
import entities.PlacedOrder;
@Transactional
@Repository
public class PlacedOrderDAOImpl implements PlacedOrderDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<OrderItem> getUserOrder() {
		
		return null;
	}
	
	
	@Override
	public List<PlacedOrder> updateOrder(int id, Order order) {
		Order managedOrder = em.find(Order.class, id);
		
		return null;
	}


	@Override
	public List<PlacedOrder> createOrder(Order order) {
		em.getTransaction().begin();
		em.persist(order);
		em.flush();
		em.getTransaction().commit();
		return null;
	}


	@Override
	public boolean destroyOrder() {
		
		return false;
	}


}
