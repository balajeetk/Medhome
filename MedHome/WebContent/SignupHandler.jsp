<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.util.*,java.text.*,java.lang.Class"%>
<%
String driverName="com.mysql.jdbc.Driver";
String n1=(String)request.getParameter("param1");
String ar1[]=n1.split("!");
String name=ar1[0];
String age=ar1[1];
DateFormat df=new SimpleDateFormat("dd-MM-yyyy");

String datex=ar1[2];

String contact=ar1[3];
String email=ar1[4];
String address=ar1[5];
String user=ar1[6];
String password=ar1[7];
String str="";
try
{
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
   
   
  String query2="select * from user_details";
   Statement ps1=con.createStatement();
   ResultSet rs1=ps1.executeQuery(query2);
   while(rs1.next())
   {
	   String c1=rs1.getString("email");
	   if(email.equals(c1))
	   {
	   out.print("1");
	   str="fail";
	   }
   }
   String query1="select * from user_details";
   Statement ps=con.createStatement();
   ResultSet rs=ps.executeQuery(query1);
   while(rs.next())
   {
	   String c1=rs.getString("uname");
	   if(user.equals(c1))
	   {
	   out.print("2");
	   str="fail";
	   }
   }
   String query3="select * from user_details";
   Statement ps2=con.createStatement();
   ResultSet rs2=ps2.executeQuery(query3);
   while(rs2.next())
   {
	   String c1=rs2.getString("contact");
	   if(contact.equals(c1))
	   {
	   out.print("3");
	   }
   }
   if(!str.equals("fail"))
   {
   String query="insert into user_details values(?,?,?,?,?,?,?,?)";
   PreparedStatement p=con.prepareStatement(query);
   p.setString(1,name);
   p.setString(2,age);
   p.setString(3,datex);
   p.setString(4,contact);
   p.setString(5,email);
   p.setString(6, address);
   p.setString(7,user);
   p.setString(8,password);
   
   int res=p.executeUpdate();
   con.setAutoCommit(true);
   con.close();
   }
}
catch(Exception e)
{
   System.out.println("--->"+e);
   
}
%>