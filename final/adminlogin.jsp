<%-- 
    Document   : adminlogin
    Created on : 8 Mar, 2024, 8:12:00 PM
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
        <h1>Stock</h1>
        <form action="admin.html">
        
        <table border="1">  
            <tbody>    
                <tr style="color:yellowgreen; background-color:crimson">
                    <td>Product Name</td>
                    <td>Unit</td>
                    <td>Quantity</td>
                    <td>Tax</td>
                    <td>MRP</td>
                    <td>Selliing Price</td>
                    <td>Action</td>
                </tr>
        <%
        try{
            String pn=request.getParameter("pname");
            String u=request.getParameter("unit");
            String q=request.getParameter("quantity");
            String total=request.getParameter("tprice");
            String t=request.getParameter("tax");
            String m=request.getParameter("mrp");
            String cost=request.getParameter("cost");
            String s=request.getParameter("sp");
            String d=request.getParameter("update");
            String e=request.getParameter("expire");
            String sn=request.getParameter("sname");
            String sm=request.getParameter("smob");
            String loc=request.getParameter("state");
            String de=request.getParameter("demand");
            double n1=Double.parseDouble(cost);
            double n2=Double.parseDouble(s);
            
            double p1=n2-n1;
            double p2=p1/n1;
            double p3=p2*100;
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root","");
            Statement st=con.createStatement();
            String sq="insert into stock(id,unit,quantity,total,tax,mrp,cost,sp,pp,delivery,expiry,sname,smob,loc,demand)values('"+pn+"' , '"+u+"' , '"+q+"' , '"+total+"' , '"+t+"' , '"+m+"' , '"+cost+"' , '"+s+"' , '"+p3+"' , '"+d+"' , '"+e+"' , '"+sn+"' , '"+sm+"' , '"+loc+"' , '"+de+"')";
            st.executeUpdate(sq);
          ResultSet rs=null;
           String sql="Select * from stock";
           rs=st.executeQuery(sql);
            while(rs.next())
            {
                
            out.print("<tr><td>"+rs.getString("id")+"</td><td>"+rs.getString("unit")+"</td><td>"+rs.getString("quantity")+"</td><td>"+rs.getString("tax")+"</td><td>"+rs.getString("mrp")+"</td><td>"+rs.getString("sp")+"</td><td><a href=update.jsp?pass="+rs.getString("id")+">ADD</a></td></tr>");
            }
            con.close();
           
            con.close();
       }
        catch(Exception e){
            out.print(e);
}     
        
        %>
            
        </table>
           <input type="submit" value="submit" />
            
        </form>
        <a href="adminlogin.html"><img src="https://th.bing.com/th/id/R.b4ae81d9f09e9e79ab53168df6d88059?rik=qie3VcORVOmK9g&riu=http%3a%2f%2fwww.clker.com%2fcliparts%2fZ%2fr%2fI%2fW%2fD%2fj%2fadd-button-png-hi.png&ehk=HQitE5rYx%2fFokKf2XvQNXsPyBbnOrlvmA4Gj6QdEuls%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1" width="100" height="40"></a>
        
        <a href="admin.html"><img src="https://toppng.com/uploads/preview/pink-grey-gradient-home-button-icon-home-button-icon-transparent-11553494391n140cdoukd.png" widht="100" height="50"></a>   
    </center>
            
    </body>
</html>
