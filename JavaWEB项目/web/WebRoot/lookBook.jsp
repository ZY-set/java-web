<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="showBookByPage"%>
<%@ include file="head.txt" %></HEAD>
<HTML><BODY background="a.jpg"><center>
 <% String number=request.getParameter("page");
    if(number==null){
       number="1"; 
    }
    String  amount="2" ; //ÿҳ��ʾ�ļ�¼��Ŀ
 %>
 <BR>ÿҳ�����ʾ<%=amount%>��ͼ��
 <showBookByPage:ShowBookByPage dataBaseName="bookshop"
                                tableName="bookForm"
                                bookAmountInPage= "<%= amount %>"
                                zuduanAmount="6"
                                page="<%=number%>"/>
  <BR>����<%=pageAllCount%>ҳ,��ǰ��ʾ��<%=showPage%>ҳ
  <BR><%=giveResult%>
  <%
     int m=showPage.intValue();
  %>
  <a href ="lookBook.jsp?page=<%=m+1%>">��һҳ</a>
  <a href ="lookBook.jsp?page=<%=m-1%>">��һҳ</a>
  <form action="">
   ����ҳ��:<Input type=text name="page" >
   <Input type=submit value="�ύ">
  </form>
</BODY> </HTML>
