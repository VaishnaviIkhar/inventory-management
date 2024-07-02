<%-- 
    Document   : Companyform
    Created on : 7 Mar, 2024, 5:04:08 PM
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
        <%  try
        {
            String c=request.getParameter("cname");
            String s=request.getParameter("State");
            String m=request.getParameter("Mobile");
            String e=request.getParameter("Email");
            String w=request.getParameter("Website");
            String sdate=request.getParameter("sdate");
            String u1=request.getParameter("auser");
            String p1=request.getParameter("apass");
            String u2=request.getParameter("euser");
            String p2=request.getParameter("epass");
            String sa=request.getParameter("sale");
            String t=request.getParameter("trade");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root","");
            Statement st=con.createStatement();
            String sql="insert into company(name,state,mobile,email,website,username1,password1,username2,password2,sale,trade)values('"+c+"' , '"+s+"' , '"+m+"' , '"+e+"' , '"+w+"' , '"+u1+"' , '"+p1+"' , '"+u2+"' , '"+p2+"' , '"+sa+"' , '"+t+"')";
            st.executeUpdate(sql);
            response.sendRedirect("Companytable.jsp");
            out.print("Company Created Successfully");
            con.close();
       }
        catch(Exception e){
            out.print(e);
}
%>
<a href="index.html">Back</a>
    </body>
</html>
