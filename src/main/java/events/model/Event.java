package events.model;

import java.util.Date;

public class Event {
	private Integer id;
	private String name;
	private String location;
	private Date startDate;
	private Date endDate;
	private Byte[] image;
	private Integer category_id;
	
	
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
	
	public Integer getCategory_id() {
		return category_id;
	}
	
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}
	
}
