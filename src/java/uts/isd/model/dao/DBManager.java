package uts.isd.model.dao;

import uts.isd.model.Customer;
import uts.isd.model.Admin;
import java.sql.*;
import java.text.SimpleDateFormat;

/**
 *
 * @author George
 * 
 * DBManager is the primary DAO class to interact with the database and perform CRUD operations with the db.
 * Firstly, complete the existing methods and implement them into the application.
 * 
 * So far the application uses the Read and Create operations in the view.
 * Secondly, improve the current view to enable the Update and Delete operations.
 */
public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();


    }

    //Find student by ID in the database
    public Customer findCustomer(String username, String password) throws SQLException {
         System.out.println("Excuting findCustomer() function username: " + username + " password: " + password);
         String searchQueryString = "select * from customer where email='" + username + "' AND password='" + password + "'";  
         ResultSet rs = st.executeQuery(searchQueryString);
         boolean hasCustomer = rs.next();
         
         Customer customerFromDB = null;

         if(hasCustomer){
             Integer sID = rs.getInt("id");
             String sUsername = rs.getString("email");
             String sPassword = rs.getString("password"); 
             String sFirstname = rs.getString("first_name");
             String sLastname = rs.getString("last_name");
             String sPhone = rs.getString("phone_number");
             String sLoginRecords = "Today";
             try
             {
                sLoginRecords = findLoginRecords(username);
             }
             catch(Exception e){}
             customerFromDB = new Customer(sID, sUsername, sFirstname, sLastname, sPassword, sPhone, sLoginRecords);
             
         }
         rs.close();
         System.out.println("customerFromDB: " + customerFromDB);

        // st.close();
         
         return customerFromDB;
         
    }
    public Admin findAdmin(String username, String password) throws SQLException {
      System.out.println("Excuting findAdmin() function username: " + username + " password: " + password);
      
      String searchQueryString = "select * from admin where username='" + username + "' AND password='" + password + "'";  
      ResultSet rs = st.executeQuery(searchQueryString);
      boolean hasAdmin = rs.next();

      Admin adminFromDB = new Admin(0, "", "");;

      if(hasAdmin){
          Integer sID = rs.getInt("id");
          String sUsername = rs.getString("username");
          String sPassword = rs.getString("password"); 
          
          adminFromDB = new Admin(sID, sUsername, sPassword);

      }
      rs.close();
      return adminFromDB;

 }
    public String findLoginRecords(String username) throws SQLException
    {
         String loginRecords = "";
         System.out.println("excuting findLoginRecords() username: " + username);
         String searchQueryString = "select distinct login_date from logins where email='" + username + "'"; 
         ResultSet rs = st.executeQuery(searchQueryString);
         while(rs.next())
         {
             loginRecords += rs.getString("login_date") + "<br>";
         }
         return loginRecords;
        
    }
    //Check if a student exist in the database
    public boolean checkCustomer(String username, String password) throws SQLException {

         String searchQueryString = "select * from customer where email='" + username + "' AND password='" + password + "'";
        //execute this query using the statement field
       //add the results to a ResultSet
         ResultSet rs = st.executeQuery(searchQueryString);
        //search the ResultSet for a student using the parameters
         boolean correctUserInfo = false;
         boolean hasCustomer = rs.next();
         
         return hasCustomer;
    }

    
    public void setLoginRecords(String loginUsername, String loginDate) throws SQLException {    
    System.out.println("Excuting setLoginRecords() function username: " + loginUsername + " date: " + loginDate);    
    //code for add-operation

    Integer ID = 1;
    if(getLastLoginID() != null)
    {
        ID = getLastLoginID() + 1;
    }
    System.out.println("ID: " + ID);
    String createQueryString = "insert into logins" + " values (" + ID + ", '" + loginDate  + "', '" + loginUsername + "')";
    System.out.println(createQueryString);
    boolean recrodCreated = false;
    recrodCreated = st.executeUpdate(createQueryString) > 0;

    if (recrodCreated){
    System.out.println("record inserted");
    }
    else {
    System.out.println("record not inserted");
    }



    }
    public void addCustomer(Integer ID, String username, String password, String firstName, String lastName, String phone) throws SQLException {        
        //code for add-operation
     
        String createQueryString = "insert into customer" + " values (" + ID + ", '" + username + "', '" + password + "', '" + firstName + "', '" + lastName + "', '" + phone + "')";
        boolean recrodCreated = false;
        recrodCreated = st.executeUpdate(createQueryString) > 0;

        if (recrodCreated){
        System.out.println("record created");
        }
        else {
        System.out.println("record not created");
        }

                
             
    }

    //update a student details in the database
    public void updateStudent(String ID, String email, String name, String password, String dob, String favcol) throws SQLException {
        //code for update-operation
        
        String updateQueryString = "update Students set email = '" + email + "', name= '" + name + "', password = '"  + password + "', dob = '" + dob + "', favoritecolor = '" + favcol + "' where ID='" + ID + "'";
        boolean recrodUpdated = st.executeUpdate(updateQueryString) > 0;
         
         if (recrodUpdated){
         System.out.println("record updated");
         }
         else {
         System.out.println("record not updated");
         }
       
    }
    
    //delete a student from the database
    public void deleteStudent(String ID) throws SQLException{
        //code for delete-operation
        
        String deleteQueryString = "delete from Students where ID= '" + ID + "' ";
        boolean recrodDeleted = st.executeUpdate(deleteQueryString) > 0;
         
         if (recrodDeleted){
         System.out.println("record deleted");
         }
         else {
         System.out.println("record not deleted");
         }
    }
    public Integer getLastID() throws SQLException{
         String searchQueryString = "select max(id) from customer";
         ResultSet rs = st.executeQuery(searchQueryString);
         rs.next();
         return rs.getInt("1");
    }
    public Integer getLastLoginID() throws SQLException{
         String searchQueryString = "select max(login_id) from logins";
         ResultSet rs = st.executeQuery(searchQueryString);
         rs.next();
         return rs.getInt("1");
    }
}
