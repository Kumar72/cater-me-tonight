package data;

import java.util.List;

import javax.persistence.EntityManager;

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
}
