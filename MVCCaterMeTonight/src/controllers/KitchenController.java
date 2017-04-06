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
	
	
	
	
	// ################### CRUD MENU-ITEM #######################
	
//	@RequestMapping(path = "RemoveMenuItem.do", method = RequestMethod.GET)
//	public ModelAndView removeMenuItem(@RequestParam("menuId") int id) {
//		ModelAndView mv = new ModelAndView();
//		menuDao.activateAndDeactivateMenuItem(id);
//		mv.addObject("selectedMenu", kitchenDao.listOfKitchen());
//		mv.setViewName("admin");
//		return mv;
//	}

//	@RequestMapping(path = "UpdateMenuItem.do", method = RequestMethod.GET)
//	public ModelAndView updateMenuItemPathFromAdmin(@RequestParam("kitchenId")int kitchenId) {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("adminupdatepage");
//		mv.addObject("kitchen", kitchenDao.getKitchenById(kitchenId));
//		return mv;
//	}
//	
//	@RequestMapping(path = "UpdateMenuItem.do", method = RequestMethod.POST)
//	public ModelAndView updateMenuItem(@RequestParam("id")int id, MenuItem menuItem) {
//		ModelAndView mv = new ModelAndView();
//		menuDao.updateMenuItem(id, menuItem);
//		mv.addObject("selectedMenu", menuDao.getAllItemsFromKitchen(id));
//		mv.setViewName("adminkitchen");
//		return mv;
//	}

//	@RequestMapping(path = "CreateMenuItem.do", method = RequestMethod.GET)
//	public ModelAndView createNewMenuItemPathFromKitchen() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("createmenuitem");
//		return mv;
//	}

//	@RequestMapping(path = "CreateKitchen.do", method = RequestMethod.POST)
//	public ModelAndView createNewMenuItem(MenuItem menuItem) {
//		ModelAndView mv = new ModelAndView();
//		menuDao.createMenuItem(menuItem);
//		mv.addObject("kitchens", kitchenDao.listOfKitchen());
//		mv.setViewName("admin");
//		return mv;
//	}
//	
}
