package events.model;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class Event {
	private Integer id;
	private String name;
	private String location;
	private Date startDate;
	private Date endDate;
	private Byte[] image;
	private Category category;
	private List<Artist> artists;
	
	public Event() {
	}
	
	public Event(Integer id, String name, String location, 
			Date startDate, Date endDate, Byte[] image,
			Category category, List<Artist> artists) {
		super();
		this.id = id;
		this.name = name;
		this.location = location;
		this.startDate = startDate;
		this.endDate = endDate;
		this.image = image;
		this.category = category;
		this.artists = artists;
	}

	@Override
	public String toString() {
		return "Event [id=" + id + ", name=" + name + ", location=" + location + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", image=" + Arrays.toString(image) + ", category=" + category + ", artists="
				+ artists + "]";
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
	
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public Date getStartDate() {
		return startDate;
	}
	
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	public Date getEndDate() {
		return endDate;
	}
	
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public Byte[] getImage() {
		return image;
	}
	
	public void setImage(Byte[] image) {
		this.image = image;
	}
	
	public Category getCategory() {
		return category;
	}
	
	public void setCategory(Category category) {
		this.category = category;
	}
	
	public List<Artist> getArtists() {
		return artists;
	}
	
	public void setArtists(List<Artist> artists) {
		this.artists = artists;
	}
	
}
