package data;

import java.util.List;

import javax.persistence.EntityManager;

import entities.MenuItem;

public interface MenuDAO {
	public List<MenuItem> getAllMenuItemsFromAppetizers(int id);
	public List<MenuItem> getAllMenuItemsFromEntrees(int id);
	public List<MenuItem> getAllMenuItemsFromDesserts(int id);
	public List<MenuItem> getAllMenuItemsFromDrinks(int id);
	public void setEntityManager(EntityManager emInj);
}
