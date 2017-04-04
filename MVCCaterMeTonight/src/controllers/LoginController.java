package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.KitchenDAO;
import data.MenuDAO;
import data.PlacedOrderDAO;
import data.UserDAO;
import entities.Kitchen;
import entities.PlacedOrder;
import entities.User;

@Controller
public class LoginController {
	@SuppressWarnings("unused")
	
	@Autowired
	private MenuDAO menuDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private PlacedOrderDAO placedOrderDAO;
	@Autowired
	private KitchenDAO kitchenDAO;
	
	public void setUserDAO(UserDAO dao) {
		userDAO = dao;
	}
	public void setPlacedOrderDAO(PlacedOrderDAO dao) {
		placedOrderDAO = dao;
	}
	public void setKitchenDAO(KitchenDAO dao) {
		kitchenDAO = dao;
	}

	@RequestMapping(value = "Home.do")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(value = "About.do")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("about");
		return mv;
	}
	@RequestMapping(value = "Logout.do")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.setAttribute("user", null);
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(path = "Login.do", method = RequestMethod.GET)
	public String login(HttpSession session, User user, Model model) {
		user = userDAO.getUserByUsernameAndPassword(user);
		session.setAttribute("user", user);
		if (user != null) {
			model.addAttribute("kitchens", kitchenDAO.listOfKitchen());
			if(!user.getStatus().equals("admin")) {
			model.addAttribute("placedOrder", new PlacedOrder());
			return "startorder";
			}
			else{
				model.addAttribute("kitchen", new Kitchen());
				return "admin";
			}
		} else {
			return "invalidusernameorpassword";
		}

	}
}