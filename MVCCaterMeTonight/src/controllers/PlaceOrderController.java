package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.PlacedOrderDAO;
import data.UserDAO;
import entities.User;

@Controller
public class PlaceOrderController {
	@SuppressWarnings("unused")
	@Autowired
	private PlacedOrderDAO placedOrderDAO;

	public void setPlacedOrderDAO(PlacedOrderDAO dao) {
		placedOrderDAO = dao;
	}


//	@RequestMapping(path = "Login.do", method = RequestMethod.GET)
//	public String login(User user, Model model) {
//		user = userDAO.getUserByUsernameAndPassword(user);
//		model.addAttribute("user", user);
//		if (user != null) {
//			return "startorder";
//		} else {
//			return "invalidusernameorpassword";
//		}
//
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