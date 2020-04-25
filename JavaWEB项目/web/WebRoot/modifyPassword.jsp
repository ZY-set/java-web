<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="modifyPassword" %>
<HEAD><%@ include file="head.txt" %></HEAD>
<HTML><BODY bgcolor=cype>
<Font size=2>
<CENTER>
<h3>请输入您的当前的密码和新密码:</h3>
<FORM action="" Method="post">
   当前密码:<Input type=password name="oldPassword">
   新密码: <Input type=password name="newPassword">
           <Input type=submit name="g" value="提交">
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
