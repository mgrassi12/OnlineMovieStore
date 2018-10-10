package oms.order;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import oms.movie.Movie;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "history", namespace = "http://www.uts.edu.au/31284/oms")
public class Orders implements Serializable {

    //This is an array list of orders that are stored in history.xml
    @XmlElement(name = "order")
    private ArrayList<Order> historylist = new ArrayList<Order>();

    //This function returns the array list of orders called 'historylist'
    public ArrayList<Order> getHistoryList() {
        return historylist;
    }

    //This function adds an order
    public void addOrder(Order order) {
        historylist.add(order);
    }

    //This function removes an order
    public void removeOrder(Order order) {
        historylist.remove(order);
    }

    //This function checks against a pre-existing id within the XML
    public Order checkId(int id) {
        for (Order order : historylist) {
            if (order.getId() == id) {
                return order;
            }
        }
        return null;
    }

    //This function checks against a pre-existing email within the XML
    public ArrayList<Order> checkEmail(String email) {
        email = email.toLowerCase();
        ArrayList<Order> matches = new ArrayList<>();
        for (Order order : historylist) {
            if (order.getEmail().toLowerCase().equals(email)) {
                matches.add(order);
            }
        }
        return matches;
    }

    //This function checks against a pre-existing title within the XML
    public ArrayList<Order> checkTitle(String title) {
        title = title.toLowerCase();
        ArrayList<Order> matches = new ArrayList<>();
        for (Order order : historylist) {
            for (Movie movie : order.getMovies()) {
                if (movie.getTitle().toLowerCase().equals(title)) {
                    matches.add(order);
                }
            }
        }
        return matches;
    }

    //This function checks against a pre-existing status within the XML
    public ArrayList<Order> checkStatus(String status) {
        ArrayList<Order> matches = new ArrayList<>();
        status = status.toLowerCase();
        for (Order order : historylist) {
            if (order.getStatus().toLowerCase().equals(status)) {
                matches.add(order);
            }
        }
        return matches;
    }
}
