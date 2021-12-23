<%@page import="Models.Source"%>
<%@page import="Services.FlightService"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<%
String loggedInAsAdmin = (String) session.getAttribute("LOGGED_IN_ADMIN");
String loggedInAsUser = (String) session.getAttribute("LOGGED_IN_USER");

%>
    <style>
        body
        {
            background-image:url(image/254390.jpg);
            background-repeat: no-repeat;
            background-size: cover;

        }
    </style>
        <h1 style="text-align: center;"> WELCOME TO FLI-HY</h1>
         
            <form  id="form" action="SearchFlight" method="post"  style="text-align: center; color: black" >
           
              
              <input type="text"  style="position:relative; left:-234px; top: 90px; width: 250px;color: black; height: 35px; "
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
    
   <input type="text"  style="position: relative;left:-497px;top: 150px; width: 250px;color: black;height: 35px;"
              id="fightdestination" list="destination" name="destination">  
 <datalist id="destination">  
   <%
							 
			
				for (Source destination : Sourceinfo) {
					%>
					<option> <%=destination.getDestination()%> </option>
			<%}
%>
      
 </datalist>
              <input style="position: relative;left:-758px; top: 206px;width: 250px; height: 35px;"  type="date" name="date" min="2021-12-10" max="2022-10-26" ><br><br>
            <input style="position: relative; left: -502px; top: 205px;width: 250px; height: 35px;" type="search" id="tra"  onclick="input()" name = "search" 
            required placeholder="Traveelers"> <br><br>
            
            <select name="CLASS" id="clas"  style="position: relative;left:-431px; top: 207px; width: 250px;height: 35px;">
                <option value="Bussiness">CLASS</option>
                <option value="Bussiness">Business class</option>
                <option value="ECONOMY">ECONOMY</option>
                <option value="premium">PREMIUM ECONOMY</option>
              </select>
              
            
            <button style="position: relative;left:-600px;top: 270px;width: 140px;height: 29px; font-style: italic;  " type="submit"  >Submit </button><br><br>


	<%
			if (loggedInAsUser == null ) {
			%>
	
		<a href="login.jsp" style="position: relative;left:458px;top:-181px;width: 106px;height: 29px; font-style: italic;  " class="btn btn-primary"> Login </a> <br > <br /> 
 <a href="Register.jsp" style="position: relative;left:339px;top:-214px;width: 140px;height: 29px; font-style: italic;  " class="btn btn-primary"> Register </a> <br > <br /> 
 	<a href="GuestLogin.jsp" style="position: relative;left:360px;top:-267px;width: 140px;height: 29px; font-style: italic;  " class="btn btn-primary"> Guest Login </a> <br > <br /> 
 	
				<%}
				
			else {
				%>
				 <a href="login.jsp" style="position: relative;left:339px;top:-214px;width: 140px;height: 29px; font-style: italic;  " class="btn btn-primary"> LogOut </a> <br > <br /> 
 
				   <p id="loggedin" style="position: relative;left:950px;top:-214px;width: 140px;height: 29px; font-style: italic;  "> Logged in as <%=loggedInAsUser %></p>
				<%
			}
				
				
				%>
	
           	 <a href="FlightSearch" style="position: relative; left:-285px ;top: 113px;width: 240px;height: 28px; font-style: italic; " class="btn btn-primary">List All Flight Details</a>
           	 
           	 
   
            
        </form>
      
    
</body>
</html>