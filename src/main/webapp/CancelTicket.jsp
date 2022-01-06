<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@page import="com.FlightTicketReservationSystem.Models.Passenger_details"%>
    <%@page import="java.util.List"%>
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
		List<Passenger_details> objcancellist = (List<Passenger_details>)request.getAttribute("CancelList");
 
		%>
<%!
private static Date getcurrentdate()
{
	java.util.Date today = new java.util.Date();
	return new java.sql.Date(today.getTime());
}



%>
		
		
		
						 <p id = "dateresponse"></p>
		
		   		<table border="2">
			<h1><b>Flight List</b></h1>
			<thead>
				<tr>
				   <th >S.no</th>
					<th>Class Details</th>
					<th>MobileNumber</th>
					<th>Source</th>
					<th>Destination</th>
					<th>FlightID</th>
					<th>BookingDate</th>
					<th>TicketNo</th>
					<th>SeatNo</th>
					<th>Status</th>
					<th>CancelFlight</th>
					
					
					
					</tr>
			</thead>
			<br>
			<br>
			
			<tbody>
				<%
					int i = 0;
					for (Passenger_details objcancel : objcancellist) {
						i++;
				%>
				<tr>
				
					
					<td><%=i%></td>
					<td><%=objcancel.getClass_details()%></td>
					<td><%=objcancel.getMobile_number()%></td>
					
					<td><%=objcancel.getSource()%></td>
					
					<td> <%=objcancel.getDestination()%></td>
										<td> <%=objcancel.getFlight_id()%></td>
															<td><input type="hidden" id="date" > <%=objcancel.getArrival_date()%></td>
					
					<td> <%=objcancel.getTicketNo()%></td>
										
					
					<td> <%=objcancel.getSeatno()%></td>
					<td> <%=objcancel.getStatus()%></td>
					
					<!-- <td onclick="tableoption()"> </td> -->
					
					
	<td><a href="FlightCancellation.jsp?seatno=<%=objcancel.getSeatno()%>&Flightid=<%=objcancel.getFlight_id()%>&Departuredate=<%=objcancel.getArrival_date()%>
	&Class=<%=objcancel.getClass_details()%>"
		class="btn btn-primary" >CancelTicket</a></td>
							</tr>
					
				
							
							<%
				}
				%>
			
					</tbody>
		           </table>
			
			<script>
			
		    function tableoption()
		    {  
		    console.log("called");
		        let date=document.getElementById("date").value;
		       //var today = new Date();
               //var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();

		        console.log(date);
		    var url="Datecheck.jsp?date="+date;  
		    if(window.XMLHttpRequest){  
		    request=new XMLHttpRequest();  
		    }  
		    else if(window.ActiveXObject){  
		    request=new ActiveXObject("Microsoft.XMLHTTP");  
		    }  
		    try  
		    {  
		    request.onreadystatechange=getInfo;  
		    request.open("GET",url,true);  
		    request.send();  
		    }  
		    catch(e)  
		    {  
		    alert("Unable to connect to server");  
		    }
		        
		       }
		    
		    function getInfo(){  
		    	if(request.readyState==4){  
		    	var response =request.responseText;  
		    	document.getElementById('dateresponse').innerHTML=response;  
		    	}  
		    	}  


		    	
	 
		    

			
			
			
			
			
			</script>
		



</body>

</html>