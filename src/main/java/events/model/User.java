package events.model;

public class User {
	private Integer id;
	private String name;
	private String password;
	private String type;

	public User(Integer id, String name, String password, String type) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.type = type;

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

}
