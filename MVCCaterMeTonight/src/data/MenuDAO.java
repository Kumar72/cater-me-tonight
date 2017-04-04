package data;

import java.util.List;

import javax.persistence.EntityManager;

import entities.MenuItem;

public interface MenuDAO {
	public List<MenuItem> getAllItemsFromKitchen(int id);
	public List<MenuItem> getAllMenuItemsFromAppetizers(int id);
	public List<MenuItem> getAllMenuItemsFromEntrees(int id);
	public List<MenuItem> getAllMenuItemsFromDesserts(int id);
	public List<MenuItem> getAllMenuItemsFromDrinks(int id);
	
	public List <MenuItem> addMenuItemsToCart(int id);
	
	
	public MenuItem createMenuItem(MenuItem menuItem);
	public MenuItem updateMenuItem(int id, MenuItem menuItem);
	public boolean removeMenuItem(int id);
	public boolean removeMenuItemByKitchen(int kitchenId);
	
}
