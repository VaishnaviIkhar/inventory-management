<%-- 
    Document   : totalbilltoday
    Created on : 13 Mar, 2024, 8:15:39 PM
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
                background-image:url("https://th.bing.com/th/id/R.13a0ca45b8856ed107538c44261edb79?rik=llBYN9dbc6LpJg&riu=http%3a%2f%2flh3.googleusercontent.com%2f-3TIYRQ9bpLc%2fUsgHg69pW0I%2fAAAAAAAAFN0%2fc6x4v5xbGDM%2fs1600%2fwall_5.jpg&ehk=QWDrqOUfM7MlbIyppxfsumWw6EVGqTtWjmEDSYdXwO4%3d&risl=&pid=ImgRaw&r=0");
            }
        </style>
    </head>
    <body>
        <center>
            <h1>Name of Customer with their total bill</h1>
        <table border="1">  
            <tbody>    
                <tr style="background-color:yellowgreen">
                    <td> Name</td>
                    <td>date</td>
                    <td>total</td>
                    
                </tr>
        <%
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root","");
            Statement st=con.createStatement();
            ResultSet rs=null;
            String sql="Select * from today";
            rs=st.executeQuery(sql);
            while(rs.next())
            {
                
            out.print("<tr><td>"+rs.getString("name")+"</td><td>"+rs.getString("date")+"</td><td>"+rs.getString("total")+"</td></tr>");
            }
           con.close();
       } 
        
        catch(Exception e){
            out.print(e);
}     
        
        %>
            
        </tbody>
        </table>
        <a href="employeelogin.jsp"><img src="https://cdn3.iconfinder.com/data/icons/ui-essential-elements-dark-buttons/110/Back-1024.png" width="100" height="50"></a>
    
    </body>
</html>
