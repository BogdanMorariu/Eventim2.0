package events.dao;

import java.util.List;

import events.model.Event;

public interface EventDAO {
	Event findEventById(Integer id);
	List<Event> getAllEvents();
	void saveEvent(Event event);
	void deleteEvent(Event event);
	void deleteEvent(Integer id);
	List<Event> getNextEvents();
}
