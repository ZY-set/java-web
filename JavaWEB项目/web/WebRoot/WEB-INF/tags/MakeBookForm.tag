<%@ tag import="java.sql.*" %>
<%@ tag import="java.util.*" %>
<%@ tag pageEncoding="gb2312" %>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="orderContent" required="true" %>
<%@ attribute name="totalPrice" required="true" %>
<%@ variable name-given="giveResult" variable-class=
"java.lang.StringBuffer" scope="AT_END" %>
<%@ variable name-given="dingdanNumber" 
             variable-class="java.lang.Long" scope="AT_END" %>
<%  
    String user=(String)session.getAttribute("logname");
    if(user==null){
       response.sendRedirect("login.jsp");
    }
    float sum=Float.parseFloat(totalPrice);
    try{  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    }
    catch(ClassNotFoundException e){
         out.print(e);       
    }
    Connection con;
    Statement sql; 
    ResultSet rs;
    String uri= "jdbc:mysql://127.0.0.1/bookshop?"+
                             "user=root&password=&characterEncoding=gb2312";
    int orderNumber=0;
    int max=orderNumber; 
    String sqlStatement="";
    try{   
            con=DriverManager.getConnection(uri);
            sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                    ResultSet.CONCUR_READ_ONLY);
            rs=sql.executeQuery("SELECT * FROM  orderForm");
            while(rs.next()){
               int n=rs.getInt("orderNumber");
               if(n>=max)
                  max=n;
            }
            orderNumber=max+1; 
            sqlStatement="INSERT INTO orderForm VALUES ("+
                       orderNumber+",'"+logname+"','"+orderContent+"',"+sum+")";
            byte [] bb=sqlStatement.getBytes("iso-8859-1");
            sqlStatement = new String(bb);
            sql.executeUpdate(sqlStatement);
            StringBuffer strMess=new StringBuffer();
            sqlStatement="select * from orderForm where orderNumber = "+orderNumber ; 
            rs=sql.executeQuery(sqlStatement);
            strMess.append("<table border=2>");
            strMess.append("<tr>");
            strMess.append("<th>订单号</th>");
            strMess.append("<th>订单内容</th>");
            strMess.append("<th>总价格</th>");   
            strMess.append("</tr>");
            while(rs.next()){
               String idNumber=rs.getString("orderNumber");
               String orderMess=rs.getString("orderMess");
               float priceSum=rs.getFloat("sum");
               strMess.append("<tr>");
                   strMess.append("<td>"+idNumber+"</td>");
                   strMess.append("<td>"+orderMess+"</td>");
                   strMess.append("<td>"+priceSum+"</td>");   
               strMess.append("</tr>");
            }
            strMess.append("</table>");
            jspContext.setAttribute("giveResult",strMess);
            jspContext.setAttribute("dingdanNumber",new Long(orderNumber)); 
            con.close();
       }
       catch(SQLException exp){
            jspContext.setAttribute("giveResult",new StringBuffer(""+exp));
            jspContext.setAttribute("dingdanNumber",new Long(-1)); 
      }
%>
