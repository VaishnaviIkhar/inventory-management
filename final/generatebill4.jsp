<%-- 
    Document   : generatebill4
    Created on : 13 Mar, 2024, 9:08:07 AM
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
       try {
    String item6 = (String) session.getAttribute("item5");
    String quantity6 = (String) session.getAttribute("quantity5");
    Double total6 = (Double) session.getAttribute("total5"); // Retrieve as Double
    String totalAsString = total6.toString(); // Convert to String

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final", "root", "");
    Statement st = con.createStatement();
    String sql = "INSERT INTO bill(item, quant, price) VALUES ('" + item6 + "', '" + quantity6 + "', '" + totalAsString + "')";
    st.executeUpdate(sql);
    response.sendRedirect("generatebill.jsp");
} catch (Exception e) {
    out.print(e);
}

       %>
    </body>
</html>
