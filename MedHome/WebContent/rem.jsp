<%@page import="java.text.*"%>
<%@ page language="java" import="java.sql.*,java.util.Calendar" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>


<%
   DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
   Calendar cal=Calendar.getInstance();
   String current_date=dateFormat.format(cal.getTime());  
   
       String result_date="";
       
           cal.setTime(dateFormat.parse(current_date));
           cal.add(Calendar.DAY_OF_MONTH,15);
           result_date=dateFormat.format(cal.getTime());
           String str="";
           System.out.println(current_date+" "+result_date);
           try
           {
        	   Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
               Statement st=con.createStatement();
               String query1="SELECT * FROM products WHERE expirydate BETWEEN '"+current_date+"' AND '"+result_date+"'";
               ResultSet res = st.executeQuery(query1);
               
               
                 while(res.next())
                 {
                 	 
                	 String name=res.getString("name");
                	 String batchno=res.getString("batchno");
                	 System.out.println(name +" "+batchno);
                	 String query2="insert into expired values (?,?) ";
                	 PreparedStatement ps=con.prepareStatement(query2);
                	 ps.setString(1,name);
                	 ps.setString(2,batchno);
                	 int rs1=ps.executeUpdate();
                	 if(rs1>0)
                	 {
                		 String query3="delete from products where batchno="+batchno;
                		 Statement st1=con.createStatement();
                		 int rs2=st1.executeUpdate(query3);
                		 if(rs2>0)
                		 {
                			 response.sendRedirect("http://localhost:8080/MedHome/products.jsp");
                			 str="success";
                		 }
                		 
                		 
                	 }
                	 
                 	 
                 	  
                 }
                 if(str=="")
                 {
                	 response.sendRedirect("http://localhost:8080/MedHome/products.jsp");
                 }
                 
              
                 
              
             
              
              
              
           }
           
           catch(Exception e){System.out.print(e);}
           

%>