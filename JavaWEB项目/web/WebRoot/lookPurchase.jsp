<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="lookPurchase"%>
<HEAD><%@ include file="head.txt" %></HEAD>
<title> 查看购物车 </title>
<html>
<body bgcolor= cype><center>
<%   boolean isAdd=false;
     String logname=(String)session.getAttribute("logname");
     if(logname!=null){  
       int m=logname.indexOf(",");
       logname=logname.substring(0,m);
       isAdd=true;
     }
     else{
        response.sendRedirect("login.jsp");
     } 
     String buyISBN=request.getParameter("buyISBN");
     if((buyISBN!=null)&&isAdd){
        session.setAttribute(buyISBN+","+logname,buyISBN);
     }
     String deletedISBN=request.getParameter("deletedISBN");
     if((deletedISBN!=null)&&isAdd){
        session.removeAttribute(deletedISBN+","+logname);
     }
%>
    <lookPurchase:LookPurchase logname="<%=logname%>"/>
    <h2><%=logname%>购物车中有如下图书:</h2>
    <%=giveResult%>
    书籍价格总计:
    <%=price%>
   <form action="previewOrderForm.jsp">
     生成订单:<Input type=submit name="g" value="提交">
   </form>
</center>
</body></html>
