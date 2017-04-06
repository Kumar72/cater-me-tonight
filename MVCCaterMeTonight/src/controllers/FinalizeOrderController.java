package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.AddressDAO;
import data.CreditcardDAO;
import entities.Address;
import entities.Creditcard;
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
	
	@RequestMapping(value = "FinalizeOrder.do", method = RequestMethod.GET)
	public ModelAndView selectAddressAndCreditcard(HttpSession session, 
			@RequestParam(value="creditcardId", defaultValue="0") int creditcardId,
			@RequestParam(value="addressId", defaultValue="0") int addressId, 
			@RequestParam(value="creditcard", required=false) Creditcard creditcard,
			@RequestParam(value="address", required=false) Address address){ 
			
		ModelAndView mv = new ModelAndView();
		if(creditcardId != 0){
			Creditcard tempCard = creditcardDAO.show(creditcardId);
			mv.addObject("creditcard", tempCard);
			System.out.println(tempCard);
		}
		else {
			mv.addObject("creditcard", creditcard);
			System.out.println(creditcard);
		}
		if(addressId != 0){
			Address tempAddress = addressDAO.getAddress(addressId);
			mv.addObject("address", tempAddress);
			System.out.println(tempAddress);
		}
		else{
			mv.addObject("address", address);
			System.out.println(address);
		}
		
		mv.addObject("shoppingCart", session.getAttribute("shoppingCart"));
		mv.setViewName("finalorder");
		return mv;
	}
	
	@RequestMapping(value = "SubmitOrder.do", method = RequestMethod.GET)
	public ModelAndView submitOrder(HttpSession session){
		// Store in the database
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", session.getAttribute("user"));
		mv.setViewName("confirmation");
		return mv;
	}
		
}
