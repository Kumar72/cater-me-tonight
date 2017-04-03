package dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

import data.KitchenDAO;
import data.KitchenDAOImpl;
import entities.Kitchen;

public class KitchenTest {

	@Test // Basic test
	public void test() {
		boolean pass = true;
		assertEquals(pass, true);
	}
	
	@Autowired
    WebApplicationContext wac;

    @Autowired
    KitchenDAO dao;

    @PersistenceContext
    private EntityManager em;	

	/* #####################TEST MATERIAL BELOW####################### */

	@Before
	public void setUp() throws Exception {
	dao = new KitchenDAOImpl();
//	wac.getBean("kitchenDao");
	}

	@After
	public void tearDown() throws Exception {
		dao = null;
		wac = null;
		em = null;
	}
	
	@Test
	public void test_create_a_kitchen() {
		Kitchen kitchen = new Kitchen();
		dao = new KitchenDAOImpl();
		kitchen.setName("TestName");
		kitchen.setDescription("Test Description");
		kitchen.setPicture("pic");
		Kitchen test = dao.createKitchen(kitchen);
		
		assertEquals("TestName", test.getName());
		assertEquals("Test Description", test.getDescription());
		assertEquals("pic", test.getPicture());
		
		dao.removeKitchenAndCuisine(test.getId());
		
	}
	
	@Test
	public void test_read_a_list_of_kitchen() {
		dao = new KitchenDAOImpl();
		List<Kitchen> test = dao.listOfKitchen();
		assertEquals("Japanese", test.get(3).getName());
	}
	
	@Test
	public void test_edit_a_kitchen() {
		dao = new KitchenDAOImpl();
		Kitchen kitchen = new Kitchen();
		kitchen.setName("Chinese");
		kitchen.setDescription("Testing");
		kitchen.setPicture("Create TEST");
		dao.createKitchen(kitchen);
		kitchen.setName("TEST");
		kitchen.setDescription("TEST DESC");
		Kitchen test = dao.updateKitchen(kitchen.getId(), kitchen);
		
		assertEquals("TEST", test.getName());
		
		dao.removeKitchenAndCuisine(test.getId());

	}
	
	@Test
	public void test_delete_a_kitchen() {
		dao = new KitchenDAOImpl();
		Kitchen kitchen = new Kitchen();
		kitchen.setName("TEST");
		kitchen.setDescription("TEST DESC");
		kitchen.setPicture("TEST");
		dao.createKitchen(kitchen);
		assertEquals(false, dao.removeKitchenAndCuisine(kitchen.getId()));	
	}
}
