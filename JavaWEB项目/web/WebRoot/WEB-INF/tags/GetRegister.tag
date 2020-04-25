<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="gb2312" %>
<%@ attribute name="logname" required="true" %>
<%@ variable name-given="oldEmail"  scope="AT_END" %>
<%@ variable name-given="oldAddress"  scope="AT_END" %>
<%@ variable name-given="oldRealname"  scope="AT_END" %>
<%@ variable name-given="oldPhone"  scope="AT_END" %>
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
    try{ 
            con=DriverManager.getConnection(uri);
            String query="select phone,email,address,realname "+
            " from user WHERE logname='"+logname+"'";
            sql=con.createStatement();
            rs=sql.executeQuery(query);
            if(rs.next()){
               jspContext.setAttribute("oldPhone",rs.getString("phone"));
               jspContext.setAttribute("oldEmail",rs.getString("email"));
               jspContext.setAttribute("oldAddress",rs.getString("address"));
               jspContext.setAttribute("oldRealname",rs.getString("realname"));
            }
            else{
               jspContext.setAttribute("oldPhone","");
               jspContext.setAttribute("oldEmail","");
               jspContext.setAttribute("oldAddress","");
               jspContext.setAttribute("oldRealname",""); 
            }
            con.close();
    }
    catch(SQLException exp){
        jspContext.setAttribute("oldPhone","");
        jspContext.setAttribute("oldEmail","");
        jspContext.setAttribute("oldAddress","");
        jspContext.setAttribute("oldRealname","");
    }
%> 
