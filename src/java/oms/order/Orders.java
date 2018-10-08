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

    @XmlElement(name = "order")
    private ArrayList<Order> historylist = new ArrayList<Order>();

    public ArrayList<Order> getHistoryList() {
        return historylist;
    }

    public void addOrder(Order order) {
        historylist.add(order);
    }

    public void removeOrder(Order order) {
        historylist.remove(order);
    }

    public Order checkId(int id) {
        for (Order order : historylist) {
            if (order.getId() == id) {
                return order;
            }
        }
        return null;
    }

    public ArrayList<Order> checkEmail(String email) {
        ArrayList<Order> matches = new ArrayList<>();
        for (Order order : historylist) {
            if (order.getEmail().equals(email)) {
                matches.add(order);
            }
        }
        return matches;
    }

    public ArrayList<Order> checkTitle(String title) {
        ArrayList<Order> matches = new ArrayList<>();
        for (Order order : historylist) {
            for (Movie movie : order.getMovies()){
                if (movie.getTitle().equals(title)) {
                    matches.add(order);
                }
            }
        }
        return matches;
    }

    public ArrayList<Order> checkStatus(String status) {
        ArrayList<Order> matches = new ArrayList<>();
        for (Order order : historylist) {
            if (order.getEmail().equals(status)) {
                matches.add(order);
            }
        }
        return matches;
    }

}
