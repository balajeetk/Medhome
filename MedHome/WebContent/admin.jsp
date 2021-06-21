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
  <li><a href="status.jsp"style="color:#031549;font-weight:bold">Update Orders</a></li>
  <li style="float:right"><a class="active" href="main.jsp" style="color:#031549;font-weight:bold">LOGOUT</a></li>
  
</ul>
<div >
<img class="imf" src="images/medx.PNG" width=400px height=400px>

<div class="addform"style="margin-left: 500px;margin-top: 15px">
                 
                 <h4>ADD MEDICINE</h4>
                 <form action="AddmedHandler.jsp" id="ob" method="post" >
                     Name<br/><input type="text" name="rname"><br/>
                     Batch.No:<br/><input type="text" name="bno"><br/>
                     Quantity:<br/><input type="text" name="qty"><br/>
                     Rate(per strip):<br/><input type="text" name="rt"><br/>
                     ExpiryMonth:<br/><input type="text" name="mth"><br/>
                     ExpiryDate:<br/><input type="date" name="expdate"><br/>
                     Image:<br/><input type="file" name="img"><br/>
                     Description:<br/><textarea name="desc" form="ob"></textarea><br/>
                     Category:<br/><select name="ops">
						  <option value="Tablet">Tablet</option>
						  <option value="Syrup">Syrup</option>
						  <option value="Ayurvedic">Ayurvedic</option>
						  <option value="HealthCare">HealthCare</option>
						   <option value="BabyCare">BabyCare</option>
					</select>
                     <input type="submit" class="submit1" value="ADD MEDICINE">
                 </form>
                 <br/>
   </div>
   <form action="excel.jsp" method="post">
  <h3>Import to Add from .xlsx</h3>
 <input type="file" name="sample" class="btn btn-success"><br/>
<input type="submit" class="btn" value="Add File">
</form>
 </div>  

</body>
</html>
