/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.soap;

import java.io.IOException;
import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.servlet.*;
import javax.xml.bind.JAXBException;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;
import oms.user.MovieStoreApplication;
import oms.user.User;
import oms.user.Users;

@WebService(serviceName = "OmsApp")
public class OmsSOAP {
    @Resource
    private WebServiceContext context;
    
    @WebMethod
    public MovieStoreApplication getMovieStoreApp() throws JAXBException, IOException, Exception {
        
        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        
        synchronized (application) {
            MovieStoreApplication moviestoreApp = (MovieStoreApplication) application.getAttribute("moviestoreApp");
            if (moviestoreApp == null) {
                moviestoreApp = new MovieStoreApplication();
                moviestoreApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
                application.setAttribute("moviestoreApp", moviestoreApp);
            }
            return moviestoreApp;
        }

    }

    @WebMethod //return Users
    public Users fetchUsers() throws JAXBException, IOException, Exception {
        return getMovieStoreApp().getUsers();
    }

    @WebMethod //return User
    public User fetchUser(String email, String password) throws JAXBException, IOException, Exception {    
        return getMovieStoreApp().getUsers().login(email, password);
    }

}