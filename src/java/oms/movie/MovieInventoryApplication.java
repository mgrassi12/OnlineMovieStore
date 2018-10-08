package oms.movie;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class MovieInventoryApplication {
    private String filePath;
    private Movies movies;

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException {        
        JAXBContext jc = JAXBContext.newInstance(Movies.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;
        FileInputStream fin = new FileInputStream(filePath);
        movies = (Movies)u.unmarshal(fin);
        fin.close();
    }

    public Movies getMovies() {
        return movies;
    }

    public void setMovies(Movies movies) throws Exception {
        this.movies = movies;
        updateXML(this.movies, this.filePath);
    }
    
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