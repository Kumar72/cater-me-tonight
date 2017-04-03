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

import data.MenuDAO;
import data.MenuDAOImpl;
import entities.Course;
import entities.MenuItem;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/WEB-INF/Test-context.xml" })
@WebAppConfiguration
@Transactional
public class MenuTest {

	@Test
	public void test() {
		boolean pass = true;
		assertEquals(pass, true);
	}

	@Autowired
	WebApplicationContext wac;

	@Autowired
	MenuDAO dao;

	@PersistenceContext
	private EntityManager em;

	@Before
	public void setUp() throws Exception {
		dao = new MenuDAOImpl();
		dao.setEntityManager(em);
	}

	@Test
	public void getAllMenuItemsFromAppetizers() {
		List<MenuItem> m = dao.getAllMenuItemsFromAppetizers(1);
		assertEquals("", m.get(0).getCourse());
	}

	@After
	public void tearDown() {
		dao = null;
		wac = null;
		// em = null;
	}

	
}
