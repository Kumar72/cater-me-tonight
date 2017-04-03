package data;

import java.util.List;

import entities.Kitchen;

public interface KitchenDAO {
	
	//admin privileges 
	public List<Kitchen> listOfKitchen();
	public Kitchen createKitchen(Kitchen kitchen);
//	public Kitchen createKitchenAndCuisine(Kitchen kitchen, FoodItem food);
	public Kitchen updateKitchen(int id, Kitchen kitchen);
	public boolean removeKitchenAndCuisine(int id);
	
	
	//client privileges
	

}

//public Actor createActor(Actor actor);
//public Actor updateActor(int id, Actor actor);
//public boolean removePlayer(int id);
//public Actor createActorAndFilm(Actor actor, Film film);