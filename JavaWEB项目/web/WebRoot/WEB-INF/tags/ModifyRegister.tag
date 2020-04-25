<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="gb2312" %>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="email" required="true" %>
<%@ attribute name="address" required="true" %>
<%@ attribute name="realname" required="true" %>
<%@ attribute name="phone" required="true" %>
<%@ variable name-given="giveResult" variable-class=
             "java.lang.StringBuffer" scope="AT_END" %>
<%
    byte [] c=email.getBytes("iso-8859-1");
    email=new String(c);  
    c=address.getBytes("iso-8859-1");
    address=new String(c); 
    c=realname.getBytes("iso-8859-1");
    realname=new String(c); 
    c=phone.getBytes("iso-8859-1");
    phone=new String(c);  
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
    try{ 
            con=DriverManager.getConnection(uri);
            String updateCondition="UPDATE user SET phone='"+
                 phone+"',email='"+email+"',address='"+
                 address+"',realname='"+
                 realname+"'  WHERE logname='"+logname+"'";
            sql=con.createStatement();
            int m=sql.executeUpdate(updateCondition);
            if(m==1) {
                str.append("修改信息成功");
            }
            else {
                str.append("更新失败");
            }
            con.close();
    }
    catch(SQLException exp){
        str.append("更新失败"+exp);
    }
    jspContext.setAttribute("giveResult",str);
%>
