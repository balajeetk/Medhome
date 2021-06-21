<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ page import ="java.util.Date" %>
 <%@ page import ="java.io.*" %>
  <%@ page import ="java.io.FileNotFoundException" %>
  <%@ page import ="java.io.IOException" %>
  <%@ page import ="java.util.Iterator" %>
   <%@ page import ="java.util.ArrayList" %>
   <%@ page import ="javax.servlet.http.HttpServletRequest"%>
   <%@page import="org.apache.poi.xssf.usermodel.*"%>
   <%@ page import ="org.apache.poi.xssf.usermodel.XSSFCell" %>
   <%@ page import ="org.apache.poi.xssf.usermodel.XSSFRow" %>
   <%@ page import ="org.apache.poi.xssf.usermodel.XSSFSheet" %>
   <%@ page import ="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
   <%@ page import ="org.apache.poi.poifs.filesystem.POIFSFileSystem" %>
 
  <%!     
  Connection con;
  PreparedStatement ps=null;
  Statement stmt= null;
  public static ArrayList readExcelFile(String fileName)
    {
     
       ArrayList cellArrayLisstHolder = new ArrayList();
       
      try{
        
            InputStream myInput = new FileInputStream(fileName);

      

        /* Create a workbook using the File System*/
        XSSFWorkbook myWorkBook = new XSSFWorkbook(myInput);

        /* Get the first sheet from workbook*/
         XSSFSheet mySheet = myWorkBook.getSheetAt(0);

        /* We now need something to iterate through the cells.*/
            Iterator rowIter = mySheet.rowIterator();
          while(rowIter.hasNext()){
            XSSFRow myRow = (XSSFRow) rowIter.next();
              Iterator cellIter = myRow.cellIterator();
            ArrayList cellStoreArrayList=new ArrayList();
               while(cellIter.hasNext()){
                  XSSFCell myCell = (XSSFCell) cellIter.next();
                  cellStoreArrayList.add(myCell);
              }
             cellArrayLisstHolder.add(cellStoreArrayList);
        }
       }catch (Exception e){e.printStackTrace(); }
       return cellArrayLisstHolder;
      }%>
      <%
      
        String file= request.getParameter("sample");
      
        String fileName="F:\\"+file; 
        
          
               ArrayList dataHolder=readExcelFile(fileName);
              

          try
               {
               Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost/medhome","root","");
                stmt =con.createStatement();
               String query="insert into products values(?,?,?,?,?,?,?,?,?)";

              ps=con.prepareStatement(query);
             int count=0;
          
           String str="";
           
            for(int i=1;i<dataHolder.size();i++) {
            	
               ArrayList<XSSFCell> cellStoreArrayList=(ArrayList<XSSFCell>)dataHolder.get(i);
               String a1=((XSSFCell)cellStoreArrayList.get(0)).toString();
               String a2=((XSSFCell)cellStoreArrayList.get(1)).toString();
               String a3=((XSSFCell)cellStoreArrayList.get(2)).toString();
               String a4=((XSSFCell)cellStoreArrayList.get(3)).toString();
               SimpleDateFormat formatter1=new SimpleDateFormat("MMM-YY");
               String a5=formatter1.format(((XSSFCell)cellStoreArrayList.get(4)).getDateCellValue());
               
               SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
               String dates=formatter.format(((XSSFCell)cellStoreArrayList.get(5)).getDateCellValue());
               String a7=((XSSFCell)cellStoreArrayList.get(6)).toString();
               String a8=((XSSFCell)cellStoreArrayList.get(7)).toString();
               String a9=((XSSFCell)cellStoreArrayList.get(8)).toString();
               ps.setString(1,a1);
               ps.setString(2,a2);
               ps.setString(3,a3);
               ps.setString(4,a4);
               ps.setString(5,a5);
               ps.setString(6,dates);
               FileInputStream fis;
               File image=new File(a7);
               fis=new FileInputStream(image);
               ps.setBinaryStream(7,(InputStream)fis,(int)(image.length()));
               ps.setString(8,a8);
               ps.setString(9,a9);
               
				
               count=ps.executeUpdate();
                 
                 
               }
                if(count>0)
                {
                	response.sendRedirect("http://localhost:8080/MedHome/admin.jsp");
                }
              
                    }catch(Exception e)
                 {out.print(e);}%>