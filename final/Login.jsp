<%-- 
    Document   : Login
    Created on : 7 Mar, 2024, 3:59:36 PM
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <script>
            var urlParams=new URLSearchParams(window.location.search);
        </script>
        <style>
            body{
                background-image:url("https://eskipaper.com/images/light-8.jpg");
            }
            .auto{
                 background-color:white;
                opacity:0.9;
                
                background-color: rgba(255, 255, 255, 0.2); /* Set transparency */
        backdrop-filter: blur(5px); /* Apply blur effect */
        border: 1px solid rgba(255, 255, 255, 0.3); 
      
      
               
                border-color:#cccccc;
                width:500px;
                height:400px;
               
            }
            b{
                padding-top:80px;
            }
            .pear{
                border:solid;
                border-color:#cccccc;
                width:498px;
                height:25px;
                text-align:center;
                background-color:#cccccc;
                border-radius:5%;
            }
            
        </style>
    </head>
    <body>
     
        <% String name=request.getParameter("cname");
        session.setAttribute("cname",name);
        %>
       
    <center>
        <b></b><br><br><br>
        <div class="auto">
            <br>
        <img src="https://www.freeiconspng.com/uploads/login-button-png-18.png" width="200px" height="90px">
        <hr><hr>
        <form action="login1.jsp"><br>
            <div class="pear"> Enter Username:<input type="text" name="username" value="" required style="border:solid; border-color:#cccccc;"/><br><br></div><br>
            <div class="pear">  Enter Password:<input type="text" name="password" value="" required style="border:solid; border-color:#cccccc"/></div>
            <br>
            <input type="checkbox" name="select" value="ON" required style='background-color:#cccccc' />I'm Not Robot<br><br>
            <input type="submit" value="Submit" style="background-color:#ccffff; border-radius:50%" width="30px" height="30"/>
        </form>
        </div>
    </center>
    </body>
</html>
