package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.AddressDAO;
import data.CreditcardDAO;
import entities.User;
 
@Controller
public class AddressAndCreditcardController {

	@Autowired
	private AddressDAO addressDAO;
	
	@Autowired
	private CreditcardDAO creditcardDAO;
	
	public void setAddressDAO(AddressDAO addressdao) {
		addressDAO = addressdao;
	}
	public void setCreditcardDAO(CreditcardDAO creditcarddao) {
		creditcardDAO = creditcarddao;
	}
	
	@RequestMapping(value = "PaymentAndDelivery.do", method = RequestMethod.GET)
	public ModelAndView selectAddressAndCreditcard(HttpSession session){
		ModelAndView mv = new ModelAndView();
		mv.addObject("creditcards", creditcardDAO.getSavedCreditcardsForUser(((User)session.getAttribute("user")).getId()));
		mv.addObject("addresses", addressDAO.getSavedAddressesForUser(((User)session.getAttribute("user")).getId()));
		mv.setViewName("paymentanddelivery");
		return mv;
	}
	
}
