package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import data.CustomerDAO;


@Controller
public class LoginController {
  @SuppressWarnings("unused")
@Autowired
  private CustomerDAO customerDAO;
  

  public void setCustomerDAO(CustomerDAO dao) {
	  customerDAO = dao;
  }
  
  @RequestMapping(value = "Home.do")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
  
//  @RequestMapping(path = "GetFilm.do", method = RequestMethod.GET)
//  public String show(@RequestParam("id") Integer id, Model model) {
//    Film film = filmDAO.show(id);
//    model.addAttribute("film", film);
//    return "film/show.jsp";
//  }
//  
//  @RequestMapping(path = "GetFilms.do", method = RequestMethod.GET)
//  public String index(Model model) {
//    model.addAttribute("films", filmDAO.index());
//    return "film/index.jsp";
//  }
//  
//  @RequestMapping(path = "NewFilm.do", method = RequestMethod.GET)
//  public String newFilm(Model model) {
//    model.addAttribute("languages", languageDAO.index());
//    return "film/new.jsp";
//  }
//  
//  @RequestMapping(path = "CreateFilm.do", method = RequestMethod.POST)
//  public String create(Model model, Film film, int languageId) {
//	film.setLanguage(languageDAO.show(languageId));
//    model.addAttribute("film", filmDAO.create(film));
//    return "film/show.jsp";
//  }
//  
//  @RequestMapping(path = "EditFilm.do", method = RequestMethod.GET)
//  public String edit(Model model, @RequestParam("id") int id) {
//		model.addAttribute("film", filmDAO.show(id));
//	    model.addAttribute("languages", languageDAO.index());
//	    return "film/edit.jsp";
//  }
//  
//  @RequestMapping(path = "UpdateFilm.do", method = RequestMethod.POST)
//  public String update(Model model, Film film, int languageId, int fid) {
//	  film.setLanguage(languageDAO.show(languageId));
//	  model.addAttribute("film", filmDAO.update(fid, film));
//    return "film/show.jsp";
//  }
//  
//  @RequestMapping(path = "DestroyFilm.do", method = RequestMethod.POST)
//  public String destroy(Model model, @RequestParam("fid") int fid) {
//    filmDAO.destroy(fid);
//    model.addAttribute("films", filmDAO.index());
//    return "film/index.jsp";
//  }
}