package data;

import java.util.List;

import entities.Kitchen;

public interface KitchenDAO {
	
//	admin privileges 
	public List<Kitchen> listOfKitchen();
	public Kitchen createKitchen(Kitchen kitchen);
//	public Kitchen createKitchenAndCuisine(Kitchen kitchen, FoodItem food);
	public Kitchen updateKitchen(int id, Kitchen kitchen);
	public boolean removeKitchenAndMenuItems(int id);
	public Kitchen getKitchenById(int id);
	
	
	//client privileges

}
