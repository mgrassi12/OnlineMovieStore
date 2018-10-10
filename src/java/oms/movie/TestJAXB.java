package oms.movie;

import java.io.*;
import javax.xml.bind.*;

public class TestJAXB implements Serializable {

    public static void main(String[] args) throws Exception {
        Movies movies = new Movies();
        movies.addMovie(new Movie("Die Hard", "Action", "06-10-1988", 10, 5));
        movies.addMovie(new Movie("Deadpool", "Romance", "11-02-2016", 20.5, 3));
        // Boilerplate code to convert objects to XML...
        JAXBContext jc = JAXBContext.newInstance(Movies.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        m.marshal(movies, System.out);
    }
}
