package events.dao.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
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

	/*
	* Gets All events that are not expired !
	* The Parameters of the function are optional !
	* The values for the parameters to not be taken in consideration are:
	* location "", artistId=-1
	* */
	@SuppressWarnings("unchecked")
	//TODO something not good debug it!
	public List<Event> getNextEvents(String location,Integer artistId,Integer categoryId) {
		String hql = "from Event where startDate >= :currentdate";

		if(StringUtils.isNotBlank(location)){
			hql+=" and location = :loc";
		}
		if(artistId!=-1){
			hql+=" and artist_Id = :artid";
		}
		if(categoryId!=-1){
			hql+=" and category_id = :catid";
		}

		hql+=" order by startDate desc";
		Query query = getCurrentSession().createQuery(hql);
		query.setParameter("currentdate", new Date());

		if(StringUtils.isNotBlank(location)){
			query.setParameter("loc",location);
		}
		if(artistId!=-1){
			query.setParameter("artid",artistId);
		}
		if(categoryId!=-1){
			query.setParameter("catid",categoryId);
		}
		return query.list();
	}
	
}
