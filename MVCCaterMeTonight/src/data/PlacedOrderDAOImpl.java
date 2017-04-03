package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.PlacedOrder;

@Transactional
@Repository
public class PlacedOrderDAOImpl implements PlacedOrderDAO {
	@PersistenceContext
	private EntityManager em;
	@Override
	public PlacedOrder showPlacedOrder(int id) {
		return em.find(PlacedOrder.class, id);
	}
	@Override
	public PlacedOrder createPlacedOrder(PlacedOrder placedOrder) {
		// TODO Auto-generated method stub
		return null;
	}

}
