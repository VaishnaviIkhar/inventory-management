<%-- 
    Document   : new
    Created on : 12 Mar, 2024, 9:20:57 AM
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
    String e4 = (String) session.getAttribute("q5");
    String g4 = (String) session.getAttribute("rt");
    String ik = (String) session.getAttribute("it");

    if (ik != null && e4 != null && g4 != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final", "root", "");
                 PreparedStatement ps = con.prepareStatement("UPDATE stock SET quantity=?, total=? WHERE id=?")) {

                ps.setString(1, e4);
                ps.setString(2, g4);
                ps.setString(3, ik);

                int i = ps.executeUpdate();
                if (i > 0) {
                    response.sendRedirect("generatebill.jsp");
                } else {
                    out.print("Update failed, no rows affected.");
                }
            }
        } catch (Exception e) {
            out.print("Database error: " + e.getMessage());
        }
    } else {
        out.print("Error: Session attributes 'q5', 'rt', or 'it' are missing.");
    }
%>

        
        
    </body>
</html>
