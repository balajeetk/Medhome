<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.util.*,java.text.*,java.lang.Class"%>
<%

String name=(String)request.getParameter("param1");

    String n1[]=name.split(" ");
    int flag=0;
    
  if(n1[0].equals("admin") && n1[1].equals("1234"))
    {
    	out.print("1");
    	flag=1;
    }
    else
    {
    	String driverName="com.mysql.jdbc.Driver";
    	try
    	{
    	   Class.forName("com.mysql.jdbc.Driver");
    	   Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
    	  String query2="select * from user_details";
    	   Statement ps1=con.createStatement();
    	   ResultSet rs1=ps1.executeQuery(query2);
    	   while(rs1.next())
    	   {
    		   String c1=rs1.getString("uname");
    		   String c2=rs1.getString("password");
    		   if(n1[0].equals(c1)&&n1[1].equals(c2))
    		   {
    				  HttpSession usession=request.getSession(true);
    				  usession.setAttribute("usern", c1);
    			
    				  
    		   out.print("2");
 				flag=1;
    		   }
    	   }
    	  if(flag==0)
    	  {
    		out.print("invalid username/pass");
    	  }
    	}
    	catch(Exception e)
    	{
    	   System.out.println("--->"+e);
    	   
    	}

    }
    

%>