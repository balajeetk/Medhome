<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<% HttpSession usession=request.getSession(true);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MedHome</title>
<script type="text/javascript">
 function test(){
	 <% if(usession.getAttribute("usern")!=null)
	   {
	   usession.invalidate();
	   }
	   
	   %>
	 var n=document.forms["myform"]["user"].value;
 var n1=document.forms["myform"]["pass"].value;
 if (n==null || n=="") {
  document.getElementById('uv').innerHTML = '<h5>Please enter User Name<h5/>';  		
 return false;
 }
if(n1==null || n1==""){
	document.getElementById('pv').innerHTML = '<h5>Please enter password<h5/>'; 
 return false;
 }
 else{
 var n2=n+" "+n1;	
 var http = new XMLHttpRequest();
 http.open("POST", "http://localhost:8080/MedHome/LoginHandler.jsp", true);
 http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
 var params = "param1=" + n2; // probably use document.getElementById(...).value
 http.send(params);
 http.onload = function() {
	 var r1=http.responseText;
	 if(r1 >= 1&&r1<=1){
		 window.location.replace("http://localhost:8080/MedHome/admin.jsp");
		 }
	 else if(r1 >= 2&&r1<=2)
		 {window.location.replace("http://localhost:8080/MedHome/rem.jsp");}
	 else{
		 document.getElementById('check').innerHTML ='<h5>'+r1+'</h5>';
		 }
 }
 } 
 } 
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MedHome</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="main.css" rel="stylesheet">
</head>
<body>
   <div class="row no-gutters">
      <div class="col no-gutters">
          <div class="leftside"></div>
      
      </div>
      <div class="col no-gutters">
           <div class="rightside">
             <div class="loginform">
                 <h4>SIGN-IN</h4>
                 <form name="myform">
                     <strong>Username:</strong><br/><input type="text" name="user" onclick="document.getElementById('uv').innerHTML ='';document.getElementById('check').innerHTML ='';"><label id="uv"></label><br />
                     <strong>Password:</strong><br/><input type="password" name="pass" onclick="document.getElementById('pv').innerHTML ='';document.getElementById('check').innerHTML ='';"><label id="pv"></label><br/>
                     <button type="button" value="SIGN_IN" onclick="test()" >SIGN_IN</button>
                 </form>
                 <br/>
                 <a href="signup.jsp"><p><strong>SIGN-UP</strong></p></a><br/>
                 <label id="check"></label>
                 
             </div>
           
           </div>
      
      </div>
   
   
   
   </div>
	


</body>
</html>