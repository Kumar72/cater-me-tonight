package dao.tests;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

import data.UserOrderDAO;
import data.UserOrderDAOImpl;
import entities.OrderItem;

public class UserOrderTest {
	
	@Test
	public void test(){
		boolean test = true;
		assertEquals(test, true);
	}
	
	@Autowired
	WebApplicationContext wac;
	
	@Autowired
	UserOrderDAO dao;
	
	 @PersistenceContext
	 private EntityManager em;	
	
	@Before
	public void setUp() throws Exception{
		dao = new UserOrderDAOImpl();
	}
	@After
	public void tearDown() throws Exception {
		dao = null;
		wac = null;
		em = null;
	}
	@Test
	public void testViewOrder(){
		OrderItem uo = new OrderItem();
		dao = new UserOrderDAOImpl();
//		uo.getId();
		
	}
	
	public static void main(String[] args) {
		
	}
}
