<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="gb2312" %>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="password" required="true" %>
<%@ variable name-given="backMess"  scope="AT_END" %>
<% 
    byte [] a=logname.getBytes("iso-8859-1");
    logname=new String(a);
    byte [] b=password.getBytes("iso-8859-1");
    password=new String(b);
    String mess="";
    try{  Class.forName("com.mysql.jdbc.Driver");
    }
    catch(ClassNotFoundException e){
         out.print(e);       
    }
    Connection con;
    Statement sql; 
    ResultSet rs;
    String loginMess=(String)session.getAttribute("logname");
    if(loginMess==null){
        loginMess="************";
    }
    String str=logname+","+password;
    if(loginMess.equals(str)){
           mess=logname+"�Ѿ���¼��";
    }
    else{
           boolean boo=(logname.length()>0)&&(password.length()>0);  
           try{ 
                String uri = "jdbc:mysql://127.0.0.1/bookshop?"+
                             "user=root&password=&characterEncoding=gb2312";
                con = DriverManager.getConnection(uri);
                String condition=
                "select * from user where logname = '"+
                 logname+"' and password ='"+password+"'";
                sql=con.createStatement();  
                if(boo) {
                  rs=sql.executeQuery(condition);
                  boolean m=rs.next();
                  if(m==true) {
                     mess=logname+"��¼�ɹ�";
                     str=logname+","+password;;
                     session.setAttribute("logname",str);
                  }
                  else {
                     mess="��������û���"+logname+"�����ڣ������벻����";
                  }
                }
                else
                { 
                   mess="��û�е�¼����������û��������ڡ������벻����";
                }
                con.close();
              }
           catch(SQLException exp){
                mess="����:"+exp;
           }
     }
     jspContext.setAttribute("backMess",mess);
%>
