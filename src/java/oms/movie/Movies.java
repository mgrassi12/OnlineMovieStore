package oms.movie;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "movies", namespace = "http://www.uts.edu.au/31284/oms")
public class Movies implements Serializable {

    @XmlElement(name = "movie")
    private ArrayList<Movie> list = new ArrayList<Movie>();

    //Returns an array list of all movies in movies.xml
    public ArrayList<Movie> getList() {
        return list;
    }

    //Sets the current movie with the given movie
    public void setList(ArrayList<Movie> list) {
        this.list = list;
    }

    //Adds a movie to movies.xml
    public void addMovie(Movie movie) {
        list.add(movie);
    }

    //Removes a movie from movies.xml
    public void removeMovie(Movie movie) {
        list.remove(movie);
    }

    //Compares to see if and how many movies match with the searched title
    public ArrayList<Movie> getTitleMatches(String title) {
        ArrayList<Movie> matches = new ArrayList<>();
        for (Movie movie : list) {
            if (movie.matchTitle(title)) {
                matches.add(movie);
            }
        }
        return matches;
    }

    //Compares to see if and how many movies match with the searched genre
    public ArrayList<Movie> getGenreMatches(String genre) {
        ArrayList<Movie> matches = new ArrayList<>();
        for (Movie movie : list) {
            if (movie.matchGenre(genre)) {
                matches.add(movie);
            }
        }
        return matches;
    }

    //Compares to see if and how many movies match with the searched year or years
    public ArrayList<Movie> getDateMatches(String date) {
        ArrayList<Movie> matches = new ArrayList<>();
        for (Movie movie : list) {
            if (movie.matchDate(date)) {
                matches.add(movie);
            }
        }
        return matches;
    }
}
