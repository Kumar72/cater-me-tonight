package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Kitchen;

@Transactional
@Repository
public class KitchenDAOImpl implements KitchenDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Autowired
	private MenuDAO mDao;

	public static void main(String[] args) {
		KitchenDAOImpl kImp = new KitchenDAOImpl();
		kImp.listOfKitchen();
	}

	// DONE
	@Override
	public Kitchen createKitchen(Kitchen kitchen) {

			em.persist(kitchen);
			em.flush();
			// System.out.println(kitchen);
		return kitchen;
	}

	// DONE
	@Override
	public List<Kitchen> listOfKitchen() {
		List<Kitchen> kitchens = new ArrayList<>();
		String query = "SELECT k FROM Kitchen k";
		kitchens = em.createQuery(query, Kitchen.class).getResultList();
		return kitchens;

	}

	// DONE
	@Override
	public Kitchen updateKitchen(int id, Kitchen kitchen) {
		Kitchen managed = em.find(Kitchen.class, id);
		managed.setName(kitchen.getName());
		managed.setDescription(kitchen.getDescription());
		managed.setPicture(kitchen.getPicture());
		em.flush();
		return kitchen;
	}

	
	@Override
	public Kitchen getKitchenById(int id) {
		String query = "SELECT k from Kitchen k where k.id = :id";
		Kitchen kitchen = em.createQuery(query, Kitchen.class).setParameter("id", id)
				.getSingleResult();
		return kitchen;
	}

	@Override
	public Kitchen activateAndDeactiveKitchen(int id, Kitchen kitchen) {
		
		return null;
	}

}
