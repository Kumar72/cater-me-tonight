package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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

	@Override
	public List<MenuItem> getAllMenuItemsFromAppetizers(int id) {
		String query = "SELECT m from MenuItem m where m.kitchen.id = :id and m.course.name = :name";
		List<MenuItem> menuItems = em.createQuery(query, MenuItem.class).setParameter("id", id)
				.setParameter("name", "Appetizer").getResultList();
		Course course = new Course();
		course = em.find(Course.class, id);
		course.getName();
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
		Course course = new Course();
		course = em.find(Course.class, id);
		course.getName();
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
		Course course = new Course();
		course = em.find(Course.class, id);
		course.getName();
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
		Course course = new Course();
		course = em.find(Course.class, id);
		course.getName();
		for (MenuItem menuItem : menuItems) {
			System.out.println(menuItem);
		}
		return menuItems;

	}

	@Override
	public List<MenuItem> getAllItemsFromKitchen(int id) {
		String query = "SELECT m from MenuItem m where m.kitchen.id = :id";
		List<MenuItem> menuItems = em.createQuery(query, MenuItem.class).setParameter("id", id).getResultList();
		Course course = new Course();
		course = em.find(Course.class, id);
		course.getName();
		for (MenuItem menuItem : menuItems) {
			System.out.println(menuItem);
		}
		return menuItems;
	}

	@Override
	public List<MenuItem> addMenuItemsToCart(int menuId) {
		System.out.println("*****************I'm in the add items to cart DAOimpl method with item id: " + menuId
				+ "****************");
		ShoppingCart shoppingCart = new ShoppingCart();
		String query = "SELECT m FROM MenuItem m WHERE m.id = :id";
		List<MenuItem> cart = em.createQuery(query, MenuItem.class).setParameter("id", menuId).getResultList();
		shoppingCart.setMenuItemsAddedToCart(cart);
		return cart;
	}

	@Override
	public MenuItem createMenuItem(MenuItem menuItem) {
		em.persist(menuItem);
		em.flush();
		return menuItem;
	}

	@Override
	public MenuItem updateMenuItem(int id, MenuItem menuItem) {
		MenuItem managed = em.find(MenuItem.class, id);
		managed.setName(menuItem.getName());
		managed.setDescription(menuItem.getDescription());
		managed.setPicture(menuItem.getPicture());
		em.flush();
	return menuItem;
	}

	public boolean removeMenuItemByKitchen(int kitchenId) {
		String query = "DELETE from MenuItem m WHERE m.kitchen = :id";
		List<MenuItem> managed = em.createQuery(query, MenuItem.class).getResultList();
		em.remove(managed);
		em.flush();
		return em.contains(managed);
	}

	@Override
	public boolean removeMenuItem(int id) {
		MenuItem managed = em.find(MenuItem.class, id);
		em.remove(managed);
		em.flush();
		return em.contains(managed);
	}

}
