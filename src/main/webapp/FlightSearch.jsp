<%@page import="Models.Source"%>
<%@page import="Services.FlightService"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="Assets/css/bootstrap.min.css">
<link rel="stylesheet" href="Assets/css/fontawesome.min.css">
<link rel="stylesheet" href="Assets/css/style.css">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<style>

body {
background-image: url(image/bg9.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	
	font-family: Arial, Helvetica, sans-serif;
	align:"center";
	
}



form {
left:40px;
 height:40%;
  width:30%;
  align:"center";
}

/* Full-width inputs */
input[type=text], input[type=date] {
  width: 63%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 62%;
}

/* Add a hover effect for buttons */
button:hover {
  opacity: 0.8;
}
</style>
<%
String loggedInAsAdmin = (String) session.getAttribute("LOGGED_IN_ADMIN");
String loggedInAsUser = (String) session.getAttribute("LOGGED_IN_USER");

%>
 <jsp:include page="Header.jsp"></jsp:include>
        <h1 style="text-align: center;"> Welcome to Flight Reservation System</h1>
        <div >
            <form  id="form" action="SearchFlight" method="post"  style="text-align: center; color: black; left:40px;" >
           
              
              <input type="text"  
              id="fightsource" list="source" name="source">  
 <datalist id="source">  
   <%
				
				FlightService flightService = new FlightService();
				List<Source> Sourceinfo = flightService.getsource();
				
				
				for (Source source : Sourceinfo) {
					%>
					<option> <%=source.getSource()%> </option>
			<%}
%>
      
 </datalist>
    
   <input type="text"  
              id="fightdestination" list="destination" name="destination">  
 <datalist id="destination">  
   <%
							 
			
				for (Source destination : Sourceinfo) {
					%>
					<option> <%=destination.getDestination()%> </option>
			<%}
%>
      
 </datalist>
              <input  type="date" name="date" min="2021-12-10" max="2022-10-26" ><br><br>
          
            
            <button  type="submit"  >Submit </button><br><br>


	
	
           	 <a href="FlightSearch"  class="btn btn-primary">List All Flight Details</a>
           	 
           	 
   
            
        </form>
      
    
    </div>
</body>
</html>