<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="previewOrderForm" %>
<HEAD><%@ include file="head.txt" %></HEAD>
<title> ��ǰ����(Ԥ��)</title>
<%
     String logname=(String)session.getAttribute("logname");
     if(logname!=null){  
       int m=logname.indexOf(",");
       logname=logname.substring(0,m);
%>     
       <previewOrderForm:PreviewOrderForm logname="<%=logname%>" />
       <HTML><body bgcolor=cype><center>
       <h3>�������ύ��������ť��ȷ�϶���</h3>
       <form action="makeBookForm.jsp" method="post" name="form">
           <Input type=hidden name="confirm" value="buy">
           <Input type=hidden name="orderContent" value="<%= giveResult %>">
           <Input type=hidden name="totalPrice" value="<%= totalPrice %>">
           <center> <Input type=submit name="g" value="�ύ����"></center>  
       </form> 
       ������Ϣ:<br>
       <table border=2>
          <tr><th>������Ϣ</th>
             <th>�ܼ۸�</th>
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
