
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
            Integer ID = manager.getLastID() + 1;
            String username = request.getParameter("regiUsername");
            String password = request.getParameter("regiPassword");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");
            manager.addCustomer(ID, username, password, firstName, lastName, phone);
            response.sendRedirect("index.jsp");      

        %>
    </body>
</html>
