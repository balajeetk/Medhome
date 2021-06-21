<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection,java.io.File,java.io.InputStream,java.io.FileInputStream,java.sql.DriverManager,java.sql.PreparedStatement,java.util.*,java.text.*,java.lang.Class"%>
<%

String name=request.getParameter("rname");
String batchnum=request.getParameter("bno");
String quantity=request.getParameter("qty");
String rate=request.getParameter("rt");
String expmth=request.getParameter("mth");
String exdate=request.getParameter("expdate");

String description=request.getParameter("desc");
String str="";
try
{
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
   File file;
   String myloc=request.getParameter("img");
   FileInputStream fis;
   File image=new File("F:\\"+myloc);
   String query="update products set name=?,batchno=?,quantity=?,rate=?,expirymonth=?,expirydate=? where batchno="+batchnum;
   PreparedStatement p=con.prepareStatement(query);
   p.setString(1,name);
   p.setString(2,batchnum);
   p.setString(3,quantity);
   p.setString(4,rate);
   p.setString(5,expmth);
   p.setString(6,exdate);
   
   
   
   int res=p.executeUpdate();
   con.setAutoCommit(true);
   p.close();
   
   con.close();
   str="success";
}
catch(Exception e)
{
   System.out.println("--->"+e);
   
}
if(str=="success")
{
	response.sendRedirect("http://localhost:8080/MedHome/admin.jsp");
}
%>