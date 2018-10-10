package oms.user;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "users", namespace = "http://www.uts.edu.au/31284/oms")
public class Users implements Serializable {

    @XmlElement(name = "user")
    private ArrayList<User> list = new ArrayList<User>();

    //Returns an array list of all users in user.xml
    public ArrayList<User> getList() {
        return list;
    }

    //Adds a user to user.xml
    public void addUser(User user) {
        list.add(user);
    }

    //Removes a user from user.xml
    public void removeUser(User user) {
        list.remove(user);
    }

    //User verification to log in
    public User login(String email, String password) {
        // For each user in the list...
        for (User user : list) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return user; // Login correct. Return this user.
            }
        }
        return null; // Login incorrect. Return null.
    }

    //Verification to check email
    public User checkEmail(String email) {
        for (User user : list) {
            if (user.getEmail().equals(email)) {
                return user;
            }
        }
        return null; // User already exists. Don't allow another registration.
    }
}
