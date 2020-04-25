<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="gb2312" %>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="password" required="true" %>
<%@ attribute name="email" required="true" %>
<%@ attribute name="address" required="true" %>
<%@ attribute name="realname" required="true" %>
<%@ attribute name="phone" required="true" %>
<%@ variable name-given="backMess"  scope="AT_END" %>
<%  boolean boo=true;
    if(logname!=null){
         if(logname.contains(",")||logname.contains("，"))
               boo=false;
    }
    if(boo){
       try{  Class.forName("com.mysql.jdbc.Driver");
       }
       catch(ClassNotFoundException e){
         out.print(e); 
       }
       Connection con;
       Statement sql; 
       ResultSet rs;
       String condition="INSERT INTO user VALUES";
       condition+="("+"'"+logname;
       condition+="','"+password;
       condition+="','"+phone;
       condition+="','"+email;
       condition+="','"+address;
       condition+="','"+realname+"')";
       try{ 
           byte [] b=condition.getBytes("iso-8859-1");
           condition=new String(b);
           String uri = "jdbc:mysql://127.0.0.1/bookshop?"+
             "user=root&password=&characterEncoding=gb2312";
           con = DriverManager.getConnection(uri);
           sql=con.createStatement();
           sql.executeUpdate(condition);
           con.close();
           byte [] c=logname.getBytes("iso-8859-1");
           logname=new String(c);
           String mess=logname+"注册成功";
           jspContext.setAttribute("backMess",mess);
           con.close();
       }
       catch(Exception e){
           jspContext.setAttribute("backMess","没有填写用户名或用户名已经被注册");
       }
    }
    else{
           jspContext.setAttribute("backMess","注册失败(用户名中不能有逗号)");
    }
%>
