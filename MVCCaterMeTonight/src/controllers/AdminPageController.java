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
public class AdminPageController {
	
	@Autowired
	private KitchenDAO kitchenDao;

	@Autowired
	private MenuDAO menuDao;
	
	@Autowired
	private CourseDAO courseDao;

	@RequestMapping(path="Appetizer.do", method = RequestMethod.GET)
	public ModelAndView makeAppetizerPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("appetizerpage");
		int id = 1;
		mv.addObject("appetizer", menuDao.getAppetizers(id));
		return mv;
	}
	
}