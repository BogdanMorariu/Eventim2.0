package events.dao;

import java.util.List;

import events.model.Artist;


public interface ArtistDAO {

	public Artist findArtistById(Integer id);
	public List<Artist> getAllArtists();
	public void saveArtist(Artist artist);
	public void deleteArtist(Artist artist);
	public void deleteArtistById(Integer id);
}
