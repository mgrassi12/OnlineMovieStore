package oms.user;

import java.io.Serializable;
import java.util.ArrayList;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import oms.movie.Movie;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "user", namespace = "http://www.uts.edu.au/31284/oms")
public class User implements Serializable {
    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "password")
    private String password;
    @XmlElement(name = "phone")
    private String phone;
    @XmlElement(name = "address")
    private String address;
    @XmlElement(name = "movie")
    private ArrayList<Movie> movies = new ArrayList<Movie>();
    
    public User() {}

    public User(String name, String email, String password, String phone, String address) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.movies = new ArrayList<Movie>();
    }
    
    public void updateUser(String name, String email, String password, String phone, String address) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.address = address;
    }

    //Gets user name
    public String getName() {
        return name;
    }

    //Gets user email
    public String getEmail() {
        return email;
    }

    //Gets user password
    public String getPassword() {
        return password;
    }

    //Gets user phone
    public String getPhone() {
        return phone;
    }

    //Gets user address
    public String getAddress() {
        return address;
    }

    //Sets user name
    public void setName(String name) {
        this.name = name;
    }

    //Sets user email
    public void setEmail(String email) {
        this.email = email;
    }

    //Sets user password
    public void setPassword(String password) {
        this.password = password;
    }

    //Sets user phone number
    public void setPhone(String phone) {
        this.phone = phone;
    }

    //Sets user address
    public void setAddress(String address) {
        this.address = address;
    }

    //Gets the movies
    public ArrayList<Movie> getMovies() {
        return movies;
    }

    //Sets the movies
    public void setMovies(ArrayList<Movie> movies) {
        this.movies = movies;
    }
    
    //Adds movies to the users cart
    public void addToCart(Movie movie) {
        this.movies.add(movie);
    }
    
    //Removes movies from the users cart
    public void removeFromCart(Movie movie) {
        this.movies.remove(movie);
    }
    
    //Clears the users cart
    public void clearCart() {
        this.movies.clear();
    }
}
