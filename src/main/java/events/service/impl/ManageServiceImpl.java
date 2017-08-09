package events.service.impl;

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
import events.service.ManageService;

@Service
@Transactional
public class ManageServiceImpl implements ManageService {

	@Autowired
	private ArtistDAO artistDao;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private EventDAO eventDAO;
	
	
	public void saveArtist(Artist artist) {
		artistDao.saveArtist(artist);
		
	}

	public void deleteArtist(Artist artist) {
		artistDao.deleteArtist(artist);
		
	}

	public void deleteArtistById(Integer id) {
		artistDao.deleteArtistById(id);
		
	}
		
	
	public void saveCategory(Category category) {
		categoryDAO.saveCategory(category);
		
	}

	public void deleteCategory(Category category) {
		categoryDAO.deleteCategory(category);
		
	}

	public void deleteCategoryById(Integer id) {
		categoryDAO.deleteCategoryById(id);
		
	}
	
	public void saveEvent(Event event) {
		eventDAO.saveEvent(event);
		
	}

	public void deleteEvent(Event event) {
		eventDAO.deleteEvent(event);
		
	}

	public void deleteEvent(Integer id) {
		eventDAO.deleteEvent(id);
		
	}

	@Autowired
	private TicketDAO ticketDAO;
	
	public void saveTicket(Ticket ticket) {
		ticketDAO.saveTicket(ticket);
		
	}

	public void deleteTicket(Ticket ticket) {
		ticketDAO.deleteTicket(ticket);
		
	}

	public void deleteTicketById(Integer id) {
		ticketDAO.deleteTicketById(id);
		
	}

	
	public void saveUser(User user) {
		userDAO.saveUser(user);
		
	}

	public void deleteUser(User user) {
		userDAO.deleteUser(user);
		
	}

	public void deleteUserById(Integer id) {
		userDAO.deleteUserById(id);
		
	}

}
