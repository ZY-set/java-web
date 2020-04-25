<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="previewOrderForm" %>
<HEAD><%@ include file="head.txt" %></HEAD>
<title> 当前订单(预览)</title>
<%
     String logname=(String)session.getAttribute("logname");
     if(logname!=null){  
       int m=logname.indexOf(",");
       logname=logname.substring(0,m);
%>     
       <previewOrderForm:PreviewOrderForm logname="<%=logname%>" />
       <HTML><body bgcolor=cype><center>
       <h3>单击“提交订单”按钮将确认订单</h3>
       <form action="makeBookForm.jsp" method="post" name="form">
           <Input type=hidden name="confirm" value="buy">
           <Input type=hidden name="orderContent" value="<%= giveResult %>">
           <Input type=hidden name="totalPrice" value="<%= totalPrice %>">
           <center> <Input type=submit name="g" value="提交订单"></center>  
       </form> 
       订单信息:<br>
       <table border=2>
          <tr><th>订购信息</th>
             <th>总价格</th>
          </tr>
          <tr> 
            <td><%= giveResult %></td>
            <td><%=totalPrice %> </td>
         </tr>
       </center>
       </BODY></HTML>
<%   }
     else{
        response.sendRedirect("login.jsp");
     }
%>  
