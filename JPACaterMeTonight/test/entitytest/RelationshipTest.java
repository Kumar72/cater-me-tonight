package entitytest;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Address;
import entities.Course;
import entities.CreditCard;
import entities.FoodItem;
import entities.Kitchen;
import entities.MenuItem;
import entities.OrderItem;
import entities.PlacedOrder;
import entities.User;

public class RelationshipTest {

	@Test		//Basic test
	public void test() {
		boolean pass = true;
		assertEquals(pass, true);
	}
	private EntityManagerFactory emf = null;
	private EntityManager em = null;
	private Address addr;
	private Course course;
	private CreditCard creditCard;
	private FoodItem foodItem;
	private Kitchen kitchen;
	private MenuItem menuItem;
	private OrderItem orderItem;
	private PlacedOrder placedOrder;
	private User user;
	
	
	 @Before
	  public void setUp() throws Exception { 		
		 emf = Persistence.createEntityManagerFactory("CaterMeTonight");
		 em = emf.createEntityManager();
	 
	 }
	 @After
	  public void tearDown() throws Exception { 
		 
		 
	/*##################### MAPPING TEST BELOW #######################*/
		 
	 }
	 @Test 
	 public void test_association_between_user_address() {
		addr = em.find(Address.class, 1);
//		 System.out.println(em.find(Address.class, 1));
		 assertEquals("Denver", addr.getCity());
	 }
}
