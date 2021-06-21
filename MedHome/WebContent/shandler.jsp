<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%
	String str=request.getParameter("param");
    String[] str1=str.split("/");
    
    if(str1[0].equals("shipped")){
    	Class.forName("com.mysql.jdbc.Driver");
   	     Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
		    String query1="UPDATE carttb SET status='shipped' where pname='"+str1[1]+"'";
		    
		    PreparedStatement ps=con.prepareStatement(query1);
			ps.executeUpdate();
    }
    if(str1[0].equals("delivered")){
    	Class.forName("com.mysql.jdbc.Driver");
   	     Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
		    String query1="UPDATE carttb SET status='delivered' where pname='"+str1[1]+"'";
		    
		    PreparedStatement ps=con.prepareStatement(query1);
			ps.executeUpdate();
    }




%>