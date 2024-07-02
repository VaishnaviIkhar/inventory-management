<%-- 
    Document   : update
    Created on : 8 Mar, 2024, 9:48:59 PM
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
                background-image:url("https://storage.pixteller.com/designs/designs-images/2019-03-27/04/business-background-backgrounds-business-1-5c9b8f75536e8.png");
            }
            div{
                margin-left:280px;
                margin-top:-25px;
                padding-bottom:-10px;
            }
        </style>
    </head>
    <body>
    <center>  
        <div>      
         <%
String id12 = request.getParameter("pass");
session.setAttribute("p1",id12);
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/final";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) { 
out.print(e);
}
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="SELECT * FROM stock";
rs = statement.executeQuery(sql);
while(rs.next()){
    String imp=rs.getString("id");
    if(imp.equals(id12))
{
    
%>
<h1>Add Item</h1>
<form action="extra.jsp">

    Product Name:<b><u><%=rs.getString("id")%></u></b><br>
    <input type="hidden" name="pname" value="<%=rs.getString("id")%> /><br>
<br>
 
 <h3>Product quantity=</h3> <%=rs.getString("quantity")%>
<br>
    Total Price:<%=rs.getString("total")%><br>
  <input type="text" name="a12h" value="" />
 Total cost of stock of <%=id12%>:<input type="text" name="a7" value="" required/>

    <br><br>
    How much quantity added:<input type="text" name="a1" value="" required/><select name="unit">
        <option value="kg">KG</option>
        <option value="packet">Packet</option>
        <option value="dozen">Dozen</option>
        <option value="liter">Liter</option>
        <option value="box">Box</option>
        <option></option>
    </select><br><br>

    MRP:<input type="text" name="a2" value="<%=rs.getString("mrp")%>" required/><br><br>
    Cost:<input type="text" name="a3" value="<%=rs.getString("cost")%>" required/><br><br>
Selling price:<input type="text" name="a4" value="" required/>
<br><br>
Delivery date:<input type="date" name="a5" value="<%=rs.getString("delivery")%>" required/><br><br>
Enter expiry date:<input type="date" name="a6" value="" required/><br><br>
Quantity previously=<b><%=rs.getString("quantity")%></b><br><br>
Demand:<select name="demand">
    <option value="High">High</option>
    <option value="Medium">Medium</option>
    <option value="Low">Low</option>
</select><br><br>
<input type="submit" value="UPDATE" />


</form>
<% 
}}connection.close();
}
catch(Exception e)
{
out.print(e);
}

%>
        </div>
    </center>
    </body>
</html>
