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
import events.service.FetchService;
import events.service.ManageService;

@ContextConfiguration(locations = "classpath:spring-test-config.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class ArtistTest {
	
	@Autowired
	private FetchService fetchService;
	
	@Autowired
	private ManageService manageService;
	
	@Test
	public void testAddArtist() throws ParseException {
		Artist artist = new Artist();
		artist.setName("TestArtistNameX2");
		
		Event event = new Event();
		Category category = fetchService.getCategorieById(1);
		event.setName("EventtNameX2");
		DateFormat df = new SimpleDateFormat("mm/dd/yyyy");
		Date startDate = df.parse("12/07/2017");
		Date endDate = df.parse("16/07/2017");
		event.setName("Electric Castle");
		event.setLocation("Cluj, Bontida");
		event.setStartDate(startDate);
		event.setEndDate(endDate);
		event.setCategory(category);
		manageService.saveEvent(event);
		
		Event event2 = new Event();
		event2.setName("EventtNameX22");
		DateFormat df2 = new SimpleDateFormat("mm/dd/yyyy");
		Date startDate2 = df2.parse("12/07/2017");
		Date endDate2 = df2.parse("16/07/2017");
		event2.setName("Electric Castle");
		event2.setLocation("Cluj, Bontida");
		event2.setStartDate(startDate2);
		event2.setEndDate(endDate2);
		event2.setCategory(category);
		manageService.saveEvent(event2);
		
		artist.addEvent(event);
		artist.addEvent(event2);
		manageService.saveArtist(artist);
		assertNotNull(artist.getId());
	}
	
	@Test
	public void testDeleteArtist() {
		Artist artist = fetchService.getArtistById(2);
		manageService.deleteArtist(artist);
		artist = fetchService.getArtistById(2);
		assertNull(artist);
	}
	
	@Test
	public void testDeleteArtistById() {
		Artist artist = fetchService.getArtistById(1);
		manageService.deleteArtistById(1);
		artist = fetchService.getArtistById(1);
		assertNull(artist);
	}
	
	@Test
	public void testGetArtists() {
		List<Artist> listOfArtists = fetchService.getAllArtists();
		assertNotNull(listOfArtists);
	}
	
	@Test
	public void testGetArtistById() {
		Artist artist = fetchService.getArtistById(1);
		assertNotNull(artist);
	}
	
}
