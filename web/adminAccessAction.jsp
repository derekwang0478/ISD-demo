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
            String adminUsername = (String)request.getParameter("adminUsername");
            String adminPassword = (String)request.getParameter("adminPassword");
  
            if(((Admin)manager.findAdmin(adminUsername, adminPassword)).getUsername() != "")
            {
                Admin admin = manager.findAdmin(adminUsername, adminPassword);
                session.setAttribute("adminObj", admin);
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }    
            else
            {
                request.getRequestDispatcher("index.jsp").forward(request,response);   
            }
                           

        %>
        
    </body>
</html>
