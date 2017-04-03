package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.MenuDAO;

@Controller
public class MenuController {
	
	@Autowired
	private MenuDAO menuDAO;
	
	@RequestMapping(path = "GetMenu.do",
			method = RequestMethod.GET)
	public ModelAndView appetizerItems(Model model, @RequestParam("kitchenId") int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("menu");
		mv.addObject("appetizerItems", menuDAO.getAllMenuItemsFromAppetizers(id));
		return mv;
	}
	
//	@RequestMapping(path = "GetMenu.do",
//			method = RequestMethod.GET)
//	public ModelAndView entreeItems(Model model, @RequestParam("kitchenId") int id) {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("menu");
//		mv.addObject("entreeItems", menuDAO.getAllMenuItemsFromAppetizers(id));
//		return mv;
//	}
//	@RequestMapping(path = "GetMenu.do",
//			method = RequestMethod.GET)
//	public ModelAndView dessertItems(Model model, @RequestParam("kitchenId") int id) {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("menu");
//		mv.addObject("dessertItems", menuDAO.getAllMenuItemsFromAppetizers(id));
//		return mv;
//	}
//	@RequestMapping(path = "GetMenu.do",
//			method = RequestMethod.GET)
//	public ModelAndView drinkItems(Model model, @RequestParam("kitchenId") int id) {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("menu");
//		mv.addObject("drinkItems", menuDAO.getAllMenuItemsFromAppetizers(id));
//		return mv;
//	}
//	
//	

}
