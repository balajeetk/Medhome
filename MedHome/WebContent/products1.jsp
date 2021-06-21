<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.lang.String"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection,java.io.File,java.io.InputStream,java.io.FileInputStream,java.sql.DriverManager,java.sql.Statement,java.sql.ResultSet,java.util.*,java.text.*,java.lang.Class"%>
<%
try
{
HttpSession usession=request.getSession(true);
   Object s1=usession.getAttribute("usern");
   String s2=(String)s1;
   }
   catch(Exception e)
   {
   }%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="product1.css" rel="stylesheet">
<link href="car.css" rel="stylesheet">
</head>
<body>
<span id="myprd">
<div class="row mt-5">

   <%
   
   String name=request.getParameter("val");  
   System.out.println(name);
   if(name==null||name=="null"||name==""){  
	   try
	   {
	    	 Class.forName("com.mysql.jdbc.Driver");
	    	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
	    	 String query="select * from products ";
	    	 Statement st=con.createStatement();
	    	 ResultSet rs=st.executeQuery(query);
	    	 Blob image = null;
			 byte[] imgData = null;
	    	 while(rs.next())
	    	 {
	    	 
	    	 
	    		    Blob  blob=rs.getBlob("image");
	    		 
	    		    byte[] imageBytes=blob.getBytes(1, (int)blob.length());
	    		 
	    		    String encodedImage=Base64.getEncoder().encodeToString(imageBytes);
	    		 
	    		    String image1="data:image/png;base64,"+encodedImage;
	    		    
	    	 
	    	 
	    	 %>
	    	 
	    		 <div class="col-md-3" >
	    		 
	    		   <div class="flip-card">
	  <div class="flip-card-inner">
	    <div class="flip-card-front">
	      <img src="<%=image1 %>" alt="Avatar" style="width:200px;height:200px;margin-left:30px">
	      <h5  id="pname"><%=rs.getString("name") %></h5>
	    		  <p class="price">Rs.<%=rs.getString("rate") %></p>
	    		  <p><button id="button1" ><b>Expires on:<%=rs.getString("expirymonth") %></b></button></p><br/>
	    		  
	    </div>
	    <div class="flip-card-back">
	    	<h3>Uses and Benefits:</h3>
	      <h6 align="justify"><%=rs.getString("description") %></h6>
	      <p style="color:white;"><b>Expires on: <%=rs.getString("expirydate") %></b></p>
	      <p><button name="<%=rs.getString("name") %>" id="myButton" onclick="test(this)"><b>ADD TO CART</b></button></p><br/>
	    </div>
	  </div>
	</div><br/></div>
	    		<%
	    	 }
	    	 
	   }
	   catch(Exception e){System.out.print(e);}
   }
   else
   {
	   %><script type="text/javascript">window.location.reload();</script><%
     try
   {
    	 Class.forName("com.mysql.jdbc.Driver");
    	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
    	 String query="select * from products where name like '%"+name+"%'";
    	 Statement st=con.createStatement();
    	 ResultSet rs=st.executeQuery(query);
    	 Blob image = null;
		 byte[] imgData = null;
    	 while(rs.next())
    	 {
    	 
    	 
    		    Blob  blob=rs.getBlob("image");
    		 
    		    byte[] imageBytes=blob.getBytes(1, (int)blob.length());
    		 
    		    String encodedImage=Base64.getEncoder().encodeToString(imageBytes);
    		 
    		    String image1="data:image/png;base64,"+encodedImage;
    		    
    	 
    	 
    	 %>
    	 
    		 <div class="col-md-3" >
    		 
    		   <div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
      <img src="<%=image1 %>" alt="Avatar" style="width:200px;height:200px;margin-left:30px">
      <h5  id="pname"><%=rs.getString("name") %></h5>
    		  <p class="price">Rs.<%=rs.getString("rate") %></p>
    		  <p><button id="button1" ><b>Expires on:<%=rs.getString("expirymonth") %></b></button></p><br/>
    		  
    </div>
    <div class="flip-card-back">
    	<h3>Uses and Benefits:</h3>
      <h6 align="justify"><%=rs.getString("description") %></h6>
      <p style="color:white;"><b>Expires on: <%=rs.getString("expirydate") %></b></p>
      <p><button name="<%=rs.getString("name") %>" id="myButton" onclick="test(this)"><b>ADD TO CART</b></button></p><br/>
    </div>
  </div>
</div><br/></div>
    		<%
    	 }
    	 
   }
   catch(Exception e){System.out.print(e);}
   }
   %>
   

</div>
</span>
<script type="text/javascript">
function test(btn) {
	var http = new XMLHttpRequest();
	var param="param="+btn.name;
	alert("product added to cart");
	http.open("POST", "productinfo.jsp", true);
    	 http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    	 http.send(param);
    }
    
</script>
<script type="text/javascript">
</script>
</body>
</html>