<%@ tag import="java.sql.*" %>
<%@ tag import="java.util.*" %>
<%@ tag pageEncoding="gb2312" %>
<%@ attribute name="logname" required="true" %>
<%@ variable name-given="giveResult" variable-class=
"java.lang.StringBuffer" scope="AT_END" %>
<%@ variable name-given="price" variable-class=
"java.lang.Float" scope="AT_END" %>
<%   float totalPrice=0;
     String bookISBN;
     String bookName;
     String bookPublish;
     float bookPrice;
     String uri="jdbc:mysql://127.0.0.1/bookshop?"+
                "user=root&password=&characterEncoding=gb2312";
     Connection con;
     Statement sql; 
     ResultSet rs;
     StringBuffer str=new StringBuffer();
     try{  Class.forName("com.mysql.jdbc.Driver");
     }
     catch(ClassNotFoundException e){
         str.append(e);       
     }
     Enumeration keys=session.getAttributeNames();
     str.append("<table border=2>");
     while(keys.hasMoreElements()) {
         String key=(String)keys.nextElement(); 
         boolean isTrue=(!(key.equals("logname")))&&(key.endsWith(logname));
         if(isTrue){
            bookISBN=(String)session.getAttribute(key);
            String sqlStatement=
           "select * from bookForm where bookISBN = '"+bookISBN+"'" ; 
            try{
                con=DriverManager.getConnection(uri);
                sql=con.createStatement();  
                rs=sql.executeQuery(sqlStatement);
                while(rs.next()){
                   bookISBN=rs.getString("bookISBN");
                   bookName=rs.getString("bookName");
                   bookPublish=rs.getString("bookPublish");
                   bookPrice=rs.getFloat("bookPrice");
                   totalPrice=totalPrice+bookPrice;
                   str.append("<tr>"); 
                   str.append("<td>"+bookISBN+"</td>");
                   str.append("<td>"+bookName+"</td>");
                   str.append("<td>"+bookPublish+"</td>");
                   str.append("<td>"+bookPrice+"</td>");
                   String del=
                   "<a href=\"lookPurchase.jsp?deletedISBN="+bookISBN+"\">É¾³ý</a>";
                   str.append("<td>"+del+"</td>");
                   str.append("</tr>");
                }
                con.close();
           } 
           catch(SQLException exp){
              str.append(exp);
           }
         }
     }
     str.append("</table>"); 
     jspContext.setAttribute("giveResult",str);
     jspContext.setAttribute("price",new Float(totalPrice));
%>
