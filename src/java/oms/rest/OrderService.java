/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.rest;

import com.sun.jersey.api.provider.jaxb.XmlHeader;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.*;
import oms.order.Order;
import oms.order.OrderApplication;
import oms.order.Orders;
import org.w3c.dom.*;

/**/
@Path("/orderApp")
public class OrderService {

    @Context
    private ServletContext application;

    // This function serves as a way to obtain the OrderApplication class
    private OrderApplication getOrderApp() throws JAXBException, IOException, Exception {
        synchronized (application) {
            OrderApplication orderApp = (OrderApplication) application.getAttribute("orderApp");
            if (orderApp == null) {
                orderApp = new OrderApplication();
                orderApp.setFilePath(application.getRealPath("WEB-INF/history.xml"));
                application.setAttribute("orderApp", orderApp);
            }
            return orderApp;
        }
    }

    // Gets all the orders from history.xml
    @Path("orders")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Orders getOrders() throws IOException, Exception {
        return getOrderApp().getOrders();
    }

    // Gets orders based on the email string inputted in the url which matches with the string from history.xml
    @Path("orders/email={email}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public ArrayList<Order> getOrderEmail(@PathParam("email") String email) throws JAXBException, IOException, Exception {
        return getOrderApp().getOrders().checkEmail(email);
    }

    // Gets orders based on the id integer inputted in the url which matches with the string from history.xml
    @Path("orders/id={id}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Order getOrderId(@PathParam("id") int id) throws JAXBException, IOException, Exception {
        return getOrderApp().getOrders().checkId(id);
    }

    // Gets orders based on the title string inputted in the url which matches with the string from history.xml
    @Path("orders/title={title}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public ArrayList<Order> getOrderTitle(@PathParam("title") String title) throws JAXBException, IOException, Exception {
        return getOrderApp().getOrders().checkTitle(title);
    }

    // Gets orders based on the status string inputted in the url which matches with the string from history.xml
    @Path("orders/status={status}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public ArrayList<Order> getOrderStatus(@PathParam("status") String status) throws JAXBException, IOException, Exception {
        return getOrderApp().getOrders().checkStatus(status);
    }
}
