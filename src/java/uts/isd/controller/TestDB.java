
/*This stand-alone application test the connection to the db once setup in DB class
 *It performs an add-function of a Student to the database
 *To use this app, you should complete the addStudent method in DBManager class
 *
 *
 *@author George
**/
package uts.isd.controller;

import uts.isd.model.dao.DBManager;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.Customer;
import java.sql.*;
import java.util.*;
import java.util.logging.*;

public class TestDB {
    private static Scanner in = new Scanner(System.in);
    
    public static void main(String[] args) {
        try {
            System.out.println("shujuku");
            DBConnector connector = new DBConnector(); //Create a connection and initialize DB conn-field
            Connection conn = connector.openConnection(); //Get the protected connection instance from DB superclass to share for the application classes
            DBManager db = new DBManager(conn); //DBManger instance provide users with access to CRUD operations
            
          //  int key = (new Random()).nextInt(999999);
         //   String ID = "" + key; 
            System.out.print("username: ");
            String  username = in.nextLine();
            System.out.print("Student email: ");
            String email = in.nextLine();
            System.out.print("Student name: ");
            String name = in.nextLine();
            System.out.print("Student password: ");
            String password = in.nextLine();
            System.out.print("Student DOB: ");
            String dob = in.nextLine();
            System.out.print("Student favorite color: ");
            String favcol = in.nextLine();
            
            Customer customer = db.findCustomer(username, password); //This method must be completed in DBManager class
            
           if (customer != null) {
            //System.out.println("Student is found in the database." + student.getID() + student.getName());
            }
          
           /*
            if (student == null) {                       
            db.addStudent(ID, email, name, password, dob, favcol); //This method must be completed in DBManager class
            System.out.println("Student is added to the database.");
            }
            */
          /*
            if (student != null) {
            db.updateStudent(ID, email, name, password, dob, favcol); // This method must be completed in DBManager class
            System.out.println("Student is updated in the database.");
            }
            */ 
           
            if (customer != null) {
            db.deleteStudent(username); // This method must be completed in DBManager class
            System.out.println("Student is deleted from the database.");
            }
            
            
            connector.closeConnection(); //Professional practice is to close connection to database once operations are finalized
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
