<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="login"%>
<HEAD><%@ include file="head.txt" %></HEAD>
<title> ��¼ҳ�� </title>
<HTML>
<BODY background="c.jpg"><Font size=2><CENTER>
<BR><BR>
<table border=2>
<tr> <th>������¼</th></tr>
<FORM action="" method="post" name ="form">
<tr><td>��¼����:<Input type=text name="logname"></td></tr>
<tr><td>��������:<Input type=password name="password"></td></tr>
</table>
<BR><Input type=submit name="g" value="�ύ">
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
 <Center><P>���ص���Ϣ:<%=backMess %></Center>
</BODY>
</HTML>
