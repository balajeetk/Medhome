<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*,net.proteanit.sql.DbUtils"%>
<html>
<head>
<title >MedHome</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="admin.css" rel="stylesheet">

</head>
<body>

<ul>
  <li><a  href="admin.jsp"style="color:#031549;font-weight:bold">Add Medicines</a></li>
  <li><a href="update.jsp"style="color:#031549;font-weight:bold">Update Medicines</a></li>
  <li><a href="remove.jsp"style="color:#031549;font-weight:bold">Remove Medicines</a></li>
  <li><a href="status.jsp"style="color:#031549;font-weight:bold">Update Orders</a></li>
  <li style="float:right"><a class="active" href="main.jsp" style="color:#031549;font-weight:bold">LOGOUT</a></li>
  
</ul>
<div >
<img class="imf" src="images/medx.PNG" width=400px height=400px>



   
 </div>
 <table id="ststb" border="1" style="margin-left:700px;margin-top:100px;background-color:white;width:350px;height:450px">
 <tr>
 <td>UserName</td>
 <td>Product Name</td>
 <td>Status</td>
 </tr>
 <%
  try
 {
	  Class.forName("com.mysql.jdbc.Driver");
	   Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
	   String query="select * from carttb";
	   Statement p=con.createStatement();
	   int i=0;
	   ResultSet  res=p.executeQuery(query);
	   while(res.next()){%>
	   <tr>
	   <td><%=res.getString("uname") %></td>
	   <td><%=res.getString("pname") %></td>
	     
	   <td id="<%=res.getString("pname")%>" contenteditable="true" onkeypress="test1(this)" onClick="test1(this)" ><%=res.getString("status") %></td>
	   
	   </tr>
	   <%}
 }
 catch(Exception e){}
 %>
 </table>
 <script>
 function test1(pr)
 {
	 var st1=pr.innerHTML+"/"+pr.id;
	 
	 var http = new XMLHttpRequest();
		var param="param="+st1;
		
		     http.open("POST", "shandler.jsp", true);
	    	 http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	    	 http.send(param);
 }
 
 </script>
 </body>
</html>
