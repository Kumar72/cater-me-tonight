package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Course;
import entities.MenuItem;

@Transactional
@Repository
public class MenuDAOImpl implements MenuDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	public void setEntityManager(EntityManager emInj) {
		em = emInj;
	}
	
	@Override
	public List<MenuItem> getAllMenuItemsFromAppetizers(int id) {
		String query = "SELECT m from MenuItem m where m.kitchen.id = :id and m.course.name = :name";
		List<MenuItem> menuItems = em.createQuery(query, MenuItem.class).setParameter("id", id).setParameter("name", "Appetizer").getResultList();
		Course course = new Course();
		course=em.find(Course.class, id);
		course.getName();
		for (MenuItem menuItem : menuItems) {
			System.out.println(menuItem);
		}
		return menuItems;
	}

	@Override
	public List<MenuItem> getAllMenuItemsFromEntrees(int id) {
		String query = "SELECT m from MenuItem m where m.kitchen.id = :id and m.course.name = :name";
		List<MenuItem> menuItems = em.createQuery(query, MenuItem.class).setParameter("id", id).setParameter("name", "Entre").getResultList();
		Course course = new Course();
		course=em.find(Course.class, id);
		course.getName();
		for (MenuItem menuItem : menuItems) {
			System.out.println(menuItem);
		}
		return menuItems;
	}

	@Override
	public List<MenuItem> getAllMenuItemsFromDesserts(int id) {
		String query = "SELECT m from MenuItem m where m.kitchen.id = :id and m.course.name = :name";
		List<MenuItem> menuItems = em.createQuery(query, MenuItem.class).setParameter("id", id).setParameter("name", "Dessert").getResultList();
		Course course = new Course();
		course=em.find(Course.class, id);
		course.getName();
		for (MenuItem menuItem : menuItems) {
			System.out.println(menuItem);
		}
		return menuItems;
		
	}
	
	
	
	@Override
	public List<MenuItem> getAllMenuItemsFromDrinks(int id) {
		String query = "SELECT m from MenuItem m where m.kitchen.id = :id and m.course.name = :name";
		List<MenuItem> menuItems = em.createQuery(query, MenuItem.class).setParameter("id", id).setParameter("name", "Drink").getResultList();
		Course course = new Course();
		course=em.find(Course.class, id);
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
		course=em.find(Course.class, id);
		course.getName();
		for (MenuItem menuItem : menuItems) {
			System.out.println(menuItem);
		}
		return menuItems;		
	}

}
