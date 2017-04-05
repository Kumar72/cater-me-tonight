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

import data.AddressDAO;
import entities.Address;
import entities.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "../WEB-INF/Test-context.xml" })
@WebAppConfiguration
@Transactional
public class AddressTest {

	@Autowired
	WebApplicationContext wac;

	@Autowired
	AddressDAO dao;

	@PersistenceContext
	private EntityManager em;

	@Before
	public void setUp() throws Exception {
		dao = (AddressDAO) wac.getBean("addressDAO");
	}

	@After
	public void tearDown() throws Exception {
		dao = null;
		wac = null;
		em = null;
	}

	@Test // Basic test
	public void test() {
		boolean pass = true;
		assertEquals(pass, true);
	}

	// Tests for retrieving address information
	@Test
	public void testGetAddressCity() {
		Address address = em.find(Address.class, 1);
		assertEquals("Denver", address.getCity());
	}

	@Test
	public void testGetStreetAddress() {
		Address address = em.find(Address.class, 1);
		assertEquals("7400 E. Orchard Rd", address.getStreetAddress());
	}

	@Test
	public void testGetState() {
		Address address = em.find(Address.class, 1);
		assertEquals("CO", address.getState());
	}

	@Test
	public void testGetPostalCode() {
		Address address = em.find(Address.class, 1);
		assertEquals(80301, address.getPostalCode());
	}

	@Test
	public void testGetAddressId() {
		Address address = em.find(Address.class, 1);
		assertEquals(1, address.getId());
	}

	@Test
	public void testListAllAddresses() {
		List<Address> address = dao.getAllAddresses();
		assertEquals("1st St Merlin Dr. ", address.get(2).getStreetAddress());
	}

	// Test for creating a new Address
	@Test
	public void testCreateANewDeliveryAddress() {
		Address address = new Address();
		address.setCountry("USA");
		address.setState("Colorado");
		address.setCity("Littleton");
		address.setPostalCode(80224);
		address.setStreetAddress("4456 S. MainStreet way");
		address.setUser(em.find(User.class, 1));
		Address returnedAddress = dao.makeANewAddress(address);
		System.out.println(returnedAddress.getId());
		assertEquals("USA", returnedAddress.getCountry());
		assertEquals("Colorado", returnedAddress.getState());
		assertEquals("Littleton", returnedAddress.getCity());
		assertEquals(80224, returnedAddress.getPostalCode());
		assertEquals("4456 S. MainStreet way", returnedAddress.getStreetAddress());

	}
	// Test for updating an address

	@Test
	public void testUpdateAnAddress() {
		Address address = em.find(Address.class, 1);
		address.getCountry();
		address.getState();
		address.getCity();
		address.getPostalCode();
		address.getStreetAddress();
		dao.makeANewAddress(address);
		address.setCountry("China");
		address.setState("HangZhou");
		address.setCity("Chinatown");
		address.setPostalCode(67676);
		address.setStreetAddress("1234 S ChinaTown St.");

		assertEquals("China", address.getCountry());
		assertEquals("HangZhou", address.getState());
		assertEquals("Chinatown", address.getCity());
		assertEquals(67676, address.getPostalCode());
		assertEquals("1234 S ChinaTown St.", address.getStreetAddress());

	}

	// Test for removing an address

	@Test
	public void testRemoveAnAddress() {
		Address address = em.find(Address.class, 1);
		assertEquals(true, dao.removeAnAddress(address.getId()));
	}
}
