<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="modifyPassword" %>
<HEAD><%@ include file="head.txt" %></HEAD>
<HTML><BODY bgcolor=cype>
<Font size=2>
<CENTER>
<h3>���������ĵ�ǰ�������������:</h3>
<FORM action="" Method="post">
   ��ǰ����:<Input type=password name="oldPassword">
   ������: <Input type=password name="newPassword">
           <Input type=submit name="g" value="�ύ">
</Form>
</CENTER>
</BODY></HTML>
<%   
     boolean isModify=false;
     String logname=(String)session.getAttribute("logname");
     if(logname!=null){  
       int m=logname.indexOf(",");
       logname=logname.substring(0,m);
       isModify=true;
     }
     else{
        response.sendRedirect("login.jsp");
     } 
   String oldPassword=request.getParameter("oldPassword");
   String newPassword=request.getParameter("newPassword");
   boolean ok=oldPassword!=null&&newPassword!=null;
   if(ok&&isModify){
%>    <modifyPassword:ModifyPassword logname="<%=logname%>"
                                     oldPassword="<%=oldPassword%>" 
                                   newPassword="<%=newPassword%>"/>
     <center><h2><%= giveResult %></h2></center>
<% }
%>   
