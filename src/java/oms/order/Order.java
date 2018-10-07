package oms.order;

import java.io.Serializable;
import java.util.ArrayList;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import oms.movie.Movie;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "order", namespace = "http://www.uts.edu.au/31284/oms")
public class Order implements Serializable {
    @XmlElement(name = "id")
    private int orderid;
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
    
    public Order() {}

    public Order(int orderid, ArrayList<Movie> movies, String name, String email, String paymentmethod, double saletotal, String status) {
        this.orderid = orderid;
        this.name = name;
        this.movies = movies;
        this.email = email;
        this.paymentmethod = paymentmethod;
        this.saletotal = saletotal;
        this.status = status;
    }

    public void updateOrder(int orderid, String name, String email, String paymentmethod, double saletotal, String status) {
        this.orderid = orderid;
        this.name = name;
        this.email = email;
        this.paymentmethod = paymentmethod;
        this.saletotal = saletotal;
        this.status = status;
    }

    public int getOrderid() {
        return orderid;
    }

    public ArrayList<Movie> getMovies() {
        return movies;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPaymentmethod() {
        return paymentmethod;
    }

    public double getSaletotal() {
        return saletotal;
    }

    public String getStatus() {
        return status;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public void setMovies(ArrayList<Movie> movies) {
        this.movies = movies;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPaymentmethod(String paymentmethod) {
        this.paymentmethod = paymentmethod;
    }

    public void setSaletotal(double saletotal) {
        this.saletotal = saletotal;
    }

    public void setStatus(String status) {
        this.status = status;
    }    
}
