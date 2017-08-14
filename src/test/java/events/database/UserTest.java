package events.database;

import org.junit.Test;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import static org.junit.Assert.*;

import java.util.List;

import events.model.Ticket;
import events.model.User;
import events.service.FetchService;
import events.service.ManageService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test-config.xml")
public class UserTest {
	
	@Autowired
	private FetchService fetchService;
	
	@Autowired
	private ManageService manageService;
	
	@Test
	public void testAddUser() {
		User user = new User();
		user.setName("Cristin");
		user.setPassword("myPass");
		user.setType("type1");
		manageService.saveUser(user);
		
		Ticket ticket = new Ticket();
		ticket.setEvent(fetchService.getEventById(2));
		ticket.setBarcode(35346l);
		ticket.setUser(user);
		manageService.saveTicket(ticket);
		
		Ticket ticket1 = new Ticket();
		ticket1.setEvent(fetchService.getEventById(2));
		ticket1.setBarcode(35346l);
		ticket1.setUser(user);
		manageService.saveTicket(ticket1);
		
		assertNotNull(user.getId());
		assertNotNull(ticket.getId());
		assertNotNull(ticket1.getId());
	}
	
	
	
	@Test
	public void testDeleteUser(){
		User user = fetchService.getUserById(14);
		manageService.deleteUser(user);
		user = fetchService.getUserById(14);
		assertNull(user);
		
	}
	
	@Test
	public void testDeleteUserById(){
		manageService.deleteUserById(15);
		User user = fetchService.getUserById(15);
		assertNull(user);
		
	}
	
	@Test
	public void testFindUserById(){
		User user = fetchService.getUserById(1);
		assertNotNull(user);
	}
	
	@Test
	public void testGetAllUsers(){
		List<User> list=fetchService.getAllUsers();
		assertNotNull(list);
	}
	
	@Test
	public void testFindUserAtLogin(){
		String username = "cristin";
		User user = fetchService.findUserAtLogin(username);
		assertNotNull(user);
		
	}

}
