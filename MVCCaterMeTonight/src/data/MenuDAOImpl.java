package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Course;
import entities.Kitchen;
import entities.MenuItem;
import pojos.ShoppingCart;

@Transactional
@Repository
public class MenuDAOImpl implements MenuDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	public ShoppingCart getShoppingCart() {
		return shoppingCart;
	}

	public void setShoppingCart(ShoppingCart shoppingCart) {
		this.shoppingCart = shoppingCart;
	}

	private ShoppingCart shoppingCart = new ShoppingCart();
			
	
	//admin
	@Override
	public List<MenuItem> getAppetizers(int id) {
		String query = "SELECT m from MenuItem m where m.course.name = :name";
		List<MenuItem> menuItems = em.createQuery(query, MenuItem.class)
				.setParameter("name", "Appetizer").getResultList();
		Course c = em.find(Course.class, id);
		c.getName();
		for (MenuItem menuItem : menuItems) {
			System.out.println(menuItem);
		}
		return menuItems;
	}

	

	@Override
	public List<MenuItem> getAllMenuItemsFromAppetizers(int id) {
		String query = "SELECT m from MenuItem m where m.kitchen.id = :id and m.course.name = :name";
		List<MenuItem> menuItems = em.createQuery(query, MenuItem.class).setParameter("id", id)
				.setParameter("name", "Appetizer").getResultList();
		if(menuItems == null){
		Course course = new Course();
		course = em.find(Course.class, id);
		course.getName();
		}
		for (MenuItem menuItem : menuItems) {
			System.out.println(menuItem);
		}
		return menuItems;
	}

	@Override
	public List<MenuItem> getAllMenuItemsFromEntrees(int id) {
		String query = "SELECT m from MenuItem m where m.kitchen.id = :id and m.course.name = :name";
		List<MenuItem> menuItems = em.createQuery(query, MenuItem.class).setParameter("id", id)
				.setParameter("name", "Entre").getResultList();
		if(menuItems == null){
		Course course = new Course();
		course = em.find(Course.class, id);
		course.getName();
		}
		for (MenuItem menuItem : menuItems) {
			System.out.println(menuItem);
		}
		return menuItems;
	}

	@Override
	public List<MenuItem> getAllMenuItemsFromDesserts(int id) {
		String query = "SELECT m from MenuItem m where m.kitchen.id = :id and m.course.name = :name";
		List<MenuItem> menuItems = em.createQuery(query, MenuItem.class).setParameter("id", id)
				.setParameter("name", "Dessert").getResultList();
		if(menuItems == null){
		Course course = new Course();
		course = em.find(Course.class, id);
		course.getName();
		}
		for (MenuItem menuItem : menuItems) {
			System.out.println(menuItem);
		}
		return menuItems;

	}

	@Override
	public List<MenuItem> getAllMenuItemsFromDrinks(int id) {
		String query = "SELECT m from MenuItem m where m.kitchen.id = :id and m.course.name = :name";
		List<MenuItem> menuItems = em.createQuery(query, MenuItem.class).setParameter("id", id)
				.setParameter("name", "Drink").getResultList();
		if(menuItems == null){
		Course course = new Course();
		course = em.find(Course.class, id);
		course.getName();
		}
		for (MenuItem menuItem : menuItems) {
			System.out.println(menuItem);
		}
		return menuItems;

	}

	@Override
	public MenuItem display(int menuItemId) {
		return em.find(MenuItem.class, menuItemId);
	}
	
	
	//DONE
	@Override
	public MenuItem createMenuItem(MenuItem menuItem,int kid, int cid) {
		Course c =em.find(Course.class, cid);
		Kitchen k =em.find(Kitchen.class, kid);
		
		menuItem.setCourse(c);
		menuItem.setKitchen(k);
		
		em.persist(menuItem);
		em.flush();
		return menuItem;
	}
	
	//DONE
	@Override
	public List<MenuItem> getAllItemsFromKitchen(int id) {
		String query = "SELECT m from MenuItem m where m.kitchen.id = :id";
		List<MenuItem> menuItems = em.createQuery(query, MenuItem.class).setParameter("id", id).getResultList();
		for (MenuItem menuItem : menuItems) {
			System.out.println(menuItem);
		}
		return menuItems;
	}

	@Override
	public MenuItem updateMenuItem(int id, MenuItem menuItem, int cid,int kid) {
		Course c =em.find(Course.class, cid);
		Kitchen k =em.find(Kitchen.class, kid);
		menuItem.setCourse(c);
		MenuItem managed = em.find(MenuItem.class, id);
		managed.setName(menuItem.getName());
		managed.setDescription(menuItem.getDescription());
		managed.setPicture(menuItem.getPicture());
		em.flush();
	return menuItem;
	}

	
	public void activateAndDeactivateMenuItemByKitchen(int kitchenId) {
		Kitchen k = em.find(Kitchen.class, kitchenId);
		String query = "UPDATE MenuItem "
				+ "SET status= :status "
				+ "WHERE kitchen.id = :id";
		em.createQuery(query).setParameter("id", kitchenId).setParameter("status", k.isStatus()).executeUpdate();
		em.flush();
			
	}

	@Override
	public MenuItem activateAndDeactivateMenuItem(int id) {
		MenuItem managed = em.find(MenuItem.class, id);
		if(managed.isStatus()) {
			managed.setStatus(false);			
		}
		else {
			managed.setStatus(true);
		}
		em.flush();
		return managed;
	}

	@Override
	public void setEntityManager(EntityManager emInj) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MenuItem getMenuItemById(int id) {	
		String query = "SELECT m fROM MenuItem m where m.id = :id";
		MenuItem menuItem = em.createQuery(query, MenuItem.class).setParameter("id", id)
				.getSingleResult();
		return menuItem;
	}

}
