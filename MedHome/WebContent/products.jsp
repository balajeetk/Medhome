<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>MedHome</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link href="product.css" rel="stylesheet">
</head>
<body>

<div>
<ul>
  
   
   <li style="float:left;margin-top: 10px"><img src="images/ml.PNG" class="img-fluid"></li>
   <li style="float:left;margin-top:15px">
   <form name="vinform">  
<input style="width:500px;height:50px;margin-left:400px" type="search" name="name" class="search-data" placeholder="Type here to search..." onkeyup="searchInfo()">  
</form></li>
   <li ><a href="main.jsp"><img src="images/logout.png" class="img-fluid"></a></li>
   <li><a href="cart.jsp" ><img src="images/cart.png" class="img-fluid"></a></li>
    <li><a href="myprof.jsp"><img src="images/user.png" class="img-fluid"></a></li>
     <li><a href="myord.jsp"><img src="images/orders.png" class="img-fluid"></a></li>
</ul></div>
<br/>

<br/>
<jsp:include page="carousel.jsp"></jsp:include>
<jsp:include page="products1.jsp"></jsp:include>
</body>
<script>  
var request=new XMLHttpRequest();  
function searchInfo(){  
var name=document.vinform.name.value;  
var url="products1.jsp?val="+name;  
  
try{  
request.onreadystatechange=function(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('myprd').innerHTML=val;  
}  
} 
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
</script>
</html>