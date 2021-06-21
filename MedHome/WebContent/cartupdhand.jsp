<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Connection,java.io.File,java.io.InputStream,java.io.FileInputStream,java.sql.DriverManager,java.sql.Statement,java.sql.ResultSet,java.util.*,java.text.*,java.lang.Class"%>
    
<% String n1=request.getParameter("param");
System.out.println(n1);
HttpSession usession=request.getSession(true);
Object s1=usession.getAttribute("usern");
String s2=(String)s1;
	String n2[]=n1.split(":");
	System.out.println(n2[0]);
	System.out.println(n2[1]);
	try
	   {
	    	 Class.forName("com.mysql.jdbc.Driver");
	    	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
	 		    String query1="UPDATE carttb SET quantity='"+n2[0]+"' WHERE pname='"+n2[1]+"' and status='no' and uname='"+s2+"'";
	 		    PreparedStatement ps=con.prepareStatement(query1);
				ps.executeUpdate();
	    	
	    	 
	   }
	   catch(Exception e){System.out.print(e);}
	%>