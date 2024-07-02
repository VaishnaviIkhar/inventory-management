<%-- 
    Document   : employeelogin
    Created on : 8 Mar, 2024, 1:36:33 PM
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-image:url("https://wallpapercave.com/wp/wp7852674.jpg");
            }
            div{
                margin-left:200px;
                margin-right:800px;
                margin-top:150px;
            }
            h1{
                 color: coral;
  text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
  
}
        </style>
    </head>
    <body>
    <div>
         <center>
        <h1>Employee Section</h1><hr><hr>
       
        <button style="padding:15px; border-radius:30%; width:340px">  <a href="generatebill.jsp">Generate Bill</a></button><br><br><br>
        <button style="padding:10px; border-radius:20%; width:280px"> <a href="totalbilltoday.jsp">Total Bill</a></button><br><br><br>
        <button style="padding:5px; border-radius:15%; width:100px">  <a href="Login.jsp">Logout</a></button>
        </center>
    </div>
</body>
</html>
