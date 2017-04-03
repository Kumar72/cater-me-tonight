package data;

import entities.PlacedOrder;

public interface PlacedOrderDAO {

	public PlacedOrder showPlacedOrder(int id);
	public PlacedOrder createPlacedOrder(PlacedOrder placedOrder);
}
