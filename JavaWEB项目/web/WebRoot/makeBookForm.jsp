<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="makeBookForm" %>
<HEAD><%@ include file="head.txt" %></HEAD>
<title>����ȷ��</title>
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
       <h3>����󷢻�</h3>
      <%=logname%>��ǰ�Ķ�����:<%=dingdanNumber%><br>
      ������Ϣ:<br>
      <%= giveResult %>
      </center>
      </BODY></HTML>
<%  }
%>  
