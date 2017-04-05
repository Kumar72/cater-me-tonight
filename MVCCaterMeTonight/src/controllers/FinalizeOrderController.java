package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.AddressDAO;
import data.CreditcardDAO;
@Controller
public class FinalizeOrderController {
	@SuppressWarnings("unused")
	
	@Autowired
	private CreditcardDAO creditcardDAO;
	
	@Autowired
	private AddressDAO addressDAO;
	
	
	public void setAddressDAO(AddressDAO addressdao) {
		addressDAO = addressdao;
	}
	public void setCreditcardDAO(CreditcardDAO creditcarddao) {
		creditcardDAO = creditcarddao;
	}
	
	@RequestMapping(value = "FinalizeAndSubmitOrder.do", method = RequestMethod.GET)
	public ModelAndView selectAddressAndCreditcard(HttpSession session, int creditcardId, int addressId){
		ModelAndView mv = new ModelAndView();
		mv.addObject("creditcard", creditcardDAO.show(creditcardId));
		mv.addObject("address", addressDAO.getAddress(addressId));
		mv.addObject("shoppingCart", session.getAttribute("shoppingCart"));
		mv.setViewName("finalorder");
		return mv;
	}
	
	
		
}
