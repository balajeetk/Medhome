
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.util.*,java.text.*,java.lang.Class"%>
  <%@page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.util.*,java.text.*,java.lang.Class"%>
    


    
   
 <%


String pname=request.getParameter("param");
System.out.println(pname);
System.out.println(pname);
HttpSession usession=request.getSession(true);
Object s1=usession.getAttribute("usern");
String s2=(String)s1;
try
   {
    	 Class.forName("com.mysql.jdbc.Driver");
    	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
    	 String query="select * from products where name='"+pname+"'";
    	 Statement st=con.createStatement();
    	 ResultSet rs=st.executeQuery(query);
    	 Blob image = null;
		 byte[] imgData = null;
		 DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		   Calendar cal=Calendar.getInstance();
		   String current_date=dateFormat.format(cal.getTime());  
    	 while(rs.next())
    	 {
    		
    		 Blob  blob=rs.getBlob("image");
 		 	String name=rs.getString("name");
 		 	String qty="1";
 		 	String rte=rs.getString("rate");
 		    String query1="insert into carttb values(?,?,?,?,?,?,?)";
 		    PreparedStatement ps=con.prepareStatement(query1);
			ps.setString(1,s2);
			ps.setString(2,name);
			ps.setBlob(3,blob);
			ps.setString(4,qty);
			ps.setString(5,rte);
			ps.setString(6,"no");
			ps.setString(7,null);
			ps.executeUpdate();
    		 
    	 
    	}
    	 
   }
   catch(Exception e){System.out.print(e);}
   
   %>
</body>
</html>