<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("bno");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM products WHERE batchno="+id);
response.sendRedirect("http://localhost:8080/MedHome/remove.jsp");

}
catch(Exception e)
{
//System.out.print(e);
e.printStackTrace();
}
%>
