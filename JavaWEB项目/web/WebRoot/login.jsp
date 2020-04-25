<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="login"%>
<HEAD><%@ include file="head.txt" %></HEAD>
<title> 登录页面 </title>
<HTML>
<BODY background="c.jpg"><Font size=2><CENTER>
<BR><BR>
<table border=2>
<tr> <th>请您登录</th></tr>
<FORM action="" method="post" name ="form">
<tr><td>登录名称:<Input type=text name="logname"></td></tr>
<tr><td>输入密码:<Input type=password name="password"></td></tr>
</table>
<BR><Input type=submit name="g" value="提交">
</Form>
</CENTER>
<%  String logname=request.getParameter("logname");
    if(logname==null){
       logname="";
    }
    String password=request.getParameter("password");
     if(password==null){
        password="";
     }
%>
 <login:Login logname="<%=logname%>"  password="<%=password%>" />
 <Center><P>返回的消息:<%=backMess %></Center>
</BODY>
</HTML>
