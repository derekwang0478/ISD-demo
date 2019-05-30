package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author George
 */

public class Customer implements Serializable {

    
    private Integer CUSTOMER_ID;   
    private String username;   
    private String firstname;  
    private String lastname;
    private String password;   
    private String phone;
    private String recentLogins;
    

    public Customer(Integer ID, String username, String firstname,String lastname,String password, String phone, String recentLogins) {
        this.username = username;
        this.firstname = firstname;
        this.lastname = lastname;
        this.password = password;
        this.phone = phone;   
        this.CUSTOMER_ID = ID;
        this.recentLogins = recentLogins;
    
    }

    public Customer(String sUsername, String sPassword, String sFirstname, String sLastname, String sPhone) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
    public void updateDetails(String username, String firstname,String lastname,String password, String phone){
        this.username = username;
        this.firstname = firstname;
        this.lastname = lastname;
        this.password = password;
        this.phone = phone;   
    }

    public boolean matchUsername(String username){
        return this.username.equals(username.trim());
    }
    
    public boolean matchPassword(String password){
        return this.password.equals(password.trim());
    }
    public String getUsername(){
    
    
    return username;
    
    }
    
    public void setUsername(String username){
    
    
      this.username = username;    
    }
    
 
   

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getDetails() {
        return "Username: " + username + " <br>Password: " + password + "<br>Firstname: " +firstname + "<br>Lastname: " + lastname + "<br>Phone number: " + phone;
       
        }
    public String getRecentLogins() {
        return recentLogins;
    }
}//end class
