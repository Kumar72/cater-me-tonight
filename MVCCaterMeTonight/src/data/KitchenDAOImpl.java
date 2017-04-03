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
			em.getTransaction().commit();
		}
		else {
			System.out.println("Please enter something here");
		}
		return kitchen;
	}

	//Get The loop working
	@Override
	public List<Kitchen> listOfKitchen() {
		Kitchen k = new Kitchen();
		List<Kitchen> kitchens = new ArrayList<>();
		int idCount = 0;
//		while(idCount <= k.getId()){
			kitchens.add(em.find(Kitchen.class, k.getId()));
			System.out.println(kitchens);
//			idCount++;
			
			return kitchens;
		}
		
		
//	}
	
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

	//DONE
	@Override
	public boolean removeKitchenAndCuisine(int id) {
		em.getTransaction().begin();
		Kitchen managed = em.find(Kitchen.class, id);
			em.remove(managed);
		em.flush();
		em.getTransaction().commit();
		return em.contains(managed);
	}

}
