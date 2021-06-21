<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% 
String n1=request.getParameter("prdn");
String n[]=new String[3];
String date="";
String result_date="";
System.out.println(date);
if(n1!=null)
{
	n=n1.split("/");
	date=n[1].substring(0, 19);
	DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
	   Calendar cal=Calendar.getInstance(); 

       
       cal.setTime(dateFormat.parse(date));
       cal.add(Calendar.DAY_OF_MONTH,3);
       DateFormat dateFormat1=new SimpleDateFormat("dd-MM-yyyy");
       result_date=dateFormat1.format(cal.getTime());
      
}
System.out.println(n[0]+ date);
HttpSession usession=request.getSession(true);
   Object s1=usession.getAttribute("usern");
   String s2=(String)s1;
   String sts="";
   Blob image = null;
	 byte[] imgData = null;
   try
   {
    	 Class.forName("com.mysql.jdbc.Driver");
    	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
    	 String query="select * from carttb where uname='"+s2+"' and status!='no' and pname='"+n[0]+"' and date='"+date+"'";
    	 Statement st=con.createStatement();
    	 ResultSet rs=st.executeQuery(query);
    	 while(rs.next())
    	 {
    		 sts=rs.getString("status");
    	 }
    	 }
    	 catch(Exception e)
    	 {
    	 }
    	 System.out.println(sts);%>
<span id="snav">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="container"><section class="root">
  <figure>
    <img src="images/medx.PNG" style="width:170px;height:170px">
    <figcaption>
      <h4>Tracking Details</h4>
    </figcaption>
  </figure>
  <div class="order-track">
    <div class="order-track-step">
      <div class="order-track-status">
        <span class="order-track-status-dot" style="background: #f05a00"></span>
        <% if(sts.equals("shipped")||sts.equals("delivered"))
        {%>
        <span class="order-track-status-line" style="background:#f05a00 "></span>
        <% }
        else
        {%>
        <span class="order-track-status-line" style="background:white"></span>
        <%} %>
      </div>
      <div class="order-track-text">
        <p class="order-track-text-stat">Ordered</p>
        <span class="order-track-text-sub"></span>
      </div>
    </div>
    <div class="order-track-step">
      <div class="order-track-status">
      <% if(sts.equals("shipped")||sts.equals("delivered"))
        {%>
        <span class="order-track-status-dot" style="background:#f05a00"></span>
        <% }
        else
        {%>
        <span class="order-track-status-dot" style="background:white"></span>
        <%} %>
        
        <% if(sts.equals("delivered"))
        {%>
        <span class="order-track-status-line" style="background:#f05a00"></span>
        <% }
        else
        {%>
        <span class="order-track-status-line" style="background:white"></span>
        <%} %>
      </div>
      <div class="order-track-text">
        <p class="order-track-text-stat"> Shipped </p>
      </div>
    </div>
    <div class="order-track-step">
      <div class="order-track-status">
      <% if(sts.equals("delivered"))
        {%>
        <span class="order-track-status-dot" style="background:#f05a00"></span>
        <% }
        else
        {%>
        <span class="order-track-status-dot" style="background:white"></span>
        <%} %>
        <% if(sts.equals("delivered"))
        {%>
        <span class="order-track-status-line" style="background:#f05a00"></span>
        <% }
        else
        {%>
        <span class="order-track-status-line" style="background:white"></span>
        <%} %>
      </div>
      <div class="order-track-text">
      <% if(sts.equals("delivered"))
        {%>
                <p class="order-track-text-stat"> Delivered</p>
        

        <% }
        else
        {%>
                <p class="order-track-text-stat"> Estimated delivery</p>
        <span class="order-track-text-sub"><%=result_date %></span>

        <%} %>
      </div>
    </div>
  </div>
</section></div>
</div>
</span>