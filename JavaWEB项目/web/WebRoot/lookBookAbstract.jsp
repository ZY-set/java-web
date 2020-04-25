<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bookAbstract" %>
<%@ include file="head.txt" %>
<title>Í¼ÊéÕªÒª£¨abstract£©</title>
<%
    String bookISBN=request.getParameter("bookISBN");
%>      
    <bookAbstract:BookAbstract bookISBN="<%=bookISBN%>" />
<HTML>
  <Body ><center>
   <%= giveResult %>
   </center>
</BODY></HTML>  
