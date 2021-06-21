<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection,java.io.File,java.sql.ResultSet,java.io.InputStream,java.io.FileInputStream,java.sql.DriverManager,java.sql.Statement,java.util.*,java.text.*,java.lang.Class"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title >MedHome</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="admin.css" rel="stylesheet">

</head>
<span id="updmed">
<body>
  <%  String batchnum=request.getParameter("val1");
  System.out.println(batchnum);%> 
    
<div class="addform"style="margin-left: 500px;margin-top: 15px">
             
                 <h4>REMOVE MEDICINE</h4>
                 
                 <form action="RemoveHandler.jsp" id="ob" method="post" >
                 
<% 
int ct=0;
try
{
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
   String query="select * from products where batchno like '"+batchnum+"%'";
   Statement p=con.createStatement();
  
   ResultSet  res=p.executeQuery(query);
   while(res.next()){if(ct==0&&res!=null)
   {%>

					

                     Name<br/><input type="text" name="rname" value="<%=res.getString("name")%>"><br/>
                     Batch.No:<br/><input type="text" name="bno"value="<%=res.getString("batchno")%>"><br/>
                     Quantity:<br/><input type="text" name="qty"value="<%=res.getString("quantity")%>"><br/>
                     Rate(per strip):<br/><input type="text" name="rt"value="<%=res.getString("rate")%>"><br/>
                     ExpiryMonth:<br/><input type="text" name="mth"value="<%=res.getString("expirymonth")%>"><br/>
                     ExpiryDate:<br/><input type="date" name="expdate"value="<%=res.getString("expirydate")%>"><br/>
                     
                     <input type="submit" class="submit1" value="REMOVE">
                 </form>
                 <br/>
                  </div>
                  
 
<%
}ct=ct+1; 
res.setFetchSize(res.getFetchSize());}}
catch(Exception e)
{
	   System.out.println(e);
}
if(batchnum==null)
{%>
	Name<br/><input type="text" name="rname" value=""><br/>
    Batch.No:<br/><input type="text" name="bno"value=""><br/>
    Quantity:<br/><input type="text" name="qty"value=""><br/>
    Rate(per strip):<br/><input type="text" name="rt"value=""><br/>
    ExpiryMonth:<br/><input type="text" name="mth"value=""><br/>
    ExpiryDate:<br/><input type="date" name="expdate"value=""><br/>
    
    <input type="submit" class="submit1" value="REMOVE MEDICINE">
</form>
<br/>
 </div>
<%}
%>
</body>
</span>
</html>
