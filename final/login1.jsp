<%-- 
    Document   : login1
    Created on : 7 Mar, 2024, 4:08:23 PM
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String company=(String)session.getAttribute("cname");
        String user=request.getParameter("username");
        String pass=request.getParameter("password");
       String driver = "com.mysql.jdbc.Driver";
           String connectionUrl="jdbc:mysql://localhost:3306/final";
           String userid = "root";
           String password = "";
    try {
            Class.forName(driver);
         } catch (ClassNotFoundException e) {
        out.print(e);
        }
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
       
        try{
        connection = DriverManager.getConnection(connectionUrl, userid, password);
        statement=connection.createStatement();
        String sql ="select * from company";
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
            String u1=resultSet.getString("username1");
            String p1=resultSet.getString("password1");
            String u2=resultSet.getString("username2");
            String p2=resultSet.getString("password2");
            if(user.equalsIgnoreCase(u1) && pass.equals(p1)){
              response.sendRedirect("admin.html");
              break;
            }
            else if(user.equalsIgnoreCase(u2) && pass.equals(p2)){
                response.sendRedirect("employeelogin.jsp");
                break;
            }
            else
            {
                out.print("Enter valid details");
            }
            }
        connection.close();
        } 
        catch (Exception e) {
        out.print(e);
        }
        %>
        
       
    </center>   
    </body>
</html>