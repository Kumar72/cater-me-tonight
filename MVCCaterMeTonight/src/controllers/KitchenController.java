package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.KitchenDAO;
import data.MenuDAO;
import entities.Kitchen;

@Controller
public class KitchenController {

	@Autowired
	private KitchenDAO kitchenDao;
	
	@Autowired
	private MenuDAO menuDao;
	
	@RequestMapping(path = "KitchenController.do",
		method = RequestMethod.GET)
	 public ModelAndView getAllKitchen(@RequestParam("action")String action,
			 @RequestParam("kitchenId")int id) {
		ModelAndView mv = new ModelAndView();
		if (action.equalsIgnoreCase("all")){
//			System.out.println("################TEST################");
			mv.setViewName("kitchen");
			mv.addObject("selectedMenu", menuDao.getAllItemsFromKitchen(id));
		}
		else if (action.equalsIgnoreCase("appetizer")){
			mv.setViewName("kitchen");
			mv.addObject("selectedMenu", menuDao.getAllMenuItemsFromAppetizers(id));
		}
		else if(action.equalsIgnoreCase("entree")) {
			mv.setViewName("kitchen");
			mv.addObject("selectedMenu", menuDao.getAllMenuItemsFromEntrees(id));
		}
		else if(action.equalsIgnoreCase("dessert")) {
			mv.setViewName("kitchen");
			mv.addObject("selectedMenu", menuDao.getAllMenuItemsFromDesserts(id));
		}
		else if(action.equalsIgnoreCase("drink")) {
			mv.setViewName("kitchen");
			mv.addObject("selectedMenu", menuDao.getAllMenuItemsFromDrinks(id));
		}
	 return mv;
	 }
	
	@RequestMapping(path = "CreateKitchen.do",
			method = RequestMethod.POST)
		 public ModelAndView createNewKitchen(Kitchen kitchen) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("kitchen");
			mv.addObject("kitchens", kitchenDao.createKitchen(kitchen));
		 return mv;
		 }
	
	@RequestMapping(path = "UpdateKitchen.do",
			method = RequestMethod.POST)
		 public ModelAndView updateKitchen(@RequestParam("kitchenId")int id, Kitchen kitchen) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("admin");
			mv.addObject("kitchens", kitchenDao.updateKitchen(id, kitchen));
		 return mv;
		 }
	
	@RequestMapping(path = "RemoveKitchen.do",
			method = RequestMethod.POST)
		 public ModelAndView removeKitchen(@RequestParam("kitchenId")int id) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("admin");
			mv.addObject("kitchens", kitchenDao.removeKitchenAndMenuItems(id));
		 return mv;
		 }
}
