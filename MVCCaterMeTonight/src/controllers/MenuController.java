package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.MenuDAO;
import entities.PlacedOrder;

@Controller
public class MenuController {
	
	@Autowired
	private MenuDAO menuDAO;
	
	@RequestMapping(path = "ViewMenuOptions.do", method = RequestMethod.GET)
	public ModelAndView viewAppetizerMenuOptions(PlacedOrder placedOrder, @RequestParam("kitchenId") int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("placedOrder", placedOrder);
		if(placedOrder.isAppetizer()){
			System.out.println("in Appetizer items");
			mv.addObject("appetizerItems", menuDAO.getAllMenuItemsFromAppetizers(id));	
		}

		if(placedOrder.isEntree()){
			System.out.println("in Entree items");
			mv.addObject("entreeItems", menuDAO.getAllMenuItemsFromEntrees(id));
		}
		
		if(placedOrder.isDessert()){
			System.out.println("in dessert items");
			mv.addObject("dessertItems", menuDAO.getAllMenuItemsFromDesserts(id));
		}
		
		if(placedOrder.isDrink()){
			System.out.println("in drink items");
			mv.addObject("drinkItems", menuDAO.getAllMenuItemsFromDrinks(id));
		}
		
		mv.setViewName("menu");

		return mv;
	}
//	@RequestMapping(path = "ViewEntreeMenuOptions.do", method = RequestMethod.GET)
//	public ModelAndView viewEntreeMenuOptions(PlacedOrder placedOrder, @RequestParam("kitchenId") int id) {
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("placedOrder", placedOrder);
//		mv.addObject("entreeItems", menuDAO.getAllMenuItemsFromEntrees(id));
//		mv.setViewName("menu");
//		
//		return mv;
//	}
//	@RequestMapping(path = "ViewDessertMenuOptions.do", method = RequestMethod.GET)
//	public ModelAndView viewDessertMenuOptions(PlacedOrder placedOrder, @RequestParam("kitchenId") int id) {
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("placedOrder", placedOrder);
//		mv.addObject("dessertItems", menuDAO.getAllMenuItemsFromDesserts(id));
//		mv.setViewName("menu");
//		
//		return mv;
//	}
//	@RequestMapping(path = "ViewDrinkMenuOptions.do", method = RequestMethod.GET)
//	public ModelAndView viewDrinkMenuOptions(PlacedOrder placedOrder, @RequestParam("kitchenId") int id) {
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("placedOrder", placedOrder);
//		mv.addObject("drinkItems", menuDAO.getAllMenuItemsFromDrinks(id));
//		mv.setViewName("menu");
//		
//		return mv;
//	}
//	


}
