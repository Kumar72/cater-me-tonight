package data;

import java.util.List;

import javax.persistence.EntityManager;

import entities.Kitchen;
import entities.MenuItem;
import pojos.ShoppingCart;

public interface MenuDAO {
	public List<MenuItem> getAllItemsFromKitchen(int id);
	public List<MenuItem> getAllMenuItemsFromAppetizers(int id);
	public List<MenuItem> getAllMenuItemsFromEntrees(int id);
	public List<MenuItem> getAllMenuItemsFromDesserts(int id);
	public List<MenuItem> getAllMenuItemsFromDrinks(int id);
	public void setEntityManager(EntityManager emInj);
	public ShoppingCart getShoppingCart();
	public MenuItem display(int menuItemId);
	
//	public List <MenuItem> addMenuItemsToCart(int id);
	
//	public List <MenuItem> addMenuItemsToCart(int id);
	
	
	public MenuItem getMenuItemById(int id);
	public MenuItem createMenuItem(MenuItem menuItem,int kid, int cid);
	public MenuItem updateMenuItem(int id, MenuItem menuItem, int cid, int kid);
	public MenuItem activateAndDeactivateMenuItem(int id);
	public void activateAndDeactivateMenuItemByKitchen(int kitchenId);
	
	
	
	public List<MenuItem> getAppetizers(int id);
}
