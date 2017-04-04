package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import entities.Kitchen;

public class KitchenDAOImpl implements KitchenDAO {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("CaterMeTonight");
	EntityManager em = emf.createEntityManager();

	public static void main(String[] args) {
		KitchenDAOImpl kImp = new KitchenDAOImpl();
		kImp.listOfKitchen();
	}
	
	//DONE
	@Override
	public Kitchen createKitchen(Kitchen kitchen) {
		
		if (kitchen != null) {
			em.getTransaction().begin();
				em.persist(kitchen);
				em.flush();
//				System.out.println(kitchen);
			em.getTransaction().commit();
		}
		else {
			System.out.println("Please enter something here");
		}
		return kitchen;
	}

	//DONE
	@Override
	public List<Kitchen> listOfKitchen() {
		List<Kitchen> kitchens = new ArrayList<>();		
		String query ="SELECT k FROM Kitchen k";
		kitchens = em.createQuery(query, Kitchen.class).getResultList();
		return kitchens;
		
	}
	
	//DONE
	@Override
	public Kitchen updateKitchen(int id, Kitchen kitchen) {
		em.getTransaction().begin();
		Kitchen managed = em.find(Kitchen.class, id);
		managed.setName(kitchen.getName());
		managed.setDescription(kitchen.getDescription());
		em.flush();
		em.getTransaction().commit();
	return kitchen;
	}

	//not DONE -- need a way to remove all the menu-item
	@Override
	public boolean removeKitchenAndMenuItems(int id) {
		em.getTransaction().begin();
		Kitchen managed = em.find(Kitchen.class, id);
			em.remove(managed);
		em.flush();
		em.getTransaction().commit();
		return em.contains(managed);
	}

}
