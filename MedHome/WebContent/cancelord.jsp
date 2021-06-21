
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.util.*,java.text.*,java.lang.Class"%>
  <%@page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.util.*,java.text.*,java.lang.Class"%>
    


    
   
 <%


int pname=Integer.parseInt(request.getParameter("param"));
System.out.println(pname);
System.out.println(pname);
HttpSession usession=request.getSession(true);
Object s1=usession.getAttribute("usern");
String s2=(String)s1;
int count=0;
try
   {
    	 Class.forName("com.mysql.jdbc.Driver");
    	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
    	 String query="select * from carttb where uname='"+s2+"'";
    	 Statement st=con.createStatement();
    	 ResultSet rs=st.executeQuery(query);
    	 Blob image = null;
		 byte[] imgData = null;
    	 while(rs.next())
    	 {
    		 if(count==pname)
    		 {
 		 	String name=rs.getString("pname");
 		    String query1="DELETE FROM carttb WHERE pname='"+name+"'";
 		    PreparedStatement ps=con.prepareStatement(query1);
			ps.executeUpdate();
    		 }
    	 	count=count+1;
    	}
    	 
   }
   catch(Exception e){System.out.print(e);}
   
   %>
