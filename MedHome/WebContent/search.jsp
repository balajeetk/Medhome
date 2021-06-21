<html>  
<head>  

</head>  
<body>   
<form name="vinform">  
<input style="width:500px;height:50px;margin-left:400px" type="search" name="name" class="search-data" placeholder="Type here to search..." onkeyup="searchInfo()">  
</form>  
  <script>  
var request=new XMLHttpRequest();  
function searchInfo(){  
var name=document.vinform.name.value;  
var url="products1.jsp?val="+name;  
  
try{  
request.onreadystatechange=function(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('mylocation').innerHTML=val;  
}  
}//end of function  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
</script>  
  
</body>  
</html>