<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="showBookByPage"%>
<%@ include file="head.txt" %></HEAD>
<HTML><BODY background="a.jpg"><center>
 <% String number=request.getParameter("page");
    if(number==null){
       number="1"; 
    }
    String  amount="2" ; //每页显示的记录数目
 %>
 <BR>每页最多显示<%=amount%>本图书
 <showBookByPage:ShowBookByPage dataBaseName="bookshop"
                                tableName="bookForm"
                                bookAmountInPage= "<%= amount %>"
                                zuduanAmount="6"
                                page="<%=number%>"/>
  <BR>共有<%=pageAllCount%>页,当前显示第<%=showPage%>页
  <BR><%=giveResult%>
  <%
     int m=showPage.intValue();
  %>
  <a href ="lookBook.jsp?page=<%=m+1%>">下一页</a>
  <a href ="lookBook.jsp?page=<%=m-1%>">上一页</a>
  <form action="">
   输入页码:<Input type=text name="page" >
   <Input type=submit value="提交">
  </form>
</BODY> </HTML>
