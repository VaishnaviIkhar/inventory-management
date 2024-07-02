<%-- 
    Document   : Companytable
    Created on : 7 Mar, 2024, 3:07:17 PM
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
                background-image:url("https://wallpapercave.com/wp/wp6884797.jpg");
            }
        </style>
            </head>
    <body>
    <center>
        <h1>Company in Service</h1>
        <table id="myTable" border="1">
           
            <tbody>
                <tr style="background-color:#ffff66">
                    <td>Company Name</td>
                    <td>Website</td>
                    <td>Action</td>
                </tr>
            
                <%
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root","");
                    Statement st=con.createStatement();
                    ResultSet rs=null;
                    String sql="Select * from company";
                    rs=st.executeQuery(sql);
                    while(rs.next())
                    { 
            out.print("<tr><td>"+rs.getString("name")+"</td><td>"+rs.getString("website")+"</td><td><a href=Login.jsp?cname="+rs.getString("name")+">Login</a></td></tr>");
                    }
           con.close();
            }
            catch(Exception e)
            {
            out.print(e);
            }

                
                %>
            
            </tbody>
        </table>
            
                <a href="index.html"><img src="https://www.gardnercinemas.com/BackButton.jpg" width="100" height="30"></a>
    </center>
    </body>
</html>
