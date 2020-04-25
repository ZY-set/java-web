<%@ page contentType="text/html;charset=GB2312" %>
<HEAD><%@ include file="head.txt" %></HEAD>
<%@ page import="java.sql.*" %>
<HTML><BODY bgcolor=cyan>
 <% 
    String orderNumber=request.getParameter("deletedOrderNumber");
    int number =Integer.parseInt(orderNumber);
    Connection con;
    Statement sql; 
    ResultSet rs;
    try{  Class.forName("com.mysql.jdbc.Driver");
    }
    catch(Exception e){}
    try { String uri="jdbc:mysql://127.0.0.1/bookshop?"+
                             "user=root&password=&characterEncoding=gb2312";
          con=DriverManager.getConnection(uri);
       
          String condition =
          "DELETE FROM orderForm WHERE orderNumber = "+number;
          sql=con.createStatement();
          sql.executeUpdate(condition);
          out.print("订单号是"+number+"的订单被删除");
          con.close();
    }
    catch(SQLException e){ 
          out.print(e);
    }
 %>
</BODY></HTML>
