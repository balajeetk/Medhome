
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.util.*,java.text.*,java.lang.Class"%>
  <%@page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.util.*,java.text.*,java.lang.Class"%>
    


    
   
 <%


String pname=request.getParameter("param");
System.out.println(pname);
HttpSession usession=request.getSession(true);
Object s1=usession.getAttribute("usern");
String s2=(String)s1;
try
   {
    	 Class.forName("com.mysql.jdbc.Driver");
    	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
 		    String query1="DELETE FROM carttb WHERE pname='"+pname+"' and status='no' and uname='"+s2+"'";
 		    PreparedStatement ps=con.prepareStatement(query1);
			ps.executeUpdate();
    		 
    	 
    	
    	 
   }
   catch(Exception e){System.out.print(e);}
   
   %>
