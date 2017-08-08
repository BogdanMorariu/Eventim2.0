package events.service;

import java.util.List;

import events.model.Artist;
import events.model.Category;
import events.model.Event;
import events.model.Ticket;
import events.model.User;

public interface FetchService {

	//Get all
	List<Artist> getAllArtists();
	List<Category> getAllCategories();
	List<Event> getAllEvents();
	List<Ticket> getAllTickets();
	List<User> getAllUsers();

	//Get by ID
	Artist getArtistById(Integer id);
	Category getCategorieById(Integer id);
	Event getEventById(Integer id);
	Ticket getTicketById(Integer id);
	User getUserById(Integer id);

}
