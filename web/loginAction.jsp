<%-- 
    Document   : loginAction
    Created on : Aug 11, 2018, 9:34:47 PM
    Author     : George
--%>

<%@page import="uts.isd.model.dao.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Action Page</title>
    </head>
    <body>
        
        <%
           
            
            //Activate the database search-validate once DBManager functions are completed
            DBManager manager = (DBManager)session.getAttribute("manager");
            String username = (String)request.getParameter("username");
            String password = (String)request.getParameter("password");
            
            String loginDate = (String)request.getParameter("loginDate");
            String loginUsername = (String)request.getParameter("loginUsername");
  
            Boolean correctInfo = false;
            correctInfo = manager.checkCustomer(username, password);
            session.setAttribute("customerLogin", correctInfo);
            
            //Customer customer = new Customer("username","firstname","lastname","123456","address","dob",true,123.00);
            if (correctInfo) {
                 manager.setLoginRecords(loginUsername, loginDate);
                 Customer customer = manager.findCustomer(username, password);
                 session.setAttribute("customerObj", customer);
               
                 request.getRequestDispatcher("index.jsp").forward(request,response);
            }else{
                
                request.getRequestDispatcher("index.jsp").forward(request,response);                             
            }             

        %>
        
    </body>
</html>
