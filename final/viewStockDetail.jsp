<%-- 
    Document   : viewStockDetail
    Created on : 9 Mar, 2024, 12:03:19 PM
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
            body{
                background-image:url("https://img.freepik.com/premium-vector/technology-connection-digital-data-white-background_32996-546.jpg");
            }
            a{
                margin-top:150;
            }
        </style>
    </head>
    <body>
       <center>
           <h1>All Info About Stock</h1>
               
        <table border="1" >  
            <tbody>    
                <tr style="background-color:#fcfc2f">
                    <td>Product Name</td>
                    <td>Unit</td>
                    <td>Quantity</td>
                    <td>Total Price</td>
                    <td>Tax</td>
                    <td>MRP</td>
                    <td>Cost Price</td>
                    <td>Selliing Price</td>
                    <td>Profit Percentage</td>
                    <td>Delivery Date</td>
                    <td>Expiry Date</td>
                    <td>Supplier Name</td>
                    <td>Supplier Mobile No.</td>
                    <td>Location of Stock</td>
                    <td>Demand</td>
                </tr>
        <%
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root","");
            Statement st=con.createStatement();
            ResultSet rs=null;
            String sql="Select * from stock";
            rs=st.executeQuery(sql);
            while(rs.next())
            {
                
            out.print("<tr><td>"+rs.getString("id")+"</td><td>"+rs.getString("unit")+"</td><td>"+rs.getString("quantity")+"</td><td>"+rs.getString("total")+"</td><td>"+rs.getString("tax")+"</td><td>"+rs.getString("mrp")+"</td><td>"+rs.getString("cost")+"</td><td>"+rs.getString("sp")+"</td><td>"+rs.getString("pp")+"</td><td>"+rs.getString("delivery")+"</td><td>"+rs.getString("expiry")+"</td><td>"+rs.getString("sname")+"</td><td>"+rs.getString("smob")+"</td><td>"+rs.getString("loc")+"</td><td>"+rs.getString("demand")+"</td></tr>");
            }
           con.close();
       } 
        
        catch(Exception e){
            out.print(e);
}     
        
        %>
            
        </tbody>
        </table>
        <a href="admin.html"><img src="https://www.clker.com/cliparts/2/v/Z/A/g/2/back-button-hi.png" width="100" height="50"></a>
    </center>
    </body>
</html>
