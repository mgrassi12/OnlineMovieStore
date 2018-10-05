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
import oms.user.*;


/**
 *
 * @author Joe Ho
 */
@Path("/movieStoreApp")
public class UserService {
    @Context
    private ServletContext application;

    private MovieStoreApplication getMovieStoreApp() throws JAXBException, IOException, Exception {
        synchronized (application) {
            MovieStoreApplication movieStoreApp = (MovieStoreApplication) application.getAttribute("movieStoreApp");
            if (movieStoreApp == null) {
                movieStoreApp = new MovieStoreApplication();
                movieStoreApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
                application.setAttribute("movieStoreApp", movieStoreApp);
            }
            return movieStoreApp;
        }
    }

// A function that displays everything without parameters
    
    @Path("users")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Users getUsers() throws IOException, Exception  {
        return getMovieStoreApp().getUsers();
    }
    
    @Path("users/{email}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public User getUser(@PathParam("email") String email) throws JAXBException, IOException, Exception{
        return getMovieStoreApp().getUsers().checkEmail(email);
    }
}

// Movie Title function

// Order Status function


