<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="makeBookForm" %>
<HEAD><%@ include file="head.txt" %></HEAD>
<title>订单确认</title>
<%
    String logname=(String)session.getAttribute("logname");
    if(logname==null){
       response.sendRedirect("login.jsp");
    }
    else{
       int m=logname.indexOf(",");
       logname=logname.substring(0,m); 
    }
    String confirm=request.getParameter("confirm");
    String orderContent=request.getParameter("orderContent");
   String totalPrice=request.getParameter("totalPrice");
    if(confirm==null){
        confirm=""; 
    }
    if(orderContent==null){
        orderContent=""; 
    }
    if(totalPrice==null){
        totalPrice="0"; 
    }
   if(confirm.equals("buy")){
%>      <makeBookForm:MakeBookForm logname="<%=logname%>"
             orderContent="<%=orderContent%>" 
             totalPrice="<%=totalPrice%>" />
       <HTML><Body bgcolor=cyan><center>
       <h3>付款后发货</h3>
      <%=logname%>当前的订单号:<%=dingdanNumber%><br>
      订单信息:<br>
      <%= giveResult %>
      </center>
      </BODY></HTML>
<%  }
%>  
