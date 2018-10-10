/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.soap;

import java.io.IOException;
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.servlet.*;
import javax.xml.bind.JAXBException;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;
import oms.order.Order;
import oms.order.OrderApplication;
import oms.order.Orders;
import oms.user.UserApplication;
import oms.user.User;
import oms.user.Users;


@WebService(serviceName = "OmsApp")
public class OmsSOAP {

    @Resource
    private WebServiceContext context;

    // Allows the UserApplication class to be called to which we can use its functions
    @WebMethod
    public UserApplication getUserApp() throws JAXBException, IOException, Exception {

        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);

        synchronized (application) {
            UserApplication userApp = (UserApplication) application.getAttribute("userApp");
            if (userApp == null) {
                userApp = new UserApplication();
                userApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
                application.setAttribute("userApp", userApp);
            }
            return userApp;
        }

    }
    
    // Allows the OrderApplication class to be called to which we can use its functions
    @WebMethod
    public OrderApplication getOrderApp() throws JAXBException, IOException, Exception {

        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);

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

    @WebMethod //return Users
    public Users fetchUsers() throws JAXBException, IOException, Exception {
        return getUserApp().getUsers();
    }

    @WebMethod //return User
    public User fetchUser(String email, String password) throws JAXBException, IOException, Exception {
        return getUserApp().getUsers().login(email, password);
    }
    
    @WebMethod //return all Orders
    public ArrayList<Order> fetchOrders() throws JAXBException, IOException, Exception {
        return getOrderApp().getOrders().getHistoryList();
    }
    
    @WebMethod //return Order based on Email
    public ArrayList<Order> fetchOrderUsingEmail(String email) throws JAXBException, IOException, Exception {
        return getOrderApp().getOrders().checkEmail(email);
    }
    
    @WebMethod //return Order based on Id
    public Order fetchOrderUsingId(int id) throws JAXBException, IOException, Exception {
        return getOrderApp().getOrders().checkId(id);
    }
    
    @WebMethod //return Order based on Title
    public ArrayList<Order> fetchOrderUsingTitle(String title) throws JAXBException, IOException, Exception {
        return getOrderApp().getOrders().checkTitle(title);
    }
    
    @WebMethod //return Order based on Status
    public ArrayList<Order> fetchOrderUsingStatus(String status) throws JAXBException, IOException, Exception {
        return getOrderApp().getOrders().checkStatus(status);
    }

}
