package events.model;

import java.util.List;

public class Artist {
	private Integer id;
	private String name;
	private List<Event> events;
	
	

	
	public List<Event> getEvents(){
		return this.getEvents();
	}
	
	public void setEvents(List<Event> events){
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
	
	
}
