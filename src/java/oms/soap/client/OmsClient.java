package oms.soap.client;

import java.util.*;
import static javafx.application.Platform.exit;
import oms.user.*;

public class OmsClient {

    public static void main(String[] args) throws IOException_Exception, JAXBException_Exception, Exception_Exception {
        OmsApp locator = new OmsApp();
        OmsSOAP oms = locator.getOmsSOAPPort();
        OmsClient.login(oms);
    }

    // Matches the string email, and password against the email and password strings in the user.xml, if they exist, the login function is successful
    public static void login(OmsSOAP oms) throws Exception_Exception, IOException_Exception, JAXBException_Exception {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter email address: ");
        String email = input.next();
        System.out.print("Enter password: ");
        String password = input.next();
        User user = new User();

        if (oms.fetchUser(email, password) == null) {
            System.out.println("No such user found.");
        } else {
            user = oms.fetchUser(email, password);
            System.out.println("You have logged in as " + user.getName());

         
            while (user != null) {
                   String choice = null;
            Scanner scanner = new Scanner(System.in);
            showmenu(oms);
            choice = scanner.nextLine();
                switch (choice) {
                    case "1":
                        OmsClient.showOrderByEmail(oms);
                        break;
                    case "4":
                        user = null;
                        break;
                }
            }
        }
    }

    public static void showOrderByEmail(OmsSOAP oms) throws Exception_Exception, IOException_Exception, JAXBException_Exception {
        if (oms.fetchOrders() == null) {
            System.out.println("lmaooo");
        } else {
            System.out.println("there are orders, i just cant fucking display them");
        }

    }

    public static void showmenu(OmsSOAP oms) throws Exception_Exception, IOException_Exception, JAXBException_Exception {
        System.out.println("Welcome to the OMS, please select what you want");
        System.out.println("1. Show Order By Email");
        System.out.println("4. Logout");
        System.out.print("Enter a choice: ");
    }
}
