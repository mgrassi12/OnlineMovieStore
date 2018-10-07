package oms.order;

import java.io.*;
import java.util.ArrayList;
import javax.xml.bind.*;
import oms.movie.Movie;
 
public class TestJAXB implements Serializable {
 public static void main(String[] args) throws Exception {        
  Orders orders = new Orders();
  
  ArrayList<Movie> movies1 = new ArrayList<Movie>();
  movies1.add(new Movie("Die Hard", "Action", "06-10-1988", 10, 5));  
  orders.addOrder(new Order(100, movies1, "Bob Lob", "bob@gmail.com", "card", 15.00, "submitted"));
  
  ArrayList<Movie> movies2 = new ArrayList<Movie>();
  movies2.add(new Movie("Die Hard", "Action", "06-10-1988", 10, 5)); 
  movies2.add(new Movie("Deadpool", "Romance", "11-02-2016", 20.5, 3));
  orders.addOrder(new Order(101, movies2, "Rob Mob", "rob@gmail.com", "paypal", 25.00, "submitted"));
  
  // Boilerplate code to convert objects to XML...
  JAXBContext jc = JAXBContext.newInstance(Orders.class);
  Marshaller m = jc.createMarshaller();
  m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
  m.marshal(orders, System.out);
 }
}