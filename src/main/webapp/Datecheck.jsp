<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*"%> 
    <%@page import="java.io.PrintWriter"%>
        <%@ page import="java.time.LocalDate"%> 
                <%@ page import="java.sql.Date"%> 
                
                
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String datevalue =request.getParameter("date"); 
//LocalDate local = LocalDate.parse(datevalue);
try
{  
	System.out.println("mtehdj");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
PreparedStatement ps=con.prepareStatement("select * from passenger_details where booking_date >= ?");  
//ps.setDate(1,java.sql.Date.valueOf(local));  

ps.setDate(1,getcurrentdate() );;
System.out.println(getcurrentdate());

ResultSet rs=ps.executeQuery();  
if(rs.next())
{
	System.out.println("122122");

	PrintWriter Write = response.getWriter();
   Write.println("Not to Cancel the flight ");
} 
}
catch(Exception e)
{
	e.printStackTrace();  
	System.out.println("jdhsdhs");
	System.out.println(e);

}



%>
<%!
private static Date getcurrentdate()
{
	java.util.Date today = new java.util.Date();
	return new java.sql.Date(today.getTime());
}



%>




</body>
</html>