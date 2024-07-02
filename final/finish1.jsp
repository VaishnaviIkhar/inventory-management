<%-- 
    Document   : finish1
    Created on : 13 Mar, 2024, 1:34:18 AM
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            div{
                width:600px;
                height:500px;
                background-color:#ffffcc;
            }
            body{
                background-image:url("https://www.teahub.io/photos/full/8-83222_technology-wallpaper-full-hd.jpg");
            }
        </style>
    </head>
    <body>
    <center>
        <div>
        <h1>Bill</h1><hr>
         <form action="finish2.jsp">
             customer Name:<input type="text" name="cname" value="" required/><br><br>
            date:<input type="date" name="date" value="" required/>
            <br><br>
     <% 
     
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final", "root", "");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM bill");

    double totalSum = 0.0;

    // Print table header
    out.print("<table>");
    out.print("<tr><th>Item</th><th>Quantity</th><th>Price</th></tr>");

    // Print table rows and calculate total sum
    while (rs.next()) {
        String item = rs.getString("item");
        String quant = rs.getString("quant");
        String priceStr = rs.getString("price");
        double price = Double.parseDouble(priceStr); // Convert price to double
        totalSum += price;

        // Print row
        out.print("<tr><td>" + item + "</td><td>" + quant + "</td><td>" + priceStr + "</td></tr>");
    }

    // Print total sum row
    out.print("<tr><td colspan=\"2\">Total:</td><td>" + totalSum + "</td></tr>");

    // Close table
    out.print("</table>");
session.setAttribute("ts",totalSum);
    con.close();
} catch (Exception e) {
    out.print(e);
}
%>
<br>
<input type="submit" value="store" />
<br><br>
<button onclick="window.print()">Print Bill</button><br><br>
    <a href="generatebill.jsp">Back</a>
        </form>
        </div>
    </center>
    </body>
</html>
