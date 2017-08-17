package events.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import events.dao.EventDAO;
import events.model.Event;

@Repository
public class EventDAOImpl implements EventDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		  return sessionFactory.getCurrentSession();
	}
	
	public Event findEventById(Integer id) {
		Query query = getCurrentSession().createQuery("from Event where id = :id ");
		query.setParameter("id", id);
		return (Event) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<Event> getAllEvents() {
		String query = new String("from Event");
		return getCurrentSession().createQuery(query).list();
	}

	public void saveEvent(Event event) {
		getCurrentSession().saveOrUpdate(event);
	}

	public void deleteEvent(Event event) {
		getCurrentSession().delete(event);
	}

	public void deleteEvent(Integer id) {
		Query query = getCurrentSession().createQuery("delete Event where id = :id ");
		query.setParameter("id", id);
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<Event> getNextEvents() {
		String hql = "From Event where startDate >= :currentdate order by startDate desc";
		Query query = getCurrentSession().createQuery(hql);
		query.setParameter("currentdate", new Date());
		return query.list();
	}
	
}
