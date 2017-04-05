package entity;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Address;
import entities.Course;
import entities.Creditcard;
import entities.Kitchen;
import entities.MenuItem;
import entities.OrderItem;
import entities.PlacedOrder;
import entities.User;

public class MappingTest {
	
	@Test		//Basic test
	public void test() {
		boolean pass = true;
		assertEquals(pass, true);
	}
	private EntityManagerFactory emf = null;
	private EntityManager em = null;
	private Address addr;
	private Course course;
	private Creditcard creditCard;
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
		 em.close();
		 emf.close();		 
	 }
	 /*##################### MAPPING TEST BELOW #######################*/
	 
	 @Test 
	 public void test_address_mapping() {
		addr = em.find(Address.class, 1);
//		 System.out.println(em.find(Address.class, 1));
		 assertEquals("Denver", addr.getCity());
	 }
	 
	 @Test
	 public void test_course_mapping() {
		 course = em.find(Course.class, 4);
		 assertEquals("Drink", course.getName());
	 }
	 
	 @Test
	 public void test_creditcard_mapping() {
		 creditCard = em.find(Creditcard.class, 1);
		 assertEquals("Chandan K Thakur", creditCard.getFullName());
	 }
	 @Test
	 public void test_kitchen_mapping() {
		 kitchen = em.find(Kitchen.class, 1);
		 assertEquals("French", kitchen.getName());
	 }
	 @Test
	 public void test_menuitem_mapping() {
		 menuItem = em.find(MenuItem.class, 3);
//		 System.out.println(menuItem);
		 assertEquals("Samosa", menuItem.getName());
	 }
	 @Test
	 public void test_orderitem_mapping() {
		 orderItem = em.find(OrderItem.class, 1);
//		 System.out.println(orderItem);
		 assertEquals(21, orderItem.getQuantity());
	 }
	 @Test
	 public void test_placedorder_mapping() {
		 placedOrder = em.find(PlacedOrder.class, 1);
		 assertEquals(1, placedOrder.getId());
	 }
	 @Test
	 public void test_user_mapping() {
		 user = em.find(User.class, 1);
		 assertEquals("Kumar72", user.getUsername());
	 }
	 
	 @Test
	 public void test_placed_order_for_boolean_type() {
		 placedOrder = em.find(PlacedOrder.class, 1);
		 assertEquals(false, placedOrder.isAppetizer());
	 }
	 
}
