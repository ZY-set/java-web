<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="findBook"%>
<%@ include file="head.txt" %></HEAD>
<HTML>
<BODY background="3.jpg"><center>
 <form action="">
   �����ѯ����:<Input type=text name="findContent" >
       <Select name="condition" size=1>
          <Option Selected value="bookISBN">ISBN
          <Option value="bookName">����
          <Option value="bookAuthor">����
       </Select> 
       <Br>
       <INPUT type="radio" name="findMethod" value="start">ǰ��һ�� 
       <INPUT type="radio" name="findMethod" value="end">��һ�� 
       <INPUT type="radio" name="findMethod" value="contains">���� 
        <Input type=submit value="�ύ">
  </form>
<%
   String findContent = request.getParameter("findContent");
   String condition = request.getParameter("condition");
   String findMethod = request.getParameter("findMethod");
   if(findContent==null){
      findContent="";
   }
   if(condition==null){
      condition="";
   }
   if(findMethod==null){
      findMethod="";
   }
%>
 <BR>��ѯ����ͼ�飺
 <findBook:FindBook dataBaseName="bookshop"
                    tableName="bookForm"
                    findContent="<%=findContent%>"
                    condition="<%=condition%>"
                    findMethod="<%=findMethod%>"/>
  <BR><%=giveResult%>
  </form>
</BODY></HTML>
