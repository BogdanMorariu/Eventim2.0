package events.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import events.dao.ArtistDAO;
import events.model.Artist;

@Repository
public class ArtistDAOImpl implements ArtistDAO {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public Artist findArtistById(Integer id) {
		String hql = "from Artist where id =" + id;
		return (Artist) getCurrentSession().createQuery(hql).uniqueResult();
	}

	public List<Artist> getAllArtists() {
		String hql = "from Artist";
		return getCurrentSession().createQuery(hql).list();
	}

	public void saveArtist(Artist artist) {
		getCurrentSession().saveOrUpdate(artist);
	}

	public void deleteArtist(Artist artist) {
		getCurrentSession().delete(artist);
	}

	public void deleteArtistById(Integer id) {
		String hql = "delete from Artist where id = " + id;
		getCurrentSession().createQuery(hql).executeUpdate();
	}

}
