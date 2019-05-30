
<%@page import="uts.isd.model.dao.DBManager"%>
<%@page import="uts.isd.model.dao.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="uts.isd.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css"> 
        <script type="text/javascript" src="js/script.js"></script>
        <title>Insert title here</title>
    </head>

    <%
        String color;
        Student student = (Student) session.getAttribute("studentEdit");

        if (student != null) {
            color = student.getFavcol();
        } else {
            color = "#AED6F1";
        }
    %>
    <body style="background-color: <%=color%>" onload="startTime()">
        <div><span class="time" id="time" ></span></div>

        <h1>My Account</h1>        
        <form action="edit_user.jsp" method="POST">
            <table>
                <tr><td>Student ID</td><td><%= student.getID()%></td></tr>
                <tr><td>Full name</td><td><input type="text" value="<%= student.getName()%>" name="name"></td></tr>
                <tr><td>Email</td><td><input type="text" value="<%= student.getEmail()%>" name="email"></td></tr>                
                <tr><td>Password</td><td><input type="password" value="<%= student.getPassword()%>" name="password"></td></tr>   
                <tr><td>Date of Birth</td><td><input type="date" value="<%= student.getDob()%>" name="dob"></td></tr> 
                <tr><td>Favorite color</td><td> <input type="color" name ="favcol" <%= student.getFavcol()%>></td></tr>
                <tr><td><input type="hidden" value="updated" name="updated"></td>
                    <td><input class="button" type="submit" value="Save"> 
                        &emsp; 
                        <button class="button" type="button" onclick="location.href = 'main.jsp'" > Main Page </button>
                    </td>
                </tr>
            </table>
        </form>
        <%           
            DBManager manager = (DBManager)session.getAttribute("manager"); 

            if (request.getParameter("updated") != null) {
                manager.updateStudent(student.getID(), request.getParameter("name"), request.getParameter("email"),
                        request.getParameter("password"), request.getParameter("dob"), request.getParameter("favcol"));
                Student studentEdit = manager.findStudent(student.getID(), request.getParameter("password"));

                if (studentEdit != null) {
                    session.setAttribute("student", studentEdit);
                %>
                    <p class="outline"> Student details updated.</p>
                <%} else {%>
                    <p class="outline"> Could not update database!</p> 
                <%}%>
            <%}%>
    </body>
</html>