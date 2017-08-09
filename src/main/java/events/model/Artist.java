package events.model;

import java.util.ArrayList;
import java.util.List;

public class Artist {
	private Integer id;
	private String name;
	private List<Event> events;

	public Artist() {

	}

	public Artist(Integer id, String name, List<Event> events) {
		this.id = id;
		this.name = name;
		this.events = events;
	}

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void addEvent(Event event) {
		if (events == null) {
			events = new ArrayList<Event>();
		}
		events.add(event);
	}

}
