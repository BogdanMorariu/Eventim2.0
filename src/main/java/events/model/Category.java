package events.model;

import java.util.List;


public class Category {
	private Integer id;
	private String type;
	private List<Event> events;
		
		
	
	/**
	 * getters & setters
	 * @return
	 */
	
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


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}
		
}
