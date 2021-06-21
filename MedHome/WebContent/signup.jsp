<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MedHome</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="signup.css" rel="stylesheet">

</head>
<body>
   <div class="row no-gutters">
      <div class="col no-gutters">
          <div class="leftside"></div>
      
      </div>
      <div class="col no-gutters">
           <div class="rightside">
             <div class="signupform">
                 <h4>REGISTER</h4>
                 <form id="ob" method="post">
                     Name<br/><input type="text" id="rname"> <label id="nval"></label><br/>
                     Age<br/><input type="text" id="rage" ><label id="aval"></label><br/>
                     D.O.B<br/><input type="date" id="rd" ><label id="dval"></label><br/>
                     Contact<br/><input type="text" id="rct" ><label id="cval"></label><br/>
                     E-mail<br/><input type="text" id="rmail" ><label id="eval"></label><br/>
                     Address<br/><textarea id="addr" form="ob" ></textarea><label id="addval"></label><br/>
                     UserName<br/><input type="text" id="user" ><label id="uval"></label><br/>
                     PassWord<br/><input type="password" id="pass" ><label id="pval"></label><br/>
                     <button type="button" onclick="sigval()">SIGN-UP</button>
                 </form>
                 <br/>
                 
             </div>
           
           </div>
      
      </div>
   
   
   
   </div>
	


</body>
<script type="text/javascript">
function sigval(){
	var f=0,f1=0;
	if (document.getElementById('rname').value=="") {
	  	f=1;
		document.getElementById('nval').innerHTML = '<h7  style="color:#031549;font-weight: bold; ">*Required<h7/>';  		
	 }
	 if (document.getElementById('rage').value=="") {
		 f=1; 
		 document.getElementById('aval').innerHTML = '<h7 style="color:#031549;font-weight: bold;">*Required<h7/>';  		
		 }
	 if (document.getElementById('rd').value=="") {
		 f=1;
		 document.getElementById('dval').innerHTML = '<h7 style="color:#031549;font-weight: bold;">*Required<h7/>';  		
		 }
	 if (document.getElementById('rct').value=="") {
		 f=1; 
		 document.getElementById('cval').innerHTML = '<h7 style="color:#031549;font-weight: bold;">*Required<h7/>';  		
		 }
	 if (document.getElementById('rmail').value=="") {
		 f=1; 
		 document.getElementById('eval').innerHTML = '<h7 style="color:#031549;font-weight: bold;">*Required<h7/>';  		
		 }
	 if (document.getElementById('addr').value=="") {
		 f=1; 
		 document.getElementById('addval').innerHTML = '<h7 style="color:#031549;font-weight: bold;">*Required<h7/>';  		
		 }
	 if (document.getElementById('user').value=="") {
		 f=1; 
		 document.getElementById('uval').innerHTML = '<h7 style="color:#031549;font-weight: bold;">*Required<h7/>';  		
		 }
	 if (document.getElementById('pass').value=="") {
		 f=1; 
		 document.getElementById('pval').innerHTML = '<h7 style="color:#031549;font-weight: bold;">*Required<h7/>';  		
		 }
	 else if(f==0)
		 {var n2=document.getElementById('rname').value+"!"+document.getElementById('rage').value+"!"+document.getElementById('rd').value+"!"+document.getElementById('rct').value+"!"+document.getElementById('rmail').value+"!"+document.getElementById('addr').value+"!"+document.getElementById('user').value+"!"+document.getElementById('pass').value;	
		 var http = new XMLHttpRequest();
		 http.open("POST", "http://localhost:8080/MedHome/SignupHandler.jsp", true);
		 http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		 var params = "param1=" + n2; // probably use document.getElementById(...).value
		 http.send(params);
		 http.onload = function() {
			 var r1=http.responseText;
			 if(r1 >= 1&& r1<=1||r1>= 12&& r1<=12||r1 >=123&& r1<=123||r1>=13&& r1<=13){
				 document.getElementById('eval').innerHTML = '<h7 style="color:#031549;font-weight: bold;">already exist<h7/>';
				 f1=1;
				 }
			 	if(r1>= 2&& r1<=2||r1>=23&& r1<=23||r1>=12&& r1<=12||r1>=123&& r1<=123){
			 		document.getElementById('uval').innerHTML = '<h7 style="color:#031549;font-weight: bold;">already exist<h7/>';
			 		f1=2;
				 }
			 	if(r1>= 3&& r1<=3||r1>=23&& r1<=23||r1>=13&& r1<=13||r1>=123&& r1<=123){
			 		document.getElementById('cval').innerHTML = '<h7 style="color:#031549;font-weight: bold;">already exist<h7/>';
			 		f1=3;
				 }
			 	if(f1==0)
			 		{ window.location.replace("http://localhost:8080/MedHome/main.jsp");}
			 	
		 }
		 }
}
</script>
</html>