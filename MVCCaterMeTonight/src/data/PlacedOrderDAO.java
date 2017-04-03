package data;


import java.util.List;

import javax.persistence.criteria.Order;

import entities.OrderItem;
import entities.PlacedOrder;

public interface PlacedOrderDAO {
	
	public PlacedOrder showPlacedOrder(int id);
	public PlacedOrder createPlacedOrder(PlacedOrder placedOrder);
}
