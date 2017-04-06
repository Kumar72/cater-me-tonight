package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.CourseDAO;
import data.KitchenDAO;
import data.MenuDAO;
import entities.Course;
import entities.MenuItem;

@Controller
public class KitchenController {
	
	@Autowired
	private KitchenDAO kitchenDao;

	@Autowired
	private MenuDAO menuDao;
	
	@Autowired
	private CourseDAO courseDao;
	
	// ################ CREATE MENU-ITEM #####################

			@RequestMapping(path = "CreateMenuItem.do", method = RequestMethod.GET)
			//preset the kitchen_id to where the item is getting created
			public ModelAndView createNewMenuItemFromKitchen(@RequestParam("kid") int id) {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("createmenuitem");
				mv.addObject("kitchen", kitchenDao.getKitchenById(id));
				mv.addObject("courses", courseDao.getAllTheCourse());
				
				return mv;
			}

			@RequestMapping(path = "CreateMenuItem.do", method = RequestMethod.POST)
			public ModelAndView createNewKitchen(MenuItem menuItem,
					@RequestParam("kitchenId") int kid,@RequestParam("courseId") int cid) {
//				System.out.println("####################3"+menuItem);
				ModelAndView mv = new ModelAndView();
				menuDao.createMenuItem(menuItem,kid,cid); 
				mv.addObject("kitchenname", kitchenDao.getKitchenById(kid));
				mv.addObject("selectedMenu", menuDao.getAllItemsFromKitchen(kid));
				mv.setViewName("adminkitchen");
				return mv;
			}
	
	
	// ################### ACTIVATE / DEACTIVATE MENU-ITEM #######################
	
	@RequestMapping(path = "RemoveMenuItem.do", method = RequestMethod.GET)
	public ModelAndView removeMenuItem(@RequestParam("menuId") int id) {
		ModelAndView mv = new ModelAndView();
		menuDao.activateAndDeactivateMenuItem(id);
		mv.addObject("kitchens", kitchenDao.listOfKitchen());
		mv.setViewName("admin");
		return mv;
	}

	
//	################### UPDATE MENU-ITEM #######################
	
	@RequestMapping(path = "UpdateMenuItem.do", method = RequestMethod.GET)
	public ModelAndView updateMenuItemPathFromAdmin(@RequestParam("menuId")int menuId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminupdatemenu");
		mv.addObject("courses", courseDao.getAllTheCourse());
		mv.addObject("item", menuDao.getMenuItemById(menuId));
		return mv;
	}
	
	
	@RequestMapping(path = "UpdateMenuItem.do", method = RequestMethod.POST)
	public ModelAndView updateMenuItem(@RequestParam("id")int id, MenuItem menuItem,
			@RequestParam("courseId")int cid, @RequestParam("kitchenId")int kid) {
		ModelAndView mv = new ModelAndView();
		System.out.println("###################IN UPDATE ITEM ");
		menuDao.updateMenuItem(id, menuItem,cid, kid);
		
		mv.addObject("kitchenname", kitchenDao.getKitchenById(kid));
		mv.addObject("selectedMenu", menuDao.getAllItemsFromKitchen(kid));
		mv.setViewName("adminkitchen");
		return mv;
	}

}
