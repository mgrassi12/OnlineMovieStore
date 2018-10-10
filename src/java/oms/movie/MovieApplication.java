package oms.movie;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class MovieApplication {
    private String filePath;
    private Movies movies;

    //Gets filepath
    public String getFilePath() {
        return filePath;
    }

    //Sets the filepath
    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException {        
        JAXBContext jc = JAXBContext.newInstance(Movies.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;
        FileInputStream fin = new FileInputStream(filePath);
        movies = (Movies)u.unmarshal(fin);
        fin.close();
    }

    //Gets movies
    public Movies getMovies() {
        return movies;
    }

    //Sets movies, by updating movies.xml
    public void setMovies(Movies movies) throws Exception {
        this.movies = movies;
        updateXML(this.movies, this.filePath);
    }
    
    //Updates the movies.xml with the given movies
    public void updateXML(Movies movies, String filePath) throws Exception {
        this.movies = movies;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Movies.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(movies, fout);
        fout.close();
    }
}