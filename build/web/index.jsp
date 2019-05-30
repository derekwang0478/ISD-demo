<%@page import="uts.isd.model.dao.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
        </script>
        <script>
            var signedIn = false;
            var logOut = true;
            var loginDate = "1970-1-1";
            var adminNameOnPage = "${(sessionScope.adminObj).getUsername()}";
            signedIn = "${sessionScope.customerLogin}";
            
            function initializer()
            {
                $("#initializer").submit();
            }
            
            function signInBtnClicked()
            {       
                //signedIn = true;
                $("#loginForm").submit();
         
                //sessionStorage.setItem('signedInStatus',signedIn);
                //window.location.href='index.jsp';
            }
            function registerNowBtnClicked()
            {
                
                //signedIn = true;
                //$("#loginForm").submit();
                $("#registerForm").submit();
                //essionStorage.setItem('signedInStatus',signedIn);
                //window.location.href='index.jsp';
           
            }
            function logoutBtnClicked()
            {
                signedIn = false;
                <% 
                    session.setAttribute("customerLogin", false);
                    Admin admin = new Admin(0, "", "");
                    session.setAttribute("adminObj", admin);
                %>
                        
                sessionStorage.setItem('adminSignedIn', false);
                //sessionStorage.setItem('signedInStatus',signedIn);
                window.location.href='index.jsp';
            }
            function registrationDetailsBtnClicked()
            {
                
                var details = "${(sessionScope.customerObj).getDetails()}";
                
                $("#details").fadeIn();
                document.getElementById("details").innerHTML = details;
               
                
                
            }
            
            function signedInStatusSession()
            {
                
                //sessionStorage.setItem('signedInStatus',signedIn);
            }
            function loginRecordsBtnClicked()
            {
                var recentLogins = "${(sessionScope.customerObj).getRecentLogins()}";
                
                $("#details").slideUp();
                $("#loginRecords").fadeIn();
                document.getElementById("loginRecords").innerHTML = recentLogins;
            }
            function setPage()
            {
                
                if(signedIn == "true")
                {  
                    //alert("Connecting Succussful");
                    document.getElementById("loginPage").style = "width:40%; height:70%;"
                    $("#userBtnName").show();
                    $("#loginPageElements").hide();
                    $("#logedinPageElements").show();
                    $("#logoutDiv").show();
                    $("#adminAccessText").hide();
                }
                else
                {
                    //alert("You are outline please log in");
                    $("#adminAccessText").show();
                    $("#userBtnName").hide();
                    $("#logoutDiv").hide();
                }
                if(adminNameOnPage != "")
                {
                    document.getElementById("loginPage").style = "width:40%; height:1000px;"
                    $("#userBtnName").show();
                    $("#loginPageElements").hide();
                    $("#logedinPageElements").hide();
                    $("#adminLogedinPageElements").show();
                    $("#logoutDiv").show();
                    $("#adminAccessText").hide();
                }
             
            }
            
            function updateLoginRecords()
            {
                var userNameOnPage = "${(sessionScope.customerObj).getUsername()}"; 
   
                if(adminNameOnPage != "")
                {
                    
                    document.getElementById("userNameOnHeader").innerHTML = adminNameOnPage + "<span style='color:red; font-size:10px'> (Admin) </span>";
                }
                else
                {
                    
                    document.getElementById("userNameOnHeader").innerHTML = userNameOnPage;
                }
                document.getElementById("loginUsername").value = userNameOnPage;
                document.getElementById("loginDate").value = loginDate;
            }
         
            function showTime(){
                nowtime = new Date();
                year = nowtime.getFullYear();
                month = nowtime.getMonth()+1;
                date = nowtime.getDate();
                loginDate = year + "-" + month + "-" + date;
                document.getElementById("maintime").innerText = year + "-" + month + "-" + date + " " + nowtime.toLocaleTimeString();
                document.getElementById("mytime").innerText = year + "-" + month + "-" + date + " " + nowtime.toLocaleTimeString();
            }
            function updateTime()
            {
                nowtime = new Date();
                year = nowtime.getFullYear();
                month = nowtime.getMonth()+1;
                date = nowtime.getDate();
                loginDate = year + "-" + month + "-" + date;
            }
            setInterval("showTime()",1000);
            function adminAccessBtnClicked()
            {
               $("#username").hide();
               $("#password").hide();
               $("#registerText").hide();
               $("#adminAccessForm").fadeIn();
               $("#signInBtn").hide();
               $("#adminSignInBtn").fadeIn(); 
               $("#registerPageElements").hide(); 
               
               
            }
            function adminSignInBtnClicked()
            {
                $("#adminAccessForm").submit();
            }
            $(function(){
              $("#userBtn").click(
                                       function(){
                                       if($("#loginPage").css("display")=='none'){
                                       $("#loginPage").slideDown();
                                       $("#logoutBtn").show();
                                       $("#adminAccessTextDiv").fadeIn();
                                      
                                       }else{
                                       $("#loginPage").slideUp();
                                       $("#logoutBtn").fadeOut();
                                       $("#adminAccessTextDiv").fadeOut();
                                       }
                                       });
              });
              
              $(function(){
                $("#registerBtn").click(
                                    function(){
                                    if($("#registerPageElements").css("display")=='none'){
                                    $("#registerPageElements").fadeIn();
                                    $("#username").hide();
                                    $("#password").hide();
                                    $("#signInBtn").hide();
                                    $("#registerText").hide();
                                    }
                                    });
                });
                $(function(){
                  $("#goBackBtn").click(
                                          function(){
                                          if($("#registerPageElements").css("display")!='none'){
                                          $("#username").fadeIn();
                                          $("#password").fadeIn();    
                                          $("#registerPageElements").hide();
                                          $("#signInBtn").fadeIn();
                                          $("#registerText").fadeIn();
                                          }
                                          });
                  });
                  
                
                  
        </script>
    </head>
    <style>
        
        #header
        {
            vertical-align:middle;
            background-color:black;
            color:white;
            text-align:center;
            position:fixed;
            width:100%;
            height:80px;
            top:0;
            left:0;
            right:0;
            z-index:1;

        }
       #login
       {
           color:white;
           position:absolute;
           left:20px;
           top:20px;
       }
       #mainContent
       {
           float:top;
           width:100%;
           height:80%;
      
       }
       #serchBar
       {
           position:relative;
           width:100%;
           height:10%;
           text-align:center;
           top:100px;
       }
       #images
       {
           position:relative;
           width:100%;
           height:10%;
           text-align:center;
           top:150px;
           
       }
       #loginPage
       {

           position:absolute;
           color:white;
           background-color:black;
           text-align:center;
           width:100%;
           height:130%;
           z-index:1;
           display:none;
           left:0px;
       }
       #loginPageElements
       {
           position:relative;
           text-align:center;
           top:100px;
       }
        #logedinPageElements
        {
            position:relative;
            text-align:center;
            top:100px;
            display:none;
        }
        #registerPageElements
        {
            position:relative;
            text-align:center;
            top:120px;
            display:none;
        }
        #adminLogedinPageElements
        {
            position:relative;
            text-align:center;
            top:100px;
            display:none;
        }
        .bar input {
            border:2px solid #c5464a;
            border-radius:5px;
            background:transparent;
            width:350px;
            height:25px;
            top:0;
            right:0;
        }
        .bar button {
            background:#c5464a;
            border:none;
            border-radius:5px 5px 5px 5px;
            width:60px;
            height:30px;
            top:0;
            right:0;
            cursor:pointer
        }
        .bar button:before {
            content:"Search";
            font-size:13px;
            color:#F9F0DA;
            
        }
        .loginBar input {
            border:2px solid #c5464a;
            border-radius:5px;
            background:transparent;
            color:white;
            width:350px;
            height:40px;
            top:0;
            right:0;
        }
        .signIn button {
            position:relative;
            background:#c5464a;
            border:none;
            border-radius:5px 5px 5px 5px;
            width:355px;
            height:40px;
            top:15px;
            right:0px;
            cursor:pointer
        }
        .signIn button:before {
            content:"Sign In";
            font-size:13px;
            color:#F9F0DA;
        }
        .registerNow button {
            position:relative;
            background:#47a0bc;
            border:none;
            border-radius:5px 5px 5px 5px;
            width:355px;
            height:40px;
            top:15px;
            right:0px;
            cursor:pointer;
        }
        .registerNow button:before {
            content:"Register Now";
            font-size:13px;
            color:#F9F0DA;
        }
     
    </style>
    <body>
        
        <div id="loginPage">
            <div id="loginPageElements" class="loginBar">
                <h1>Sign in</h1>
                
               
                
                <form id="loginForm" action="ConnServlet" method="get">
                
                    <input id="username" type="text" name="username" value="" style="font-size:15px" placeholder=" Email Address">
                    <h1></h1>
                    <input id="password" type="password" name="password" value="" style="font-size:15px" placeholder=" Password">          
                    <input id="loginDate" type="text" name="loginDate" value="aaa" style="display:none">
                    <input id="loginUsername" type="text" name="loginUsername" value="bbb" style="display:none">
                    <input id="forwardType" type="text" name="forwardType" value="signIn" style="display:none">

                </form>
                
                <form id="adminAccessForm" action="ConnServlet" method="get" style="display:none">
                
                    <input id="adminUsername" type="text" name="adminUsername"  style="font-size:15px;" placeholder=" Administrator username">
                    <h1></h1>
                    <input id="adminPassword" type="password" name="adminPassword" style="font-size:15px;" placeholder=" Administrator Password">          
                    <input id="forwardType" type="text" name="forwardType" value="adminAccess" style="display:none">
                </form>
                
                <div class="signIn">
                    <button id="signInBtn" onClick="signInBtnClicked()">
                </div>
                
                <div class="signIn">
                    <button id="adminSignInBtn" onClick="adminSignInBtnClicked()" style="display:none; background:#5B5B5B">
                </div>

                
                <h5 id="registerText"style="position:relative; top:5px;">Don't have account? <span id="registerBtn" style="cursor:pointer; color:#c5464a;">Register</span> now</h5>
               
            </div>
            
            <div id="logedinPageElements" class="loginBar">
                <span id="maintime"></span>
                <h1>User options <span id="userNameOnPage"></span></h1>
                <h4 style="color:#c5464a; cursor:pointer;"id="registrationDetailsBtn" onClick="registrationDetailsBtnClicked()">Registration details<h4>
                <h4 id="details" style="display:none">Details<h4>
                        
                
                        
                <h4 id="loginRecordsBtn" style="color:#c5464a; cursor:pointer;" onclick="loginRecordsBtnClicked()">Recent logins details<h4>
                <h4 id="loginRecords" style="display:none">Records<h4>
                        
                <h4 style="color:#c5464a;">Recent logins details<h4>
                
            </div>
            
            <div id="adminLogedinPageElements" class="loginBar" style="display:none">
                <h1>Administrator options</h1>
                <h5>Create Admini Staff</h5>
                <h5>Create Customer</h5>
                <h5>Add Movie</h5>
                
                <form id="loginForm" action="ConnServlet" method="get">
                
                    <!<input id="username" type="text" name="username" value="" style="font-size:15px" placeholder=" Email Address">
                     <!<input id="password" type="password" name="password" value="" style="font-size:15px" placeholder=" Password"> 
                    <h1></h1>
                    <a href="addMovieAction.jsp">Add Movie</a>
                    <input id="Movie" type="Movie" name="Movie" value="" style="display:none" >
                    <input id="loginDate" type="text" name="loginDate" value="aaa" style="display:none">
                    <input id="loginUsername" type="text" name="loginUsername" value="bbb" style="display:none">
                    <input id="forwardType" type="text" name="forwardType" value="signIn" style="display:none">

                </form>
            </div>
            
            <div id="registerPageElements" class="loginBar">
                 <form id="registerForm" action="registerAction.jsp" method="get" style="position:relative; top:-18px;">
                     
                 <input id="username" type="text" name="regiUsername" style="font-size:15px" placeholder=" Email Address">
                 <h1></h1>
                 <input id="password" type="password" name="regiPassword" style="font-size:15px" placeholder=" Password">
                 <h1></h1>
                 <input id="firstName" type="text" name="firstName" style="font-size:15px" placeholder=" First name">
                 <h2> </h2>
                 <input id="lastName" type="text" name="lastName" style="font-size:15px" placeholder=" Last name">
                 <h2> </h2>
                 <input id="phone" type="text" name="phone" style="font-size:15px" placeholder=" Phone number">
                 </form>
                 <div class="registerNow">
                     <button id="registerNowBtn" onClick="registerNowBtnClicked()"></button>
                 </div>
                 <h5 id="goBackText"style="position:relative; top:5px;">Already have an account? <span id="goBackBtn" style="cursor:pointer; color:#47a0bc;">Sign in</span> now</h5>
            </div>
       

        </div>
        
        <div id="header">
            <div>
                <h1> MS Online <span id="mytime" style="font-size:12px; position:absolute; right:30px; top:40px"></span></h1>
                
            </div>
            <div id="adminAccessTextDiv" style="display:none">
                 <h5 id="adminAccessText"style="position:absolute; top:0px; right:10px">Administrator <span id="adminAccessBtn" style="cursor:pointer; color:#c5464a;" onClick="adminAccessBtnClicked()">Access</span> Entry</h5>
            </div>
            <div id="login">
                 <input id="userBtn" name="imgbtn" type="image" src="user.png" width="70%" height="70%" border="0">
                     
                     <div id="userBtnName" style="position:absolute; left:50px; top:-5px; display:none;">
                     <p id="userNameOnHeader">Online</p>
                     <div id="logoutDiv" style="position:absolute; left:-40px; top:-5px; display:none;">
                         <h5 id="logoutBtn" style="color:#c5464a; position:absolute; top:30px; left:0px; text-align:left; cursor:pointer; display:none;" onClick="logoutBtnClicked()">logout</h5>
                     </div>
                 </div>
                     
            </div>
            
            
        </div>
        
        <div id="mainContent">
            
            <div id="serchBar" class="bar">
                <input id="textField1" type="text" name="quantity">
                <button id="serchBtn"></button>
            </div>
            
            <div id="images">
                <img src="movie1.png" width="24%"; height="24%";>
                <img src="movie2.png" width="24%"; height="24%";>
                <img src="movie3.png" width="24%"; height="24%";>
                <img src="movie4.png" width="24%"; height="24%";>
                <img src="movie5.png" width="24%"; height="24%";>
                <img src="movie6.png" width="24%"; height="24%";>
                <img src="movie7.png" width="24%"; height="24%";>
                <img src="movie8.png" width="24%"; height="24%";>
            </div>
            
        </div>
        
    <script>
        signedInStatusSession();
        updateTime();
        updateLoginRecords();
        setPage();
        initializer();
    </script>
    </body>
</html>

