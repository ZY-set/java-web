<%@ tag import="java.sql.*" %>
<%@ tag import="com.sun.rowset.*" %>
<%@ tag pageEncoding="gb2312" %>
<%@ attribute name="dataBaseName" required="true" %>
<%@ attribute name="tableName" required="true" %>
<%@ attribute name="bookAmountInPage" required="true" %>
<%@ attribute name="page" required="true" %>
<%@ attribute name="zuduanAmount" required="true" %>
<%@ variable name-given="showPage" variable-class="java.lang.Integer" scope="AT_END" %>
<%@ variable name-given="pageAllCount" variable-class="java.lang.Integer" scope="AT_END" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%  
    try{  Class.forName("com.mysql.jdbc.Driver");
    }
    catch(ClassNotFoundException e){
         out.print(e);       
    }
    Connection con;
    Statement sql; 
    ResultSet rs;
    int pageSize=Integer.parseInt(bookAmountInPage); //每页显示的记录数
    int allPages=0;                                  //分页后的总页数
    int show=Integer.parseInt(page);                 //当前显示页 
    StringBuffer presentPageResult;                  //当前页上的内容
    CachedRowSetImpl rowSet;            
    presentPageResult=new StringBuffer();
    String uri = "jdbc:mysql://127.0.0.1/"+dataBaseName+"?"+
                             "user=root&password=&characterEncoding=gb2312";
    try{    con=DriverManager.getConnection(uri);
            sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                          ResultSet.CONCUR_READ_ONLY);
            String s= "select * from "+tableName;
            rs=sql.executeQuery(s);
            int m=0,n=0;
            rowSet=new CachedRowSetImpl();  //创建行集对象
            rowSet.populate(rs);
            con.close();                    //关闭连接 
            rowSet.last();
            m=rowSet.getRow();          //总行数
            if(m>=1) {
              n=pageSize;
              allPages=((m%n)==0)?(m/n):(m/n+1);
              int p=Integer.parseInt(page);
              if(p>allPages)
                p=1;
              if(p<=0)
                p=allPages;
              jspContext.setAttribute("showPage",new Integer(p));
              jspContext.setAttribute("pageAllCount",new Integer(allPages));
              presentPageResult.append("<table border=1>");
              presentPageResult.append("<tr>");
              presentPageResult.append("<th>封面</td>");
              presentPageResult.append("<th>ISBN</td>");
              presentPageResult.append("<th>图书名称</td>");
              presentPageResult.append("<th>作者</td>"); 
              presentPageResult.append("<th>价格</td>");
              presentPageResult.append("<th>出版社</td>");
              presentPageResult.append("</tr>");
              rowSet.absolute((p-1)*pageSize+1);
              int 字段个数=6;
              字段个数=Integer.parseInt(zuduanAmount);
              for(int i=1;i<=pageSize;i++){
                presentPageResult.append("<tr>");
                String bookISBN="";   
                for(int k=1;k<=字段个数;k++) {
                     if(k==1){
                        String bookPic="<image src="+rowSet.getString(k)+
                         " width=70 height=100/>";
                        presentPageResult.append("<td>"+bookPic+"</td>");
                     }
                     else if(k==2) {
                        bookISBN=rowSet.getString(k);
                        String bookISBNLink="<a href=\"lookBookAbstract.jsp?bookISBN="+
                        bookISBN+"\">"+bookISBN+"</a>";
                        presentPageResult.append("<td>"+bookISBNLink+"</td>");
                     }
                      else if(k==3) {
                        String bookName=rowSet.getString(k);
                        String bookNameLink="<a href=\"lookBookAbstract.jsp?bookISBN="+
                        bookISBN+"\">"+bookName+"</a>";
                        presentPageResult.append("<td>"+bookNameLink+"</td>");
                     }
                     else {
                        presentPageResult.append("<td>"+rowSet.getString(k)+"</td>");
                     }
                   
                }
                String buy="<a href=\"lookPurchase.jsp?buyISBN="
                            +bookISBN+"\">购买</a>";
                presentPageResult.append("<td>"+buy+"</td>");
                presentPageResult.append("</tr>");
                boolean boo=rowSet.next();
                if(boo==false) break;
              }
              presentPageResult.append("</table>"); 
              jspContext.setAttribute("giveResult",presentPageResult);
            }
            else {
               jspContext.setAttribute("showPage",new Integer(0));
               jspContext.setAttribute("pageAllCount",new Integer(0));
               jspContext.setAttribute("giveResult",new StringBuffer("没有图书可浏览"));  
            }
            con.close();
       }
       catch(SQLException exp){
            jspContext.setAttribute("showPage",new Integer(0));
            jspContext.setAttribute("pageAllCount",new Integer(0));
            jspContext.setAttribute("giveResult",new StringBuffer(""+exp));
       }
%>
