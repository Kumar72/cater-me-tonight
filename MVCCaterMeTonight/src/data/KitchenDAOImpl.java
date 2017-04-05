package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Course;
import entities.Kitchen;
import entities.MenuItem;

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

	// not DONE -- need a way to remove all the menu-item
	@Override
	public boolean activateKitchenAndMenuItems(int id) {
		Kitchen managed = em.find(Kitchen.class, id);
//		mDao.removeMenuItemByKitchen(id);		//Some problem here
		em.remove(managed);
		em.flush();
		return !em.contains(managed);
	}

	@Override
	public Kitchen getKitchenById(int id) {
		String query = "SELECT k from Kitchen k where k.id = :id";
		Kitchen kitchen = em.createQuery(query, Kitchen.class).setParameter("id", id)
				.getSingleResult();
		return kitchen;
	}

}
