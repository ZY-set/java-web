<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="lookPurchase"%>
<HEAD><%@ include file="head.txt" %></HEAD>
<title> �鿴���ﳵ </title>
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
    <h2><%=logname%>���ﳵ��������ͼ��:</h2>
    <%=giveResult%>
    �鼮�۸��ܼ�:
    <%=price%>
   <form action="previewOrderForm.jsp">
     ���ɶ���:<Input type=submit name="g" value="�ύ">
   </form>
</center>
</body></html>
