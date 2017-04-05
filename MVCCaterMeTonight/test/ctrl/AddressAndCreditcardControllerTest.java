package ctrl;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.nullValue;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import controllers.AddressAndCreditcardController;
import data.AddressDAO;
import data.CreditcardDAO;
import data.PlacedOrderDAO;
import data.UserDAO;
import entities.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "../WEB-INF/Test-context.xml" })
@WebAppConfiguration
@Transactional // you will need this if you are using DAO methods with
				// transactions
public class AddressAndCreditcardControllerTest {
	@Autowired
	private WebApplicationContext wac;

	private MockMvc mockMvc;

	@Autowired
	private AddressAndCreditcardController controller;

	private CreditcardDAO creditcardDAO;
	private AddressDAO addressDAO;

	@Before
	public void setUp() throws Exception {
		creditcardDAO = (CreditcardDAO) wac.getBean("creditcardDAO");
		addressDAO = (AddressDAO) wac.getBean("addressDAO");

		// dao = wac.getBean(FilmDAOImpl.class);
		controller.setCreditcardDAO(creditcardDAO);
		controller.setAddressDAO(addressDAO);
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}

	@After
	public void tearDown() throws Exception {
		controller = null;
		mockMvc = null;
		wac = null;
	}

	@Test
	public void test_payment_and_delivery_returns_paymentanddelivery() {
		try {
			MockHttpSession mockSession = new MockHttpSession();
			// Login first
			mockMvc.perform(
					get("/Login.do").param("username", "student").param("password", "student").session(mockSession));
			// Use MockMVC to create a request to the test servlet and get a
			// response
			MvcResult response = mockMvc.perform(get("/PaymentAndDelivery.do").session(mockSession)).andExpect(status().isOk()).andReturn();
			// Extract the returned ModelAndView from the response
			ModelAndView mv = response.getModelAndView();
			// Extract the Model from the ModelAndView
			ModelMap map = mv.getModelMap();
			// Cast the Object value paired to the "film" key to a Film object
			// Check the values with JUnit tests
			assertEquals("paymentanddelivery", mv.getViewName());
		} catch (Exception e) {

			e.printStackTrace();
			fail(e.toString());
		}
	}

}