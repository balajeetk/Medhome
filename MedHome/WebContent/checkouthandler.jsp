<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection,java.io.File,java.io.InputStream,java.io.FileInputStream,java.sql.DriverManager,java.sql.Statement,java.sql.ResultSet,java.util.*,java.text.*,java.lang.Class"%>
<%@page import="com.twilio.Twilio,com.twilio.rest.api.v2010.account.Message,com.twilio.type.PhoneNumber"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>MedHome</title>
<style>
	.razorpay-payment-button {display:none;}

</style>
<script type="text/javascript">
		    $(document).ready(function(){
		    	 $('.razorpay-payment-button').click();
		    });
</script>
</head>
<body>
<% 
    String amt=request.getParameter("amt");
    int total=Integer.parseInt(amt)*100;
    System.out.println(total);
%>
		<form action="myord.jsp" method="POST">
		<script    
		src="https://checkout.razorpay.com/v1/checkout.js"    
		data-key="rzp_test_X4DvCZokjPZZlS" 
		data-amount=<%=total %>
		data-currency="INR"
		data-id="12345"   
		data-buttontext="Pay with Razorpay"    
		data-name="MedHome"    
		data-description=""    
		data-image="images/medx.PNG"    
		data-prefill.name=""    
		data-prefill.email=""    
		data-theme.color="#F37254">
		</script>
		<input type="hidden" custom="Hidden Element" name="hidden">
		</form>
<% 
HttpSession usession=request.getSession(true);
Object s1=usession.getAttribute("usern");
String s2=(String)s1;
String s3="";
DateFormat dateFormat=new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
Calendar cal=Calendar.getInstance();
String current_date=dateFormat.format(cal.getTime()); 
System.out.println(current_date);
	int count=0;
	try
	   {
	    	 Class.forName("com.mysql.jdbc.Driver");
	    	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
	 		    String query1="UPDATE carttb SET status='ordered',date='"+current_date+"' WHERE uname='"+s2+"' and status='no'";
	 		    String query2="select contact from user_details where uname='"+s2+"'";
	 		    PreparedStatement ps=con.prepareStatement(query1);
				ps.executeUpdate();
				PreparedStatement ps1=con.prepareStatement(query2);
				ResultSet rs=ps1.executeQuery();
				while(rs.next())
				{
					s3=rs.getString("contact");
				}
	    	 
	   
	String ACCOUNT_SID = "AC4aec21cf7eb9e83204b09ba4406f9267";
    String AUTH_TOKEN = "5e983d18ddb3f7aa5791367e8ec4ea63";

  
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message message = Message.creator(
                new com.twilio.type.PhoneNumber("+91"+s3),
                new com.twilio.type.PhoneNumber("+12678632079"),
                "Your Order has been Successfully Placed.Thanks for choosing MedHome"
                
        		)
            .create();

	   }
	   catch(Exception e){System.out.print(e);}
%>	
		

</body>
</html>






   
