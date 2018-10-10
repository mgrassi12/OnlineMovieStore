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
    // There is a switch case which allows the user to do one action based on the number which they type. (1,2,3,etc)
            while (user != null) {
                String choice = null;
                Scanner scanner = new Scanner(System.in);
                showmenu(oms);
                choice = scanner.nextLine();
                switch (choice) {
                    // The function fetches all orders by printing out the array list of movies
                    case "1":
                        for (Order order : oms.fetchOrders()) {
                            System.out.println("id: " + order.getId());
                            for (Movie movie : order.getMovie()) {
                                System.out.println("movie title: " + movie.getTitle());
                                System.out.println("movie genre: " + movie.getGenre());
                                System.out.println("movie releasedate: " + movie.getReleasedate());
                                System.out.println("movie price: " + movie.getPrice());
                                System.out.println("movie pruchased: " + movie.getPurchased());
                            }

                            System.out.println("name: " + order.getName());
                            System.out.println("email: " + order.getEmail());
                            System.out.println("paymentmethod: " + order.getPaymentmethod());
                            System.out.println("saletotal: " + order.getSaletotal());
                            System.out.println("status: " + order.getStatus());
                            System.out.println();
                        }
                        break;
                    
                    // The function fetches all orders by printing out the array list of movies
                    case "2":
                        System.out.println("Enter an email to search for orders:");
                        email = scanner.nextLine();
                        if (oms.fetchOrderUsingEmail(email) != null) {
                            for (Order order : oms.fetchOrderUsingEmail(email)) {
                                System.out.println("id: " + order.getId());
                                for (Movie movie : order.getMovie()) {
                                    System.out.println("movie title: " + movie.getTitle());
                                    System.out.println("movie genre: " + movie.getGenre());
                                    System.out.println("movie releasedate: " + movie.getReleasedate());
                                    System.out.println("movie price: " + movie.getPrice());
                                    System.out.println("movie pruchased: " + movie.getPurchased());
                                }

                                System.out.println("name: " + order.getName());
                                System.out.println("email: " + order.getEmail());
                                System.out.println("paymentmethod: " + order.getPaymentmethod());
                                System.out.println("saletotal: " + order.getSaletotal());
                                System.out.println("status: " + order.getStatus());
                                System.out.println();
                            }
                        } else {
                            System.out.println("No such email has ordered a movie");
                            System.out.println();
                        }
                        break;

                    case "3":
                        System.out.println("Enter an order id to search:");
                        int id = scanner.nextInt();
                        if (oms.fetchOrderUsingId(id) != null) {
                            Order order = oms.fetchOrderUsingId(id);
                            System.out.println("id: " + order.getId());
                            for (Movie movie : order.getMovie()) {
                                System.out.println("movie title: " + movie.getTitle());
                                System.out.println("movie genre: " + movie.getGenre());
                                System.out.println("movie releasedate: " + movie.getReleasedate());
                                System.out.println("movie price: " + movie.getPrice());
                                System.out.println("movie pruchased: " + movie.getPurchased());
                            }

                            System.out.println("name: " + order.getName());
                            System.out.println("email: " + order.getEmail());
                            System.out.println("paymentmethod: " + order.getPaymentmethod());
                            System.out.println("saletotal: " + order.getSaletotal());
                            System.out.println("status: " + order.getStatus());
                            System.out.println();
                        } else {
                            System.out.println("No such order id found");
                            System.out.println();
                        }
                        break;

                    case "4":
                        System.out.println("Enter a movie title to search:");
                        String title = scanner.nextLine();
                        if (oms.fetchOrderUsingTitle(title) != null) {
                            for (Order order : oms.fetchOrderUsingTitle(title)) {
                                System.out.println("id: " + order.getId());
                                for (Movie movie : order.getMovie()) {
                                    System.out.println("movie title: " + movie.getTitle());
                                    System.out.println("movie genre: " + movie.getGenre());
                                    System.out.println("movie releasedate: " + movie.getReleasedate());
                                    System.out.println("movie price: " + movie.getPrice());
                                    System.out.println("movie pruchased: " + movie.getPurchased());
                                }

                                System.out.println("name: " + order.getName());
                                System.out.println("email: " + order.getEmail());
                                System.out.println("paymentmethod: " + order.getPaymentmethod());
                                System.out.println("saletotal: " + order.getSaletotal());
                                System.out.println("status: " + order.getStatus());
                                System.out.println();
                            }
                        } else {
                            System.out.println("No such movie has been ordered");
                            System.out.println();
                        }
                        break;

                    case "5":
                        System.out.println("Enter an order status to search:");
                        String status = scanner.nextLine();
                        if (oms.fetchOrderUsingStatus(status) != null) {
                            for (Order order : oms.fetchOrderUsingStatus(status)) {
                                System.out.println("id: " + order.getId());
                                for (Movie movie : order.getMovie()) {
                                    System.out.println("movie title: " + movie.getTitle());
                                    System.out.println("movie genre: " + movie.getGenre());
                                    System.out.println("movie releasedate: " + movie.getReleasedate());
                                    System.out.println("movie price: " + movie.getPrice());
                                    System.out.println("movie pruchased: " + movie.getPurchased());
                                }

                                System.out.println("name: " + order.getName());
                                System.out.println("email: " + order.getEmail());
                                System.out.println("paymentmethod: " + order.getPaymentmethod());
                                System.out.println("saletotal: " + order.getSaletotal());
                                System.out.println("status: " + order.getStatus());
                                System.out.println();
                            }
                        } else {
                            System.out.println("No such order has that status");
                            System.out.println();
                        }
                        break;

                    case "6":
                        user = null;
                        break;
                }
            }
        }
    }
   //This prints a guideline for the switch case as it tells the user what number to type in order to do a certain action
    public static void showmenu(OmsSOAP oms) throws Exception_Exception, IOException_Exception, JAXBException_Exception {
        System.out.println("Welcome to the OMS, please select what you want");
        System.out.println("1. Show all orders");
        System.out.println("2. Search orders from email");
        System.out.println("3. Search orders by id");
        System.out.println("4. Search orders by movie title");
        System.out.println("5. Search orders by order status");
        System.out.println("6. Logout");
        System.out.print("Enter a choice: ");
    }
}
