<%-- 
    Document   : extra
    Created on : 11 Mar, 2024, 7:14:31 PM
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

    String id12=(String)session.getAttribute("p1");
    String totaln=request.getParameter("a7");
    String quan=request.getParameter("a1");
    String mr=request.getParameter("a2");
    String costn=request.getParameter("a3");
    String salen=request.getParameter("a4");
    String del=request.getParameter("a5");
    String exp=request.getParameter("a6");
    String dem=request.getParameter("demand");
    
    double total1=Double.parseDouble(totaln);
    double quan1=Double.parseDouble(quan);
    
    double cost1=Double.parseDouble(costn);
    double sale1=Double.parseDouble(salen);
    double pro=sale1-cost1;
    double prof=pro/cost1;
    double prox=prof*100;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root","");
        Statement st=con.createStatement();
        ResultSet rs=null;
        String sql="select * from stock";
        rs=st.executeQuery(sql);
        while(rs.next())
      {
            String key=rs.getString("id");
          if(key.equals(id12))
          {
                String un=rs.getString("unit");
                String qu=rs.getString("quantity");
                double quan2=Double.parseDouble(qu);
                double q3=quan1+quan2;
                String total2=rs.getString("total");
                double t2=Double.parseDouble(total2);
                double t3=t2+total1;
               
               
               String sq="UPDATE stock SET quantity="+q3+",mrp="+mr+",cost="+costn+",sp="+sale1+",pp="+prox+",total="+t3;
                String xm="UPDATE stock SET delivery="+del+",expiry="+exp;
               PreparedStatement ps=null;
                ps=con.prepareStatement(sq);
               int i=ps.executeUpdate();
                if(i>0){
                    
                   response.sendRedirect("admin.html");
                    
                }
                else{
                    out.print("failed");
                }
                     break; 
          }
            
            break;
        }
        
        con.close();
        
    }
    catch(Exception e){
        out.print(e);
    }

%>
    </body>
</html>
