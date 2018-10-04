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
 
    public ArrayList<Movie> getList() {
        return list;
    }
    public void addMovie(Movie movie) {
        list.add(movie);
    }
    public void removeMovie(Movie movie) {
        list.remove(movie);
    }
}
