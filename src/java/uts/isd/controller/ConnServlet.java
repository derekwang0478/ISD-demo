/*
 * A Servlet instance will be created once the project is deployed.
 * The init() method will create an instance of DBConnector to be used for the session.
 * database conenction will be closed automatically once the servelt is destroyed 
 * The servlet provide the application with a connection pool. 
 * One instance of the db connection to be used across the session.
 */
package uts.isd.controller;

import uts.isd.model.dao.DBConnector;
import java.io.IOException;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Customer;
import uts.isd.model.dao.*;

public class ConnServlet extends HttpServlet {

    private DBConnector db;
    private DBManager manager;
    private Connection conn;
    
    @Override //Create and instance of DBConnector for the deployment session
    public void init() {
        try {
            db = new DBConnector();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }       
    }
  
    @Override //Add the DBManager instance to the session 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");        
        HttpSession session = request.getSession();
        conn = db.openConnection();        
        try {
            manager = new DBManager(conn);
            session.setAttribute("manager", manager);
            String forwardType = (String)request.getParameter("forwardType");
            
            System.out.println(forwardType);
            if (forwardType.equals("signIn"))
            {
                String username = (String)request.getParameter("username");
                String password = (String)request.getParameter("password");
                
                request.setAttribute("username", username);
                request.setAttribute("password", password);
                try
                {
                    request.getRequestDispatcher("loginAction.jsp").forward(request,response);
                    return;
                }catch(Exception e){}
                //response.sendRedirect("loginAction.jsp"); 
            }
            if (forwardType.equals("register"))
            {
                String username = (String)request.getParameter("regiUsername");
                String password = (String)request.getParameter("regiPassword");
                String firstName = (String)request.getParameter("firstName");
                String lastName = (String)request.getParameter("lastName");
                String phone = (String)request.getParameter("phone");
                
                request.setAttribute("regiUsername", username);
                request.setAttribute("regiPassword", password);
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("phone", phone);
                
                try
                {
                    request.getRequestDispatcher("registerAction.jsp").forward(request,response);
                    return;
                }catch(Exception e){}
                
               
      
                //response.sendRedirect("registerAction.jsp"); 
            }
            
            if (forwardType.equals("loginRecordsCheck"))
                {
                   System.out.println("loginRecordsCheck Servelet");
                   String loginDate = (String)request.getParameter("loginDate");
                   String loginUsername = (String)request.getParameter("loginUsername");
                 
                   
                   request.setAttribute("loginDate", loginDate);
                   request.setAttribute("loginUsername", loginUsername);
                   try
                   {
                       request.getRequestDispatcher("loginRecordsAction.jsp").forward(request,response);
                       return;
                   }catch(Exception e){}

                }
            if (forwardType.equals("adminAccess"))
                {
                   String adminUsername = (String)request.getParameter("adminUsername");
                   String adminPassword = (String)request.getParameter("adminPassword");   
                   System.out.println("adminAccess Servelet adminUsername: " + adminUsername + " adminPassword: " + adminPassword);
                   request.setAttribute("loginDate", adminUsername);
                   request.setAttribute("loginUsername", adminPassword);
                   try
                   {
                       request.getRequestDispatcher("adminAccessAction.jsp").forward(request,response);
                       return;
                   }catch(Exception e){}

                }
            
        } catch (SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

        }      
        //export the DB manager to the view-session (JSPs)
        
    }    
    
    @Override //Destroy the servlet and release the resources of the application
     public void destroy() {
        try {
            db.closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
