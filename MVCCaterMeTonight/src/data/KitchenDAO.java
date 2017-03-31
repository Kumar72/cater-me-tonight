package data;

import java.util.List;

import entities.Kitchen;

public interface KitchenDAO {
	public Kitchen showKitchen(int id);
	public Kitchen getKitchensDescription(int id);
	public List<Kitchen> showAllKitchens(int id);
	
	//admin privileges 
	public boolean removeKitchen(int id);
	public boolean removeCuisineFromKitchen(int id);
	public Kitchen createKitchenCuisine(Kitchen kitchen);

}
