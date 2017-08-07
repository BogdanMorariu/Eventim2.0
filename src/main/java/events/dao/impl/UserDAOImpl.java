package events.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import events.dao.UserDAO;
import events.model.User;

@Repository
public class UserDAOImpl implements UserDAO{

	public User findUserById(Integer id) {
		
		return null;
	}

	public List<User> getAllUsers() {
		
		return null;
	}

	public void saveUser(User user) {
		
		
	}

	public void deleteUser(User user) {
		
		
	}

	public void deleteUserById(Integer id) {
		
		
	}
	
	

}
