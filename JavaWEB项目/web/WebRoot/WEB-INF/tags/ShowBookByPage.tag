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
    int pageSize=Integer.parseInt(bookAmountInPage); //ÿҳ��ʾ�ļ�¼��
    int allPages=0;                                  //��ҳ�����ҳ��
    int show=Integer.parseInt(page);                 //��ǰ��ʾҳ 
    StringBuffer presentPageResult;                  //��ǰҳ�ϵ�����
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
            rowSet=new CachedRowSetImpl();  //�����м�����
            rowSet.populate(rs);
            con.close();                    //�ر����� 
            rowSet.last();
            m=rowSet.getRow();          //������
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
              presentPageResult.append("<th>����</td>");
              presentPageResult.append("<th>ISBN</td>");
              presentPageResult.append("<th>ͼ������</td>");
              presentPageResult.append("<th>����</td>"); 
              presentPageResult.append("<th>�۸�</td>");
              presentPageResult.append("<th>������</td>");
              presentPageResult.append("</tr>");
              rowSet.absolute((p-1)*pageSize+1);
              int �ֶθ���=6;
              �ֶθ���=Integer.parseInt(zuduanAmount);
              for(int i=1;i<=pageSize;i++){
                presentPageResult.append("<tr>");
                String bookISBN="";   
                for(int k=1;k<=�ֶθ���;k++) {
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
                            +bookISBN+"\">����</a>";
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
               jspContext.setAttribute("giveResult",new StringBuffer("û��ͼ������"));  
            }
            con.close();
       }
       catch(SQLException exp){
            jspContext.setAttribute("showPage",new Integer(0));
            jspContext.setAttribute("pageAllCount",new Integer(0));
            jspContext.setAttribute("giveResult",new StringBuffer(""+exp));
       }
%>
