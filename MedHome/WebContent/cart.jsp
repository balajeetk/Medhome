<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.lang.String"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection,java.io.File,java.io.InputStream,java.io.FileInputStream,java.sql.DriverManager,java.sql.Statement,java.sql.ResultSet,java.util.*,java.text.*,java.lang.Class"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>MedHome</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link href="cart.css" rel="stylesheet">
<link href="car.css" rel="stylesheet">
<link href="pros.css" rel="stylesheet">
</head>
<body>

<div>
<ul>
  
   
   <li style="float:left;margin-top: 10px"><img src="images/ml.PNG" class="img-fluid"></li>
   <li style="float:left;color:#FF8038;font-size:35px;margin-left:500px"><b> MY CART</b></li>
   <li ><a href="main.jsp"><img src="images/logout.png" class="img-fluid"></a></li>
   <li><a href="products.jsp"><img src="images/cart.png" class="img-fluid"></a></li>
    <li><a href="myprof.jsp"><img src="images/user.png" class="img-fluid"></a></li>
     <li><a href="myord.jsp"><img src="images/orders.png" class="img-fluid"></a></li>
</ul></div>
<br/>




   <%
   HttpSession usession=request.getSession(true);
   Object s1=usession.getAttribute("usern");
   String s2=(String)s1;
   int totam=0;
     try
   {
    	 Class.forName("com.mysql.jdbc.Driver");
    	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
    	 String query="select * from carttb where uname='"+s2+"' and status='no'";
    	 Statement st=con.createStatement();
    	 ResultSet rs=st.executeQuery(query);
    	 Blob image = null;
		 byte[] imgData = null;
    	 while(rs.next())
    	 {
    	 
    	 
    		    Blob  blob=rs.getBlob("pimage");
    		 
    		    byte[] imageBytes=blob.getBytes(1, (int)blob.length());
    		 
    		    String encodedImage=Base64.getEncoder().encodeToString(imageBytes);
    		 
    		    String image1="data:image/png;base64,"+encodedImage;
    		    int qt=Integer.parseInt(rs.getString("quantity"));
    		    int rate=Integer.parseInt(rs.getString("rate"));
    		    int tot1=qt*rate;
    		    
    		    totam=totam+tot1;
    	 
    	 
    	 %>
    	 <div class="row mt-5">
    		 
    		   <div class="flip-card">
      <img src="<%=image1%>" alt="Avatar" style="width:200px;height:200px;margin-left:40px">
      <h5 style="margin-left: 80px"  id="pname"><%=rs.getString("pname") %></h5>
    		  <p style="margin-left: 90px" class="price">Rs.<%=rs.getString("rate") %></p>
    		  <p style="margin-right:300px" class="qty" align="right" ><b>Quantity:</b><input name="<%=rs.getString("pname") %>" id="<%=rs.getString("rate") %>" type="number" onchange="calc(this,this)" value="<%=rs.getString("quantity") %>"  class="quantity-field"><p style="margin-right:300px" align=right onclick="sum(this)" onclick="window.location.reload();" id="tot<%=rs.getString("pname") %>">TOTAL:<%=tot1 %></p></p>
    		  <p style="margin-right:300px;"class="rem" align="right" ><button id="<%=rs.getString("pname")%>" onclick="test(this)" onclick="window.location.reload();">Remove</button></p>
    		  <input type="hidden" id="hid" name="hiddenid">
</div><br/></div>
    		<%
    	 }
    	 
   }
   catch(Exception e){System.out.print(e);}
   
   %>
   
<b><p style="margin-right:250px" align="right">TOTAL AMOUNT:<%=totam %></p></b>
<form  style="margin-left:650px"action="checkouthandler.jsp" method="post">
Amount to be Paid:<input type="text"  name="amt"  value="<%=totam%>">
<input  type="submit" value="PayNow">

</form>


<script type="text/javascript">
var total=0;
function test(btn) {
	var http = new XMLHttpRequest();
	var param="param="+btn.id;
	window.location.reload();
	http.open("POST", "cartrem.jsp", true);
	window.location.reload();
    	 http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    	 http.send(param);
    	 window.location.reload();
    	 window.location.reload();
    }
function test1(btn) {
	
    	 location.replace("checkouthandler.jsp");
    }
function calc(qtval,rte) 
{var http = new XMLHttpRequest();
	
	http.open("POST", "cartupdhand.jsp", true);
	 http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	 
  var qty = qtval.value;
  var id1="tot"+qtval.name;
  var param="param="+qty+":"+qtval.name;
  var rate = rte.id;
  console.log(qty+" "+rate+" "+id1);
  total = qty*rate;
  console.log(total);
  document.getElementById(id1).innerHTML="TOTAL."+total; 
  http.send(param);
  window.location.reload();
}


</script>
<script type='text/javascript'>

(function()
{
  if( window.localStorage )
  {
    if( !localStorage.getItem('firstLoad') )
    {
      localStorage['firstLoad'] = true;
      window.location.reload();
    }  
    else
      localStorage.removeItem('firstLoad');
  }
})();

</script>
</body>
</html>