<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="modifyRegister" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="getRegister" %>
<HEAD><%@ include file="head.txt" %></HEAD>
<HTML><BODY bgcolor=pink><CENTER> 
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
%>
<getRegister:GetRegister logname="<%=logname%>" />
<Font size=2>
<FORM action="" method = "post" >
<table>
    ������������Ϣ:
   <tr><td>�����ʼ�:</td>
   <td><Input type=text name="email" value="<%=oldEmail%>"></td></tr>
   <tr><td>��ʵ����:</td>
   <td><Input type=text name="realname" value="<%=oldRealname%>"></td></tr>
   <tr><td>��ϵ�绰:
   </td><td><Input type=text name="phone" value="<%=oldPhone%>"></td></tr>
   <tr><td>ͨ�ŵ�ַ:
   </td><td><Input type=text name="address" value="<%=oldAddress%>"></td></tr>
   <tr><td><Input type=submit name="enter" value="�ύ"></td> </tr>
 </table><Font></CENTER>
</BODY>
</HTML>
<%
    String enter=request.getParameter("enter");
    String email=request.getParameter("email");
    String realname=request.getParameter("realname");
    String phone=request.getParameter("phone");
    String address=request.getParameter("address");
    boolean ok=(enter!=null);
    if(ok&&isModify){
%>     <modifyRegister:ModifyRegister logname="<%=logname%>" email="<%=email%>"
       phone="<%=phone%>" address="<%=address%>" realname="<%=realname%>"/>
       <center><h2><%= giveResult %></h2></center> 
<% }
%> 
