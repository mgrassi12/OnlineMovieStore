package oms.movie;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

@XmlAccessorType(XmlAccessType.FIELD)
public class Movie implements Serializable {
    @XmlElement(name = "title")
    private String title;
    @XmlElement(name = "genre")
    private String genre;
    @XmlElement(name = "releasedate")
    private String releasedate;
    @XmlElement(name = "price")
    private double price;
    @XmlElement(name = "availablecopies")
    private int availablecopies;
    
    public Movie() {}
    
    public Movie(String title, String genre, String releasedate, double price, int availablecopies) {
        this.title = title;
        this.genre = genre;
        this.releasedate = releasedate;
        this.price = price;
        this.availablecopies = availablecopies;
    }
    
    public void updateMovie(String title, String genre, String releasedate, double price, int availablecopies) {
        this.title = title;
        this.genre = genre;
        this.releasedate = releasedate;
        this.price = price;
        this.availablecopies = availablecopies;
    }

    public String getTitle() {
        return title;
    }

    public String getGenre() {
        return genre;
    }

    public String getReleasedate() {
        return releasedate;
    }

    public double getPrice() {
        return price;
    }

    public int getAvailablecopies() {
        return availablecopies;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setReleasedate(String releasedate) {
        this.releasedate = releasedate;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setAvailablecopies(int availablecopies) {
        this.availablecopies = availablecopies;
    }
}

