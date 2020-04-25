<%@ page contentType="text/html;charset=GB2312" %>
<%@ include file="head.txt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="register"%>
<title>
    注册页面 
</title>
<HTML>
<BODY background="b.jpg"><Font size=3> 
<CENTER>
<FORM action="" method="post" name=form>
<table>
    输入您的信息，用户名中不能包含有逗号，带*号项必须填写。
   <tr><td>用户名称:</td><td><Input type=text name="logname" ></td></tr>
    <tr><td>设置密码:</td><td><Input type=password name="password"></td></tr>
   <tr><td>电子邮件:</td><td><Input type=text name="email"></td></tr>
   <tr><td>真实姓名:</td><td><Input type=text name="realname"></td></tr>
   <tr><td>联系电话:</td><td><Input type=text name="phone"></td></tr>
   <tr><td>通信地址:</td><td><Input type=text name="address"></td></tr>
   <tr><td><Input type=submit name="g" value="提交"></td> </tr>
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
 <Center><P>返回的消息:<%=backMess %></Center>
</Body>
</HTML>
