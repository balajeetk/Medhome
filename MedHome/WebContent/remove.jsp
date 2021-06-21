<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
  
  <li><form  name="sch" >
  <input style="margin-left:70px;width:400px" type="text" name="bno" class="search-data" placeholder="Type batch no here.." onkeypress="searchbat()"></form></li>
  <li style="float:right"><a class="active" href="main.jsp" style="color:#031549;font-weight:bold">LOGOUT</a></li>
  
</ul>
<div >
<img class="imf" src="images/medx.PNG" width=400px height=400px>
 <jsp:include page="removefetch.jsp"></jsp:include> 
 </div>  

</body>
<script>  
var request=new XMLHttpRequest();  
function searchbat(){  
var name=document.sch.bno.value;  
var url="removefetch.jsp?val1="+name;  
  
try{  
request.onreadystatechange=function(){  
if(request.readyState==4){  
var val1=request.responseText;  
document.getElementById('updmed').innerHTML=val1;  
}  
} 
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
</script>
</html>
