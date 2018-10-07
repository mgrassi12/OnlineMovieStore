package oms.order;
 
import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "history", namespace = "http://www.uts.edu.au/31284/oms")
public class Orders implements Serializable {
    @XmlElement(name = "order")
    private ArrayList<Order> list = new ArrayList<Order>();
 
    public ArrayList<Order> getList() {
        return list;
    }
    public void addOrder(Order order) {
        list.add(order);
    }
    public void removeOrder(Order order) {
        list.remove(order);
    }
}