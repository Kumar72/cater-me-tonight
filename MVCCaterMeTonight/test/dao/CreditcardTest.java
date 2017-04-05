package dao;

import static org.hamcrest.CoreMatchers.allOf;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.hasProperty;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThat;

import java.util.Date;

import javax.enterprise.inject.New;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import data.CreditcardDAO;
import entities.Address;
import entities.Creditcard;
import entities.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "../WEB-INF/Test-context.xml"})
@WebAppConfiguration
@Transactional
public class CreditcardTest {

  @Autowired
  private WebApplicationContext wac;

//  @Autowired
// Autowired is not happening so we are simulating it in the setup
  private CreditcardDAO dao;

  @PersistenceContext
  private EntityManager em;

  @Before
  public void setUp() {
    dao = (CreditcardDAO) wac.getBean("creditcardDAO");
  }

  @After
  public void tearDown() {
    dao = null;
    em = null;
    wac = null;
  }
  
  @Test
  public void test_show_returns_creditcard(){
	  int actualId = 3;
	  String expectedNumber = "1111222233334444";
	  assertEquals(expectedNumber, dao.show(actualId).getCreditcardNumber());
  }
  
  @Test
  public void test_index_returns_3_creditcards(){
	  int expectedOutcome = 3;
	  assertEquals(expectedOutcome, dao.index().size());
  }
  
  @Test
  public void test_create_returns_creditcard(){
	  String fullName = "Tim Brown";
	  Date expirationDate = new Date(2020, 12, 1);
	  String creditcardNumber = "1111222233334444";
	  int securityCode = 333;
	  User user = em.find(User.class, 1);
	  Address billingAddress = em.find(Address.class, 1);
	  
	  Creditcard creditcard = new Creditcard();
	  creditcard.setFullName(fullName);
	  creditcard.setExpirationDate(expirationDate);
	  creditcard.setCreditcardNumber(creditcardNumber);
	  creditcard.setSecurityCode(securityCode);
	  creditcard.setUser(user);
	  creditcard.setBillingAddress(billingAddress);
	  Creditcard returnedCreditcard = dao.create(creditcard);
		
	    assertThat(returnedCreditcard,
	        allOf(
	            hasProperty("fullName", is(fullName)),	           
	            hasProperty("expirationDate", is(expirationDate)),
	            hasProperty("creditcardNumber", is(creditcardNumber)),
	            hasProperty("securityCode", is(securityCode)),
	            hasProperty("user", is(user)),
	            hasProperty("billingAddress", is(billingAddress))
	            
	        		           
	        )
	      );
  }
  @Test
  public void test_update_returns_creditcard(){
	  String fullName = "Tim Brown";
	  @SuppressWarnings("deprecation")
	Date expirationDate = new Date(2020, 12, 1);
	  String creditcardNumber = "1111222233334444";
	  int securityCode = 333;
	  User user = em.find(User.class, 1);
	  Address billingAddress = em.find(Address.class, 1);
	  
	  Creditcard creditcard = new Creditcard();
	  creditcard.setFullName(fullName);
	  creditcard.setExpirationDate(expirationDate);
	  creditcard.setCreditcardNumber(creditcardNumber);
	  creditcard.setSecurityCode(securityCode);
	  creditcard.setUser(user);
	  creditcard.setBillingAddress(billingAddress);
	  	  
	  Creditcard returnedUpdatedCreditcard = dao.update(1, creditcard);
	    assertThat(returnedUpdatedCreditcard,
	        allOf(
	            hasProperty("fullName", is(fullName)),	           
	            hasProperty("expirationDate", is(expirationDate)),
	            hasProperty("creditcardNumber", is(creditcardNumber)),
	            hasProperty("securityCode", is(securityCode)),
	            hasProperty("user", is(user)),
	            hasProperty("billingAddress", is(billingAddress))
	            
	        		           
	        )
	      );
  }

  
//  @Test
//  public void test_destroy_creditcard(){
//	  int size = dao.index().size();	  
//	  assertEquals(true, dao.destroy(1));
//	  System.out.println(dao.index());
//	  assertEquals(size+1, dao.index().size());
//	  assertNull(dao.show(1));
//  }
}