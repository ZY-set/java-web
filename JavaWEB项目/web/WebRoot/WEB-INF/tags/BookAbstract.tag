<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="gb2312" %>
<%@ attribute name="bookISBN" required="true" %>
<%@ variable name-given="giveResult" 
            variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%  
    try{  Class.forName("com.mysql.jdbc.Driver");
    }
    catch(ClassNotFoundException e){
         out.print(e);       
    }
    StringBuffer str=new StringBuffer();
    Connection con;
    Statement sql; 
    ResultSet rs;
    String uri="jdbc:mysql://127.0.0.1/bookshop?"+
                             "user=root&password=&characterEncoding=gb2312";
    try{ con=DriverManager.getConnection(uri);  
         sql=con.createStatement();
         String s= 
        "select * from bookForm where bookISBN= '"+bookISBN+"'"; 
         rs=sql.executeQuery(s);
         str.append("<table border=1>");
         str.append("<tr>");
         str.append("<th>ÊéÃû</th>");
         str.append("<th>ÕªÒª</th>");
         str.append("</tr>");
         while(rs.next()){
            str.append("<tr>"); 
            str.append("<td>"+rs.getString("bookName")+"</td>");   
            str.append("<td><TextArea Rows=8 Cols=40>"+
                 rs.getString("bookAbstract")+"</TextArea></td>"); 
                 str.append("</tr>");
         }
         str.append("</table>");
         jspContext.setAttribute("giveResult",str);
         con.close();
     }
     catch(SQLException exp){
            jspContext.setAttribute("giveResult",new StringBuffer(""+exp));
     }
%>
