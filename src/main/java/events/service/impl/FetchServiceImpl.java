package events.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
@Transactional
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
		return artistDao.findArtistById(id);
	}

	public Category getCategoryById(Integer id) {
		return categoryDao.findCategoryById(id);
	}

	public Event getEventById(Integer id) {
		return eventDao.findEventById(id);
	}

	public Ticket getTicketById(Integer id) {
		return ticketDao.findByTicketId(id);
	}

	public User getUserById(Integer id) {
		return userDao.findUserById(id);
	}

	public List<Ticket> getUserTickets(Integer userId) {
		return ticketDao.getUserTickets(userId);
	}

}
