<%@ page contentType="text/html;charset=GB2312" %>
<HEAD><%@ include file="head.txt" %></HEAD>
<HTML><BODY bgcolor=pink><CENTER> 
<%   
     String logname=(String)session.getAttribute("logname");
     if(logname!=null){  
         int m=logname.indexOf(",");
         logname=logname.substring(0,m);
         session.invalidate();
         out.print("<h2>"+logname+"ÍË³ö</h2>");
     }
     else{
        response.sendRedirect("login.jsp");
     } 
%> 
