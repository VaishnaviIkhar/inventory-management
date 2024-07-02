<%-- 
    Document   : finish3
    Created on : 13 Mar, 2024, 8:28:15 AM
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
         Class.forName("com.mysql.jdbc.Driver");
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root","");
       Statement st=con.createStatement();
       ResultSet rs=null;
       String sql="TRUNCATE TABLE bill" ;
       rs=st.executeQuery(sql);
       response.sendRedirect("finish1.jsp");
       %>
    </body>
</html>
