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

    @XmlElement(name = "id")
    private int id;
    @XmlElement(name = "movie")
    private ArrayList<Movie> movies = new ArrayList<Movie>();
    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "paymentmethod")
    private String paymentmethod;
    @XmlElement(name = "saletotal")
    private double saletotal;
    @XmlElement(name = "status")
    private String status;

    public Order() {
    }

    public Order(int id, ArrayList<Movie> movies, String name, String email, String paymentmethod, double saletotal, String status) {
        this.id = id;
        this.movies = movies;
        this.name = name;
        this.email = email;
        this.paymentmethod = paymentmethod;
        this.saletotal = saletotal;
        this.status = status;
    }

    //Gets order id
    public int getId() {
        return id;
    }

    //Sets order id
    public void setId(int id) {
        this.id = (new Random().nextInt(999));
    }

    //Gets movies in an order
    public ArrayList<Movie> getMovies() {
        return movies;
    }

    //Sets movies in an order
    public void setMovies(ArrayList<Movie> movies) {
        this.movies = movies;
    }

    //Gets name of the person who ordered
    public String getName() {
        return name;
    }

    //Sets the name of the person who ordered
    public void setName(String name) {
        this.name = name;
    }

    //Gets the email of the person who ordered
    public String getEmail() {
        return email;
    }

    //Sets the email of the person who ordered
    public void setEmail(String email) {
        this.email = email;
    }

    //Gets the payment method used
    public String getPaymentmethod() {
        return paymentmethod;
    }

    //Sets the payment method used
    public void setPaymentmethod(String paymentmethod) {
        this.paymentmethod = paymentmethod;
    }

    //Gets sale total of the order
    public double getSaletotal() {
        return saletotal;
    }

    //Sets sale total of the order
    public void setSaletotal(double saletotal) {
        this.saletotal = saletotal;
    }

    //Gets the status of the order
    public String getStatus() {
        return status;
    }

    //Sets the status of the order
    public void setStatus(String status) {
        this.status = status;
    }
}
