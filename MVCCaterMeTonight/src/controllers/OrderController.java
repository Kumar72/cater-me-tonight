package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.PlacedOrderDAO;
@Controller
public class OrderController {
	@SuppressWarnings("unused")
	
	@Autowired
	private PlacedOrderDAO orderDAO;
	
	public void setOrderDAO(PlacedOrderDAO dao){
		orderDAO = dao;
	}
	
	@RequestMapping(value = "NewOrder.do")
	public ModelAndView placedOrder(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("newcustomerorder");
		return mv;
	}
	
//	@RequestMapping(path ="GetOrder.do", method = RequestMethod.GET)
	
		
}
