/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.soap.client;

import java.util.Scanner;

/**
 *
 * @author Joe Ho
 */
public class OmsClient {
    
    public static void main(String[] args) throws IOException_Exception, JAXBException_Exception, Exception_Exception {
        OmsApp locator = new OmsApp();
        OmsSOAP oms = locator.getOmsSOAPPort();

        int nomatchfound = 0;

        while (nomatchfound == 0) {

            Scanner input = new Scanner(System.in);
            System.out.print("Enter email address: ");
            String email = input.next();
            System.out.print("Enter password: ");
            String password = input.next();


            if (oms.fetchUser(email, password) == null) {
                System.out.println("No such user found.");
            } else {
                System.out.println("You have logged in as " + oms.fetchUser(email, password).name);
                break;
            }
            
        }
    }
}
