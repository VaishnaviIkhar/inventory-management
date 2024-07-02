<%-- 
    Document   : generate
    Created on : 12 Mar, 2024, 11:24:53 PM
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
            </select>
            select quantity=<input type="text" name="quanti" value="" /><select name="unit">
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
            <br><br>
            <input type="submit" value="ADD" />
        </form>
             <a href="finish.jsp"><button>Finish</button></a>
    </body>
</html>
