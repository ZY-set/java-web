<%@ tag import="java.util.*" %>
<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="gb2312" %>
<%@ attribute name="logname" required="true" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer"      scope="AT_END" %>
<%@ variable name-given="totalPrice" variable-class="java.lang.Float" scope="AT_END" %>
<%   
     try{  Class.forName("com.mysql.jdbc.Driver");
     }
     catch(ClassNotFoundException e){
         out.print(e);       
     }
     Connection con;
     Statement sql; 
     ResultSet rs;
     StringBuffer orderMess=new StringBuffer();
     String uri="jdbc:mysql://127.0.0.1/bookshop?"+
                             "user=root&password=&characterEncoding=gb2312";
     try{
         con=DriverManager.getConnection(uri);
         sql=con.createStatement();
         Enumeration keys=session.getAttributeNames();
         float sum=0;
         while(keys.hasMoreElements()){
         String key=(String)keys.nextElement();
          boolean isTrue=(!(key.equals("logname")))&&(key.endsWith(logname));
            if(isTrue) {
                String bookISBN=(String)session.getAttribute(key);
                String sqlStatement=
                "select * from bookForm where bookISBN = '"+bookISBN+"'" ; 
                rs=sql.executeQuery(sqlStatement);
                while(rs.next()){
                    bookISBN=rs.getString("bookISBN");
                    String bookName=rs.getString("bookName"); 
                    String bookAuthor=rs.getString("bookAuthor");
                    String bookPublish=rs.getString("bookPublish");
                    float bookPrice=rs.getInt("bookPrice");
                    sum=sum+bookPrice;                       
                    orderMess.append("<br>ISBN:"+bookISBN+" 书名:"+bookName+
                    " 作者:"+bookAuthor+" 出版社:"+bookPublish+" 价格"+bookPrice);
                }
            }
         }
         jspContext.setAttribute("giveResult",orderMess);
         jspContext.setAttribute("totalPrice",new Float(sum)); 
     }
     catch(SQLException exp){
         jspContext.setAttribute("giveResult",new StringBuffer("没有订单"));
         jspContext.setAttribute("totalPrice",new Float(-1)); 
     }
%>
