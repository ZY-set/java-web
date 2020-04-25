<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="gb2312" %>
<%@ attribute name="dataBaseName" required="true" %>
<%@ attribute name="tableName" required="true" %>
<%@ attribute name="findContent" required="true" %>
<%@ attribute name="condition" required="true" %>
<%@ attribute name="findMethod" required="true" %>
<%@ variable name-given="giveResult" variable-class=
"java.lang.StringBuffer" scope="AT_END" %>
<%  
    byte b[]=findContent.getBytes("iso-8859-1");
    findContent=new String(b);
    try{  Class.forName("com.mysql.jdbc.Driver");
    }
    catch(ClassNotFoundException e){
         out.print(e);       
    }
    Connection con;
    Statement sql; 
    ResultSet rs;
    StringBuffer queryResult=new StringBuffer();      //查询结果
    String uri = "jdbc:odbc:"+dataBaseName+"?"+
                             "user=root&password=&characterEncoding=gb2312";
    try{    con=DriverManager.getConnection(uri);
            sql=con.createStatement();
            String s="";
            if(findMethod.equals("start"))
               s= "select * from "+tableName+" where "+
               condition+" Like'"+findContent+"%'";
            if(findMethod.equals("end"))
               s= "select * from "+tableName+" where "+
               condition+" Like'%"+findContent+"'";
            if(findMethod.equals("contains"))
               s= "select * from "+tableName+" where "+
               condition+" Like'%"+findContent+"%'";
            rs=sql.executeQuery(s);
            queryResult.append("<table border=1>");
            queryResult.append("<tr>");
            queryResult.append("<th>封面</td>");
            queryResult.append("<th>ISBN</td>");
            queryResult.append("<th>图书名称</td>");
            queryResult.append("<th>作者</td>"); 
            queryResult.append("<th>价格</td>");
            queryResult.append("<th>出版社</td>");
            queryResult.append("</tr>");
            int 字段个数=6;
            while(rs.next()){
               queryResult.append("<tr>");
               String bookISBN="";   
               for(int k=1;k<=字段个数;k++) {
                  if(k==1){
                     String bookPic=
                    "<image src="+rs.getString(k)+" width=70 height=100/>";
                        queryResult.append("<td>"+bookPic+"</td>");
                  }
                  else if(k==2) {
                        bookISBN=rs.getString(k);
                        String bookISBNLink="<a href=\"lookBookAbstract.jsp?bookISBN="+
                        bookISBN+"\">"+bookISBN+"</a>";
                        queryResult.append("<td>"+bookISBNLink+"</td>");
                  }
                  else if(k==3) {
                        String bookName=rs.getString(k);
                        String bookNameLink="<a href=\"lookBookAbstract.jsp?bookISBN="+
                        bookISBN+"\">"+bookName+"</a>";
                        queryResult.append("<td>"+bookNameLink+"</td>");
                     }
                  else {
                        queryResult.append("<td>"+rs.getString(k)+"</td>");
                  }
                }
                String buy="<a href=\"lookPurchase.jsp?buyISBN="
                            +bookISBN+"\">购买</a>";
                queryResult.append("<td>"+buy+"</td>");          
            }
            queryResult.append("</table>"); 
            jspContext.setAttribute("giveResult",queryResult);
            con.close();
       }
       catch(SQLException exp){
            jspContext.setAttribute("giveResult",new StringBuffer("请给出查询条件"));
       }
%>
