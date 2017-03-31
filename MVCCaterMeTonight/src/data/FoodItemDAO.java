package data;

import java.util.List;

import entities.FoodItem;

public interface FoodItemDAO {
	public FoodItem showItem(int id);
	public List<FoodItem> showItemsByKitchenId(int kitchenId);
	public List<FoodItem> showItemsByCourseId(int courseId);
//	public FoodItem showItemsWithInAPriceRange(double price); stretch goal

	//  admin privileges 
	public FoodItem createItem(FoodItem foodItem);
	public boolean removeItemFromMenu(int kitchenId, int id);
	public FoodItem updateItem(int id, FoodItem foodItem);
	
}
