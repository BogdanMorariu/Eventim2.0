package events.service;

import java.util.List;

import events.model.*;

public interface FetchService {

	//Get all
	List<Artist> getAllArtists();
	List<Category> getAllCategories();
	List<Event> getAllEvents();
	List<Ticket> getAllTickets();
	List<User> getAllUsers();
	List<TemporaryUser> getAllTemporaryUsers();
	List<Event> getNextEvents();
	
	//Get by ID
	Artist getArtistById(Integer id);
	Category getCategoryById(Integer id);
	Event getEventById(Integer id);
	Ticket getTicketById(Integer id);
	User getUserById(Integer id);
	TemporaryUser getTemporaryUserById(Integer id);

	//Get by Foreign key
	List<Ticket> getUserTickets(Integer userId);
	List<Event> getEventsByLocation(String location);
	List<Event> getEventByArtist(Integer artistId);
	List<Event> getEventByCategory(Integer categoryId);
	
	//Get by username & password
	User findUserAtLogin(String username);
	
	//Barcode_seq nextval
	Long getNextBarcode();
	
	

}
