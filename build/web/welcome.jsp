<%@page import="uts.isd.model.dao.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" import="java.util.*" import="uts.isd.model.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css"> 
        <script type="text/javascript" src="js/script.js"></script>
        <title>Welcome Page</title>
    </head>

    
    <%
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String password = request.getParameter("password");
        String favcol = request.getParameter("favcol");
        String tos = request.getParameter("tos");
        int key = (new Random()).nextInt(999999);
        String ID = "" + key;
        String color;

        if (tos != null) {
            color = favcol;
        } else {
            color = "#AED6F1";
        }
    %>
    <body style="background-color: <%=color%>" onload="startTime()">
        <div><span class="time" id="time" ></span></div>
        <% if(tos != null) { %>
        <h1>Hello, <%=name%></h1> 
        <p>Your email: <%=email%></p>
        <p>Your DOB: <%=dob%></p>
        <p>Your password is: <%=password%></p>        
        <p>Your Favorite color is: <%=favcol%></p>
        <p>Your ID is: <%=ID%></p>
        <%    
            //Activate the database add-function once DBManager functions are completed
            DBManager manager = (DBManager)session.getAttribute("manager");
            Student student = new Student(ID,name,email,password,dob,favcol);
            manager.addStudent(ID, email, name, password, dob, favcol);
            session.setAttribute("student",student);
        %>
        <button class="button" type="button" onclick="location.href = 'main.jsp'" > Main Page </button>
        <%}else{%>
        <p class="outline">NOTE: You must agree to TOS</p>
        <button class="button" type="button" onclick="location.href = 'main.jsp'" > Main Page </button>
        <%}%>        
        <button class="button" type="button" onclick="location.href = 'index.jsp'" > Home Page </button>
    </body>
</html>
