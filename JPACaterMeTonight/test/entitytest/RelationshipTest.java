package entitytest;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Address;


public class RelationshipTest {

	@Test		//Basic test
	public void test() {
		boolean pass = true;
		assertEquals(pass, true);
	}
	private EntityManagerFactory emf = null;
	private EntityManager em = null;
	private Address addr;
	
	
	
	 @Before
	  public void setUp() throws Exception { 		
		 emf = Persistence.createEntityManagerFactory("CaterMeTonight");
		 em = emf.createEntityManager();
	 
	 }
	 @After
	  public void tearDown() throws Exception { 
		 em.close();
		 emf.close();
		 
		 
	/*##################### MAPPING TEST BELOW #######################*/
		 
	 }
	 @Test 
	 public void test_association_between_user_address() {
		addr = em.find(Address.class, 1);
//		 System.out.println(em.find(Address.class, 1));
		 assertEquals("Denver", addr.getCity());
	 }
}
