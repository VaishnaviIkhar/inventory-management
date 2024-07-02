<%-- 
    Document   : generatebill
    Created on : 10 Mar, 2024, 3:47:42 PM
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
                background-image:url("https://wallpaperaccess.com/full/4597140.jpg");
            }
            div{
                border:solid;
                width:500px;
                height:500px;
                border-width:0.01px;
            }
        </style>
    </head>
    <body>
    <center>
        <div>
        <u>  <h1>Bill Generate</h1></u>
        
        <%
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root","");
            Statement st=con.createStatement();
            ResultSet rs=null;
            String sql="select * from stock";
            rs=st.executeQuery(sql);
            
        }
        catch(Exception e){
            out.print(e);
        }
        
        %>
        
        <form action="generatebill2.jsp">
            Select item:<select name="sitem">
             <%
                    Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root","");
            Statement st=con.createStatement();
            ResultSet rs=null;
            String sql="select * from stock";
            rs=st.executeQuery(sql);
                    while(rs.next()){
                        out.print("<option>"+rs.getString("id")+"</option>");
                      }%>
            </select><br><br>
            select quantity=<input type="text" name="quant" value="" /><select name="unit">
            <option value="Kg">Kg</option>
            <option value="liter">liter</option>
            <option value="Box">Box</option>
            <option value="Pack">Pack</option>
            <option value="container">container</option>
            <option value="unit">unit</option>
            <option value="Dozen">Dozen</option>
            <option value="Bundle">Bundle</option>
            <option value="Roll">Roll</option>
            <option value="Pallet">Pallet</option>
            </select><br>
            <br>
            <input type="submit" value="ADD to bill" />
            
            <br>
           
        </form>
            <br>  <a href="finish1.jsp"><button>Finish</button></a><br><br>
            <a href="employeelogin.jsp"><img src="https://th.bing.com/th/id/OIP.4CF8-DWc-uPvOJo2mjB_wgHaHx?rs=1&pid=ImgDetMain" width="50" height="20"></a><br><br>
        </div>
    </center>
    </body>
</html>
