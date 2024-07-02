<%-- 
    Document   : finish2
    Created on : 13 Mar, 2024, 7:52:37 AM
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
    // Assuming you've set the session attribute "ts" earlier
    Object tsObject = session.getAttribute("ts");
    if (tsObject instanceof Double) {
        double totalSum = (Double) tsObject;

        String da = request.getParameter("date");
        String nm = request.getParameter("cname");

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final", "root", "");

        // Use prepared statements to prevent SQL injection
        String sql = "INSERT INTO today (name, date, total) VALUES (?, ?, ?)";
        PreparedStatement preparedStatement = con.prepareStatement(sql);
        preparedStatement.setString(1, nm);
        preparedStatement.setString(2, da);
        preparedStatement.setDouble(3, totalSum);
        preparedStatement.executeUpdate();

        // Redirect to "finish3.jsp"
        response.sendRedirect("finish3.jsp");
    } else {
        // Handle the case where the attribute is not a valid double
        // (e.g., log an error, set a default value, etc.)
    }
} catch (Exception e) {
    // Handle exceptions (e.g., NullPointerException, ClassCastException, SQLException)
    e.printStackTrace();
}

       %>
    </body>
</html>
