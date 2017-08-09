package events.database;

import static org.junit.Assert.*;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import events.model.Artist;
import events.model.Category;
import events.model.Event;
import events.model.Ticket;
import events.service.FetchService;
import events.service.ManageService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test-config.xml")

public class EventTest {

	@Autowired
	private FetchService fetchService;
	
	@Autowired
	private ManageService manageService;
	
	@Test
	public void testAddEvent() throws ParseException {
		Event event = new Event();
		Category category = fetchService.getCategorieById(1);
		DateFormat df = new SimpleDateFormat("mm/dd/yyyy");
		Date startDate = df.parse("12/07/2017");
		Date endDate = df.parse("16/07/2017");
		event.setName("Electric Castle");
		event.setLocation("Cluj, Bontida");
		event.setStartDate(startDate);
		event.setEndDate(endDate);
		event.setCategory(category);
		
		Ticket ticket = fetchService.getTicketById(2);
		event.addTicket(ticket);
		
		Artist artist = new Artist();
		artist.setName("gaga");
		Artist artist2 = new Artist();
		artist2.setName("gaga2");
		manageService.saveArtist(artist);
		manageService.saveArtist(artist2);
		event.addArtist(artist);
		event.addArtist(artist2);
		manageService.saveEvent(event);
		assertNotNull(event.getId());
		
		
		
	}
	
	@Test
	public void testFindById(){
		Event event = fetchService.getEventById(1);
		assertNotNull(event);
	}
	
	@Test
	public void testDeleteEvent(){
		Event event = fetchService.getEventById(4);
		manageService.deleteEvent(event);
		event = fetchService.getEventById(4);
		assertNull(event);
	}
	
	@Test
	public void testDeleteEventById(){
		manageService.deleteEvent(1);
		Event event = fetchService.getEventById(1);
		assertNull(event);
	}
	
	@Test
	public void testGetAllEvents(){
		List<Event> events = fetchService.getAllEvents();
		assertNotNull(events);
	}
}
