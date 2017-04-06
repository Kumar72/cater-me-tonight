package data;

import java.util.List;

import entities.Kitchen;

public interface KitchenDAO {
	
//	admin privileges 
	public List<Kitchen> listOfKitchen();
	public Kitchen createKitchen(Kitchen kitchen);
//	public Kitchen createKitchenAndCuisine(Kitchen kitchen, FoodItem food);
	public Kitchen updateKitchen(int id, Kitchen kitchen);
	public Kitchen activateAndDeactivateKitchen(int id);
	public Kitchen getKitchenById(int id);
	
	
	
	
	
	//for j-unit testing 
	public boolean removeKitchenAndMenuItems(int id);
	
	//client privileges

}
