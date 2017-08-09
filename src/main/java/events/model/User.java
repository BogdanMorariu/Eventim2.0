package events.model;

import java.util.ArrayList;
import java.util.List;

public class User {
	private Integer id;
	private String name;
	private String password;
	private String type;
	private List<Ticket> tickets;

	public List<Ticket> getTickets() {
		return this.tickets;
	}

	public void setTickets(List<Ticket> list) {
		tickets = list;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "User [id=" + this.id + ", name=" + this.name + ", password=" + this.password + ", type=" + this.type
				+ "]";
	}

	public void addTicket(Ticket ticket) {
		if (tickets == null) {
			tickets = new ArrayList<Ticket>();
		}
		tickets.add(ticket);
	}

}
