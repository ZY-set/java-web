<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="gb2312" %>
<%@ attribute name="logname" required="true" %>
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
    try{    con=DriverManager.getConnection(uri);  
            sql=con.createStatement();
            String s= "select * from orderForm where logname= '"+logname+"'" ; 
            rs=sql.executeQuery(s);
            str.append("<table border=1>");
            str.append("<tr>");
            str.append("<th>订单号</th>");
            str.append("<th>订单用户</th>");
            str.append("<th>订单信息</th>");
            str.append("<th>总价格</th>");
            str.append("</tr>");
            while(rs.next()){
                 str.append("<tr>"); 
                 String orderNumber=rs.getString(1);
                 str.append("<td>"+orderNumber+"</td>");   
                 str.append("<td>"+rs.getString(2)+"</td>"); 
                 str.append("<td>"+rs.getString(3)+"</td>"); 
                 str.append("<td>"+rs.getString(4)+"</td>");
                 String del="<a href=\"deleteOrderNumber.jsp?deletedOrderNumber="+
                     orderNumber+"\">删除</a>";
                 str.append("<td>"+del+"</td>");

                 str.append("</tr>");
            }
            str.append("</table>");
            jspContext.setAttribute("giveResult",str);
       }
       catch(SQLException exp){
            jspContext.setAttribute("giveResult",new StringBuffer(""+exp));
       }
%>
