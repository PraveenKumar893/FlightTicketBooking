<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.FlightTicketReservationSystem.Models.Flight"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FLIGHT LIST</title>
</head>
<style>
a:link, a:visited {
  background-color: white;
  color: black;
  border: 2px solid green;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  background-color: blue;
  color: white;
}




</style>
<body>


<%  
		List<Flight> regobject = (List<Flight>)request.getAttribute("Flight");
 
		%>
	
   		<table border="2">
			<h1><b>Flight List</b></h1>
			<thead>
				<tr>
				   <th >S.no</th>
					<th>Registered Name</th>
					<th>Email_id</th>
					<th>User_name</th>
					<th>Password</th>
					<th>Gender</th>
					<th>Phone Number</th>
					<th>Registered_Date</th>
					</tr>
			</thead>
			<br>
			<br>
			<tbody>
				<%
					int i = 0;
					for (Flight register : regobject) {
						i++;
				%>
				<tr>
				
					
					<td><%=i%></td>
					<td><%=register.getName()%></td>
					<td><%=register.getEmailid()%></td>
					<td><%=register.getUsername()%></td>
					<td><%=register.getPassword()%></td>
					
					<td> <%=register.getGender()%></td>
					<td> <%=register.getPhonenumber()%></td>
					<td> <%=register.getRegisterDate()%></td>
					
			</tr>
					
					<%
				}
				%>
					</tbody>
		           </table>
			

</body>
</html>