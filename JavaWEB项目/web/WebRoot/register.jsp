<%@ page contentType="text/html;charset=GB2312" %>
<%@ include file="head.txt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="register"%>
<title>
    ע��ҳ�� 
</title>
<HTML>
<BODY background="b.jpg"><Font size=3> 
<CENTER>
<FORM action="" method="post" name=form>
<table>
    ����������Ϣ���û����в��ܰ����ж��ţ���*���������д��
   <tr><td>�û�����:</td><td><Input type=text name="logname" ></td></tr>
    <tr><td>��������:</td><td><Input type=password name="password"></td></tr>
   <tr><td>�����ʼ�:</td><td><Input type=text name="email"></td></tr>
   <tr><td>��ʵ����:</td><td><Input type=text name="realname"></td></tr>
   <tr><td>��ϵ�绰:</td><td><Input type=text name="phone"></td></tr>
   <tr><td>ͨ�ŵ�ַ:</td><td><Input type=text name="address"></td></tr>
   <tr><td><Input type=submit name="g" value="�ύ"></td> </tr>
</table>
</Form>
</CENTER>
<%
    String logname=request.getParameter("logname");
    String password=request.getParameter("password");
    String email=request.getParameter("email");
    String realname=request.getParameter("realname");
    String phone=request.getParameter("phone");
    String address=request.getParameter("address");
%>
<register:Register logname="<%=logname%>"
                   password="<%=password%>"
                   email="<%=email%>"
                   realname="<%=realname%>"
                   phone="<%=phone%>"  
                   address ="<%=address%>" />
 <Center><P>���ص���Ϣ:<%=backMess %></Center>
</Body>
</HTML>
