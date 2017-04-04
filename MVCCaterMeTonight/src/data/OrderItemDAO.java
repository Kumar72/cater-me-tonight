package data;

import java.util.List;

import entities.MenuItem;

public interface OrderItemDAO {

	public List <MenuItem> showAllMenuItemsAddedToOrder();
	
	public List <MenuItem> removeMenuItemFromOrder();
		
}
