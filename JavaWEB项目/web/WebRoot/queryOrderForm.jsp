<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="queryOrderForm" %>
<HEAD><%@ include file="head.txt" %></HEAD>
<title>查看订单</title>
<%
    String logname=(String)session.getAttribute("logname");
    if(logname==null){
       response.sendRedirect("login.jsp");
    }
    else{
       int m=logname.indexOf(",");
       logname=logname.substring(0,m); 
    }
   
%>      
<queryOrderForm:QueryOrderForm logname="<%=logname%>" />
<HTML><Body bgcolor = pink><center>
  <h3><%=logname%>全部订单:</h3><br>
      <%= giveResult %>
      </center>
</BODY></HTML> 
