package oms.order;

import java.io.Serializable;
import java.util.*;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import oms.movie.Movie;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "order", namespace = "http://www.uts.edu.au/31284/oms")
public class Order implements Serializable {
    @XmlElement (name = "id")
    private int id;
    @XmlElement (name = "movie")
    private ArrayList<Movie> movies = new ArrayList<Movie>();
    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "email")
    private String email;
    @XmlElement (name = "paymentmethod")
    private String paymentmethod;
    @XmlElement (name = "saletotal")
    private double saletotal;
    @XmlElement (name = "status")
    private String status;
 
    
public Order() {}

public Order(int id, ArrayList<Movie> movies, String name, String email, String paymentmethod, double saletotal, String status){
    this.id = id;
    this.movies = movies;
    this.name = name;
    this.paymentmethod = paymentmethod;
    this.saletotal = saletotal;
    this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = (new Random().nextInt(999));
    }

    public ArrayList<Movie> getMovies() {
        return movies;
    }

    public void setMovies(ArrayList<Movie> movies) {
        this.movies = movies;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPaymentmethod() {
        return paymentmethod;
    }

    public void setPaymentmethod(String paymentmethod) {
        this.paymentmethod = paymentmethod;
    }

    public double getSaletotal() {
        return saletotal;
    }

    public void setSaletotal(double saletotal) {
        this.saletotal = saletotal;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
