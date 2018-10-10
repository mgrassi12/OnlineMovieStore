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
    @XmlElement(name = "purchased")
    private int purchased;
    
    public Movie() {}
    
    public Movie(String title, String genre, String releasedate, double price, int availablecopies) {
        this.title = title;
        this.genre = genre;
        this.releasedate = releasedate;
        this.price = price;
        this.availablecopies = availablecopies;
        this.purchased = 0;
    }
    
    //Updates movie information 
    public void updateMovie(String title, String genre, String releasedate, double price, int availablecopies) {
        this.title = title;
        this.genre = genre;
        this.releasedate = releasedate;
        this.price = price;
        this.availablecopies = availablecopies;
    }

    //Gets movie title
    public String getTitle() {
        return title;
    }

    //Gets movie genre
    public String getGenre() {
        return genre;
    }

    //Gets movie releasedate
    public String getReleasedate() {
        return releasedate;
    }

    //Gets movie price
    public double getPrice() {
        return price;
    }

    //Gets available copies of a movie
    public int getAvailablecopies() {
        return availablecopies;
    }

    //Sets movie title
    public void setTitle(String title) {
        this.title = title;
    }
    
    //Sets movie genre
    public void setGenre(String genre) {
        this.genre = genre;
    }

    //Sets movie release date
    public void setReleasedate(String releasedate) {
        this.releasedate = releasedate;
    }

    //Sets movie price
    public void setPrice(double price) {
        this.price = price;
    }

    //Sets available copies of a movie
    public void setAvailablecopies(int availablecopies) {
        this.availablecopies = availablecopies;
    }
    
    //Matches the dates of movies that users search for
    public boolean matchDate(String years){
        int release_year = Integer.parseInt(this.releasedate.substring(Math.max(0, this.releasedate.length() - 4), this.releasedate.length()));
        int begin_year = Integer.parseInt(years.substring(0, Math.min(years.length(), 4)));
        int end_year = Integer.parseInt(years.substring(Math.max(0, years.length() - 4), years.length()));
        return ((release_year >= begin_year) && (release_year <= end_year));
    }
    
    //Matches the genre of movies that users search for
    public boolean matchGenre(String genre2){
        String genre_1 = this.genre.toLowerCase().trim();
        String genre_2 = genre2.toLowerCase().trim();
        return genre_1.equals(genre_2);
    }
    
    //Matches the title of movies that users search for
    public boolean matchTitle(String title2){
        String title_1 = this.title.toLowerCase().trim();
        String title_2 = title2.toLowerCase().trim();
        return title_1.equals(title_2);
    }

    //Gets number of purchased titles 
    public int getPurchased() {
        return purchased;
    }

    //Sets purchased movies
    public void setPurchased(int purchased) {
        this.purchased = purchased;
    }
}