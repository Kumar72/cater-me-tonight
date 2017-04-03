package controllers;

import javax.enterprise.inject.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.KitchenDAO;

@Controller
public class KitchenController {

	@Autowired
	private KitchenDAO kitchenDao;
	
	@RequestMapping(path = "GetKitchen.do",
		method = RequestMethod.GET)
	 public String index(Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		mv.addObject("kitchens", kitchenDao.listOfKitchen());
	 return ".jsp";
	 }
}
