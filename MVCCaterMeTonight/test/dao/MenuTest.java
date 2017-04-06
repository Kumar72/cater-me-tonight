package dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

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

import data.KitchenDAO;
import data.KitchenDAOImpl;
import data.MenuDAO;
import data.MenuDAOImpl;
import entities.Course;
import entities.Kitchen;
import entities.MenuItem;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "../WEB-INF/Test-context.xml" })
@WebAppConfiguration
@Transactional
public class MenuTest {

	@Autowired
	WebApplicationContext wac;

	@Autowired
	MenuDAO dao;

	@PersistenceContext
	private EntityManager em;

	@Before
	public void setUp() throws Exception {
		dao = (MenuDAO)wac.getBean("menuDAO");

	}
	
	@After
	public void tearDown() {
		dao = null;
		wac = null;
		// em = null;
	}
	

	@Test
	public void test() {
		boolean pass = true;
		assertEquals(pass, true);
	}

	@Test
	public void testGetAllMenuItemsFromAppetizers() {
		List<MenuItem> m = dao.getAllMenuItemsFromAppetizers(1);
		assertEquals("Soup du Jour", m.get(0).getName());
	}
	
	@Test 
	public void testGetAllMenuItemsFromEntres(){
		List<MenuItem> m = dao.getAllMenuItemsFromEntrees(1);
		assertEquals("Sockeye Salmon", m.get(0).getName());
	}
	
	@Test 
	public void testGetAllMenuItemsFromDesserts(){
		List<MenuItem> m = dao.getAllMenuItemsFromDesserts(1);
		assertEquals("Chevre Cheesecake", m.get(0).getName());
	}
	
	@Test 
	public void testGetAllMenuItemsFromDrinks(){
		List<MenuItem> m = dao.getAllMenuItemsFromDrinks(1);
		assertEquals("Cinnamental", m.get(0).getName());
	}


	@Test
	public void test_create_an_item() {
		MenuItem menu = new MenuItem();
		menu.setName("TestName");
		menu.setDescription("Test Description");
		menu.setPrice(99.99);
		menu.setPicture("pic");
		menu.setKitchen(em.find(Kitchen.class, 1));
		Course c = em.find(Course.class, 1);
		System.out.println(c);
		menu.setCourse(c);
		MenuItem test = dao.createMenuItem(menu, 0, 0);
		assertEquals("TestName", test.getName());
		assertEquals("Test Description", test.getDescription());
		assertEquals("pic", test.getPicture());
		assertEquals("French", test.getKitchen().getName());
		
//		dao.removeMenuItem(test.getId());	
	}
	
	@Test
	public void test_edit_a_menu_item() {
		MenuItem menu = new MenuItem();
		menu.setName("TestName");
		menu.setDescription("Test Description");
		menu.setPrice(99.99);
		menu.setPicture("pic");
		menu.setKitchen(em.find(Kitchen.class, 1));
		menu.setCourse(em.find(Course.class, 1));
		dao.createMenuItem(menu, 0, 0);
		menu.setName("FINAL TEST");
		menu.setDescription("TESTING DESC");
		MenuItem test = dao.updateMenuItem(menu.getId(), menu, 0);
		assertEquals("FINAL TEST", test.getName());
//		dao.removeMenuItem(test.getId());

	}
	
	@Test
	public void test_delete_a_menu_item() {
		MenuItem menu = new MenuItem();
		menu.setName("TestName");
		menu.setDescription("Test Description");
		menu.setPrice(99.99);
		menu.setPicture("pic");
		menu.setKitchen(em.find(Kitchen.class, 1));
		menu.setCourse(em.find(Course.class, 1));
		dao.createMenuItem(menu, 0, 0);
		System.out.println("***"+dao.createMenuItem(menu, 0, 0));
//		assertEquals(false, dao.removeMenuItem(menu.getId()));
	}
	
	@Test
	public void test_delete_many_menu_item_by_kitchen_id() {
		
	}
	
	
}
