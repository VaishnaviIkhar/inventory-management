<%-- 
    Document   : Companyformpre
    Created on : 14 Mar, 2024, 6:31:50 PM
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
                background-image:url("https://cdn.wallpapersafari.com/62/54/8Agb1H.png");
            }
            h1{
                padding-top:150px;
                
            }
        </style>
    </head>
    <body>
    <center>
        <h1 style="font-size:40px">Stock</h1>
        <table  border="1">  <tbody> 
                <tr style="color:yellowgreen; background-color:crimson">
                    <td>Name of Product</td>
                    <td>Unit</td>
                    <td>quantity</td>
                    
                    <td>Selling Price</td>
                    <td>Action</td>
                </tr>
    
        <%
            try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root","");
        ResultSet rs=null;
        Statement st=con.createStatement();
        String sql="select * from stock";
        rs=st.executeQuery(sql);
        while(rs.next()){
           out.print("<tr><td>"+rs.getString("id")+"</td><td>"+rs.getString("unit")+"</td><td>"+rs.getString("quantity")+"</td><td>"+rs.getString("sp")+"</td><td><a href=update.jsp?pass="+rs.getString("id")+">ADD</a></td></tr>");
            } 
        
        con.close();
            }
            catch(Exception e){
                out.print(e);
            }
        
        %>
        
    </tbody>
        </table>
        <a href="admin.html"><img src="https://th.bing.com/th/id/OIP.0x3MfSlYTxel6evXZaF0dwAAAA?rs=1&pid=ImgDetMain" width="80" height="30"></a>
        <a href="adminlogin.html"><img src="https://th.bing.com/th/id/R.f145e06960a636e48cd6064d14e9171c?rik=FpkCkBmqoAkgTQ&riu=http%3a%2f%2fwww.clker.com%2fcliparts%2fW%2f9%2fF%2fA%2fJ%2fV%2fadd-button-hi.png&ehk=Q2h0k%2fIHQ17NaWxLPaW%2bD882BIAsX4nw2BhRD%2bk3jjw%3d&risl=&pid=ImgRaw&r=0" width="90" height="40"></a>
        <a href="viewStockDetail.jsp">  <img src="https://th.bing.com/th/id/OIP.9wX62KjfS-Sb95BQ3FqbUgAAAA?rs=1&pid=ImgDetMain" width="90" height="30"></a>
        
    </center>
    </body>
</html>
