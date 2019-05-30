package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author George
 */

public class Admin implements Serializable {

    
    private Integer ID;   
    private String username;   
    private String password;   

    

    public Admin(Integer ID, String username, String password) {
        this.username = username;
        this.password = password;
        this.ID = ID;
    
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
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
  
  
}//end class
