/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.rest;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import oms.order.Order;
import oms.order.OrderApplication;
import oms.order.Orders;
import oms.user.*;

/**
 *
 * @author Joe Ho
 */
@Path("/orderApp")
public class OrderService {

    @Context
    private ServletContext application;

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

// A function that displays everything without parameters
    @Path("orders")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Orders getOrders() throws IOException, Exception {
        return getOrderApp().getOrders();
    }
 
    @Path("orders/email={email}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Order getOrderEmail(@PathParam("email") String email) throws JAXBException, IOException, Exception{
        return getOrderApp().getOrders().checkEmail(email);
    }

        @Path("orders/id={id}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Order getOrderId(@PathParam("id") int id) throws JAXBException, IOException, Exception{
        return getOrderApp().getOrders().checkId(id);
    }

        @Path("orders/title={title}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Order getOrderTitle(@PathParam("title") String title) throws JAXBException, IOException, Exception{
        return getOrderApp().getOrders().checkTitle(title);
    }

        @Path("orders/status={status}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Order getOrderStatus(@PathParam("status") String status) throws JAXBException, IOException, Exception{
        return getOrderApp().getOrders().checkStatus(status);
    }
}


// Movie Title function
// Order Status function

