<%-- 
    Document   : generatebill2
    Created on : 10 Mar, 2024, 4:41:17 PM
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
          String ite=request.getParameter("sitem");
          String quanty=request.getParameter("quant");
          session.setAttribute("ite1",ite);
          session.setAttribute("q1",quanty);
      try{
          Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root","");
            Statement st=con.createStatement();
            ResultSet rs=null;
            String sql="select * from stock";
            rs=st.executeQuery(sql);
                    while(rs.next()){
                        String up=rs.getString("id");
                        if(up.equals(ite))
                        {
                            String qy1=rs.getString("quantity");
                            String s1=rs.getString("sp");
                            String t1=rs.getString("total");
                            
                            session.setAttribute("q3",qy1);
                            
                            session.setAttribute("s3",s1);
                           
                            session.setAttribute("t3",t1);
                            response.sendRedirect("generatebill3.jsp");
                        }
                    }
      }
      catch(Exception e)
      {
          out.print(e);
      }
      
      %>
      
        
      
            </body>
</html>
