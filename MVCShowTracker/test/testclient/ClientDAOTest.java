package testclient;

import static org.junit.Assert.*;

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

import data.ClientDAO;
import entities.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "../WEB-INF/Test-context.xml" })
@WebAppConfiguration
@Transactional
public class ClientDAOTest {

	@Autowired
	private WebApplicationContext wac;

	@Autowired
	private ClientDAO dao;

	@PersistenceContext
	private EntityManager em;

	@Before
	public void setUp() {
		dao = (ClientDAO) wac.getBean("ClientDAOBean");
	}

	@After
	public void tearDown() {
		dao = null;
		em = null;
		wac = null;
	}

	@Test
	public void Test_Get_User_by_Username_Password() {
		User user = dao.getUser("Chaz", "chaz");
		assertNotNull(user);
		assertEquals("Chaaaz", user.getDisplayName());
	}
	
	@Test
	public void Test_Get_User_by_Id() {
		User user = dao.getUserByUserId(1);
		assertNotNull(user);
		assertEquals("Chaaaz", user.getDisplayName());
	}
	@Test
	public void test_get_all_shows() {
		List<TVShow> tvs = dao.getAllShows();
		assertNotNull(tvs);
		assertEquals(2, tvs.size());
		assertEquals("Season 1", tvs.get(0).getSeasons().get(0).getTitle());
		
	}
	
	@Test
	public void test_get_user_shows() {
		List<TVShow> tvs = dao.getUserShows(1);
		assertNotNull(tvs);
		assertEquals(2, tvs.size());
		//assertEquals("Season 1", tvs.get(0).getSeasons().get(0).getTitle());
		
	}
}