package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author George
 */

public class Movie implements Serializable {

    
    private Integer ID;   
    private String title; 
    private String genere; 
    private Double price;
    private Integer copies;
    
    public Movie(Integer ID, String username, String firstname,String lastname,String password, String phone, String recentLogins) {
        this.ID = ID;
        this.title = title;
        this.genere = genere;
        this.price = price;
        this.copies = copies;
    
    }
    public Integer getID() {
        return ID;
    }
    public String getTitle() {
        return title;
    }
    public String getGenere() {
        return genere;
    }
    public Double getPrice() {
        return price;
    }
    public Integer getCopies() {
        return copies;
    }
}//end class
