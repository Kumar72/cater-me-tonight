package dao.tests;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Customer;

public class CustomerTest {
	EntityManagerFactory emf = null;
	EntityManager em=null;
	
	
	@Before
	public void setUp(){
		emf = Persistence.createEntityManagerFactory("CaterMeTonight");
		em = emf.createEntityManager();
	}
	@After
	public void tearDown(){
		emf.close();
		em.close();
	}
	@Test
	public void test(){
		boolean test = true;
		assertEquals(test, true);
	}
	
	@Test
	public void testGetCustomerById(){
		System.out.println(em.find(Customer.class, 1));
	}
	
	
	public static void main(String[] args) {
		
	}
}
