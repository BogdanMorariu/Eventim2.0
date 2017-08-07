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
	
	@Autowired
	 private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	public User findUserById(Integer id) {
		
		String hql = "from User where id= " + id;
		return (User) getCurrentSession().createQuery(hql).uniqueResult();
	}

	public List<User> getAllUsers() {
		
		String hql="from User";
		return getCurrentSession().createQuery(hql).list();
	}

	public void saveUser(User user) {
		getCurrentSession().saveOrUpdate(user);
		
		
	}

	public void deleteUser(User user) {
	getCurrentSession().delete(user);
		
		
		
	}

	public void deleteUserById(Integer id) {
		
		String hql = "delete from User where id= " + id;
		getCurrentSession().createQuery(hql).executeUpdate();
		
		
	}
	
	

}
