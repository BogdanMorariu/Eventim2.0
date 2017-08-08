package events.service;

import events.model.Artist;
import events.model.Category;
import events.model.Event;
import events.model.Ticket;
import events.model.User;

public interface ManageService {

	public void saveArtist(Artist artist);

	public void deleteArtist(Artist artist);

	public void deleteArtistById(Integer id);

	public void saveCategory(Category category);

	public void deleteCategory(Category category);

	public void deleteCategoryById(Integer id);

	void saveEvent(Event event);

	void deleteEvent(Event event);

	void deleteEvent(Integer id);

	void saveTicket(Ticket ticket);

	void deleteTicket(Ticket ticket);

	void deleteTicketById(Integer id);

	public void saveUser(User user);

	public void deleteUser(User user);

	public void deleteUserById(Integer id);
}
