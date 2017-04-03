package controllers;

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

	@RequestMapping(path = "Login.do", method = RequestMethod.GET)
	public String login(User user, Model model) {
		user = userDAO.getUserByUsernameAndPassword(user);
		model.addAttribute("user", user);
		if (user != null) {
			model.addAttribute("kitchens", kitchenDAO.listOfKitchen());
			if(!user.getStatus().equals("admin")) {
			model.addAttribute("placedOrder", new PlacedOrder());
			return "startorder";
			}
			else{
				model.addAttribute("kitchen", new Kitchen());
				return "kitchen";
			}
		} else {
			return "invalidusernameorpassword";
		}

	}
//	@RequestMapping(path = "ViewMenuOptions.do", method = RequestMethod.GET)
//	public String viewMenuOptions(PlacedOrder placedOrder, Model model) {
//		model.addAttribute("placedOrder", placedOrder);
//		return "menu";
//	}
	//
	// @RequestMapping(path = "GetFilms.do", method = RequestMethod.GET)
	// public String index(Model model) {
	// model.addAttribute("films", filmDAO.index());
	// return "film/index.jsp";
	// }
	//
	// @RequestMapping(path = "NewFilm.do", method = RequestMethod.GET)
	// public String newFilm(Model model) {
	// model.addAttribute("languages", languageDAO.index());
	// return "film/new.jsp";
	// }
	//
	// @RequestMapping(path = "CreateFilm.do", method = RequestMethod.POST)
	// public String create(Model model, Film film, int languageId) {
	// film.setLanguage(languageDAO.show(languageId));
	// model.addAttribute("film", filmDAO.create(film));
	// return "film/show.jsp";
	// }
	//
	// @RequestMapping(path = "EditFilm.do", method = RequestMethod.GET)
	// public String edit(Model model, @RequestParam("id") int id) {
	// model.addAttribute("film", filmDAO.show(id));
	// model.addAttribute("languages", languageDAO.index());
	// return "film/edit.jsp";
	// }
	//
	// @RequestMapping(path = "UpdateFilm.do", method = RequestMethod.POST)
	// public String update(Model model, Film film, int languageId, int fid) {
	// film.setLanguage(languageDAO.show(languageId));
	// model.addAttribute("film", filmDAO.update(fid, film));
	// return "film/show.jsp";
	// }
	//
	// @RequestMapping(path = "DestroyFilm.do", method = RequestMethod.POST)
	// public String destroy(Model model, @RequestParam("fid") int fid) {
	// filmDAO.destroy(fid);
	// model.addAttribute("films", filmDAO.index());
	// return "film/index.jsp";
	// }
}