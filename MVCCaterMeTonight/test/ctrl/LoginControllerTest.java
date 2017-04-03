package ctrl;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import controllers.LoginController;
import data.PlacedOrderDAO;
import data.UserDAO;
import entities.User;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"../WEB-INF/Test-context.xml"})
@WebAppConfiguration
@Transactional // you will need this if you are using DAO methods with transactions
public class LoginControllerTest {
  @Autowired
  private WebApplicationContext wac;

  private MockMvc mockMvc;

  @Autowired
  private LoginController controller;

  private UserDAO userDAO;
  private PlacedOrderDAO placedOrderDAO;


  @Before
  public void setUp() throws Exception {
	userDAO = (UserDAO) wac.getBean("userdao");
	placedOrderDAO = (PlacedOrderDAO) wac.getBean("placedorderdao");

//    dao = wac.getBean(FilmDAOImpl.class);
    controller.setUserDAO(userDAO);
    controller.setPlacedOrderDAO(placedOrderDAO);
    this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
  }

  @After
  public void tearDown() throws Exception {
    controller = null;
    mockMvc = null;
    wac = null;
  }
  
  @Test
  public void test_login_enter_valid_username_and_password_returns_select_view(){
    try {
      // Use MockMVC to create a request to the test servlet and get a response
      MvcResult response = mockMvc.perform(get("/Login.do")
    		  				.param("username", "Crank72")
    		  				.param("password", "client"))   		  				
                            .andExpect(
                                status().isOk()
                            ).andReturn();
      // Extract the returned ModelAndView from the response
      ModelAndView mv = response.getModelAndView();
      // Extract the Model from the ModelAndView
      ModelMap map = mv.getModelMap();
      // Cast the Object value paired to the "film" key to a Film object
      User user = (User) map.get("user");
      // Check the values with JUnit tests
      assertEquals("startorder", mv.getViewName());
      assertEquals("Crank72", user.getUsername());
    } catch (Exception e) {
      fail(e.toString());
    }
  }
  
//  @Test
//  public void test_get_films_returns_films_and_index_view(){
//    try {
//      // Use MockMVC to create a request to the test servlet and get a response
//      MvcResult response = mockMvc.perform(get("/GetFilms.do"))
//                            .andExpect(
//                                status().isOk()
//                            ).andReturn();
//      // Extract the returned ModelAndView from the response
//      ModelAndView mv = response.getModelAndView();
//      // Extract the Model from the ModelAndView
//      ModelMap map = mv.getModelMap();
//      // Cast the Object value paired to the "film" key to a Film object
//      List<Film> films = (List<Film>) map.get("films");
//      // Check the values with JUnit tests
//      assertEquals("film/index.jsp", mv.getViewName());
//      int expectedSize = 1002;
//      assertEquals(expectedSize, films.size());
//    } catch (Exception e) {
//      fail(e.toString());
//    }
//  }
//  
//  @Test
//  public void test_new_film_returns_new_view_with_languages(){
//    try {
//      MvcResult response = mockMvc.perform(get("/NewFilm.do"))
//                            .andExpect(
//                                status().isOk()
//                            ).andReturn();
//      ModelAndView mv = response.getModelAndView();
//      ModelMap map = mv.getModelMap();
//      assertNotNull(map.get("languages"));
//      assertEquals("film/new.jsp", mv.getViewName());
//      
//    } catch (Exception e) {
//      fail(e.toString());
//    }
//  }
//  
//  @Test
//  public void test_create_film_returns_show_view_and_new_film(){
//    try {
//      // Use MockMVC to create a request to the test servlet and get a response
//      MvcResult response = mockMvc.perform(post("/CreateFilm.do")
//    		  				.param("title", "Voom")
//    		  				.param("languageId", "1"))
//                            .andExpect(
//                                status().isOk()
//                            ).andReturn();
//      // Extract the returned ModelAndView from the response
//      ModelAndView mv = response.getModelAndView();
//      // Extract the Model from the ModelAndView
//      ModelMap map = mv.getModelMap();
//      String expectedTitle = "Voom";
//      assertEquals(expectedTitle, ((Film) map.get("film")).getTitle());
//      // Check the values with JUnit tests
//      assertEquals("film/show.jsp", mv.getViewName());
//      //CleanUp
//      filmDAO.destroy(((Film) map.get("film")).getId());
//      
//    } catch (Exception e) {
//      fail(e.toString());
//    }
//  }
//  
//  @Test
//  public void test_edit_film_returns_edit_view_with_languages(){
//    try {
//    	MvcResult response = mockMvc.perform(get("/EditFilm.do")
//    			.param("title", "Voom")
//  				.param("id", "1002"))
//                .andExpect(
//                    status().isOk()
//                ).andReturn();
//      ModelAndView mv = response.getModelAndView();
//      ModelMap map = mv.getModelMap();
//      assertNotNull(map.get("languages"));
//      assertEquals("film/edit.jsp", mv.getViewName());
//      
//    } catch (Exception e) {
//      fail(e.toString());
//    }
//  }
//  
//  @Test
//  public void test_update_film_returns_show_view_and_updated_film(){
//    try {
//      // Use MockMVC to create a request to the test servlet and get a response
//      MvcResult response = mockMvc.perform(post("/UpdateFilm.do")    		  				
//    		  				.param("fid", "1002")
//    		  				.param("title", "Voom")
//    		  				.param("languageId", "2"))
//                            .andExpect(
//                                status().isOk()
//                            ).andReturn();
//      // Extract the returned ModelAndView from the response
//      ModelAndView mv = response.getModelAndView();
//      // Extract the Model from the ModelAndView
//      ModelMap map = mv.getModelMap();
//      String expectedTitle = "Voom";
//      assertEquals(expectedTitle, ((Film) map.get("film")).getTitle());
//      // Check the values with JUnit tests
//      assertEquals("film/show.jsp", mv.getViewName());
//      
//      
//    } catch (Exception e) {
//      fail(e.toString());
//    }
//  }
//  
//  @Test
//  public void test_destroy_film_returns_index_videw_and_deletes_film(){
//	  try {
//	      // Use MockMVC to create a request to the test servlet and get a response
//	      MvcResult response = mockMvc.perform(post("/CreateFilm.do")
//	    		  				.param("title", "Voom")
//	    		  				.param("languageId", "1"))
//	                            .andExpect(
//	                                status().isOk()
//	                            ).andReturn();
//	      // Extract the returned ModelAndView from the response
//	      ModelAndView mv = response.getModelAndView();
//	      // Extract the Model from the ModelAndView
//	      ModelMap map = mv.getModelMap();
//	      response = mockMvc.perform(post("/DestroyFilm.do")
//	  				.param("fid", Integer.toString(((Film) map.get("film")).getId()))
//	  				)
//                  .andExpect(
//                      status().isOk()
//                  ).andReturn();
//	      // Check the values with JUnit tests
//	      mv = response.getModelAndView();
//	      map = mv.getModelMap();
//	      assertEquals("film/index.jsp", mv.getViewName());
//	      
//	      
//	    } catch (Exception e) {
//	      fail(e.toString());
//	    }
//  }
}