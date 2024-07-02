<%-- 
    Document   : generatebill3
    Created on : 12 Mar, 2024, 6:30:52 PM
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
         
        <a href="new.jsp">ADD</a>
        
     
    <%
    try {
        String item1 = (String) session.getAttribute("ite1");
        String quantity1 = (String) session.getAttribute("q1");
        session.setAttribute("item5", item1); // Bill 1st column
        session.setAttribute("quantity5", quantity1); // Bill 2nd column

        String quantity2 = (String) session.getAttribute("q3");
        String salep = (String) session.getAttribute("s3");
        String total2 = (String) session.getAttribute("t3");

        double quantity4 = Double.parseDouble(quantity1);
        double quantity5 = Double.parseDouble(quantity2);
        double sale4 = Double.parseDouble(salep);
        double total4 = Double.parseDouble(total2);

        double quantity3 = quantity5 - quantity4; // For storing in stock table
        double total1 = sale4 * quantity4; // For storing in bill table
        double total3 = total4 - total1; // For storing in stock table
        session.setAttribute("total5",total1);

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final", "root", "");
        Statement st = con.createStatement();
        ResultSet rs = null;
        String sql = "SELECT * FROM stock";
        rs = st.executeQuery(sql);
        while (rs.next()) {
            String ik = rs.getString("id");
            if (ik.equals(item1)) {
                String updateSql = "UPDATE stock SET quantity=" + quantity3 + ", total=" + total3 + " WHERE id='" + item1 + "'";
                PreparedStatement ps = con.prepareStatement(updateSql);
                int i = ps.executeUpdate();
                if (i > 0) {
                    response.sendRedirect("generatebill4.jsp");
                } else {
                    out.print("Update failed");
                }
                break;
            }
        }
        con.close();
    } catch (Exception e) {
        out.print(e);
    }
    %>

        
        
       
    </body>
</html>
