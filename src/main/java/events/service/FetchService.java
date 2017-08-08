package events.service;

import java.util.List;

import events.model.Artist;
import events.model.Category;
import events.model.Event;
import events.model.Ticket;
import events.model.User;

public interface FetchService {
	public List<Artist> getAllArtists();
	public List<Category> getAllCategories();
	public List<Event> getAllEvents();
	public List<Ticket> getAllTickets();
	public List<User> getAllUsers();
	
}
