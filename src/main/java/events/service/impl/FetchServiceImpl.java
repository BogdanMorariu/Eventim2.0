package events.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import events.dao.ArtistDAO;
import events.dao.CategoryDAO;
import events.dao.EventDAO;
import events.dao.TicketDAO;
import events.dao.UserDAO;
import events.model.Artist;
import events.model.Category;
import events.model.Event;
import events.model.Ticket;
import events.model.User;
import events.service.FetchService;

@Service
public class FetchServiceImpl implements FetchService {

	@Autowired
	private ArtistDAO artistDao;
	
	@Autowired
	private CategoryDAO categoryDao;
	
	@Autowired
	private EventDAO eventDao;
	
	@Autowired
	private TicketDAO ticketDao;
	
	@Autowired
	private UserDAO userDao;
	
	public List<Artist> getAllArtists() {
		return artistDao.getAllArtists();
	}

	public List<Category> getAllCategories() {
		// TODO Auto-generated method stub
		return categoryDao.getAllCategories();
	}

	public List<Event> getAllEvents() {
		return eventDao.getAllEvents();
	}

	public List<Ticket> getAllTickets() {
		return ticketDao.getAllTickets();
	}

	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	public Artist getArtistById(Integer id) {
		return null;
	}

	public Category getCategorieById(Integer id) {
		return null;
	}

	public Event getEventById(Integer id) {
		return null;
	}

	public Ticket getTicketById(Integer id) {
		return null;
	}

	public User getUserById(Integer id) {
		return null;
	}

}
