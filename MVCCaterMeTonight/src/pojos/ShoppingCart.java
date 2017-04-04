package pojos;

import java.util.List;

import entities.MenuItem;
/*This pojo is going to be a temporary place holder for all of the menu items added
 * to the customers overall order. Once the user wants to view their order, the 
 * cart will be emptied and will cease to be a menu item, and now be read as an 
 * order item.*/
public class ShoppingCart {
	
	private List <MenuItem> menuItemsAddedToCart = null;
	 

	public List<MenuItem> getMenuItemsAddedToCart() {
		return menuItemsAddedToCart;
	}

	public void setMenuItemsAddedToCart(List<MenuItem> menuItemsAddedToCart) {
		this.menuItemsAddedToCart = menuItemsAddedToCart;
	}
	
	
}
