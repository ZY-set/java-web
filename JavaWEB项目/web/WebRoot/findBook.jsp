<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="findBook"%>
<%@ include file="head.txt" %></HEAD>
<HTML>
<BODY background="3.jpg"><center>
 <form action="">
   输入查询内容:<Input type=text name="findContent" >
       <Select name="condition" size=1>
          <Option Selected value="bookISBN">ISBN
          <Option value="bookName">书名
          <Option value="bookAuthor">作者
       </Select> 
       <Br>
       <INPUT type="radio" name="findMethod" value="start">前方一致 
       <INPUT type="radio" name="findMethod" value="end">后方一致 
       <INPUT type="radio" name="findMethod" value="contains">包含 
        <Input type=submit value="提交">
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
 <BR>查询到的图书：
 <findBook:FindBook dataBaseName="bookshop"
                    tableName="bookForm"
                    findContent="<%=findContent%>"
                    condition="<%=condition%>"
                    findMethod="<%=findMethod%>"/>
  <BR><%=giveResult%>
  </form>
</BODY></HTML>
