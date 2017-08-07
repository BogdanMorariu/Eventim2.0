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
		return null;
	}

	public List<Artist> getAllArtists() {
		return null;
	}

	public void saveArtist(Artist artist) {

	}

	public void deleteArtist(Artist artist) {

	}

	public void deleteArtistById(Integer id) {

	}

}
