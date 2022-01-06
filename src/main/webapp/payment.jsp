<%@page import="com.FlightTicketReservationSystem.Models.Source"%>
<%@page import="Services.FlightService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Page</title>
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
  
  width:50%;
  align:"center";
}

/* Full-width inputs */
input[type=text] {
  width: 40%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
 input[type=radio] {
  width: 10%;
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
  width: 32%;
}

/* Add a hover effect for buttons */
button:hover {
  opacity: 0.8;
}

/* Extra style for the cancel button (red) */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the avatar image inside this container */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

/* Avatar image */
img.avatar {
  width: 23%;
  border-radius: 50%;
}

/* Add padding to containers */
.container {
  padding: 16px;
}

/* The "Forgot password" text */
span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
    display: block;
    float: none;
  }
  .cancelbtn {
    width: 100%;
  }
}
</style>
<%
String loggedInAsUser = (String) session.getAttribute("LOGGED_IN_USER");
String role = (String)session.getAttribute("ROLE");
String flightid=  (String)request.getAttribute("Flight_ID");
String ticketno	=  (String)request.getAttribute("Ticket_no");
String amount=  (String)request.getAttribute("Amount");


%>




   <main class="container-fluid">
		<h3 align="center">Payment Details </h3>
		<div align="center">
				<form  action="Payment" method="post" >
				
				
				
				    <label for="flightid"><b>Flight Id</b></label>
    <input type="text" id="flightid" name="flightid" value ="<%=flightid%>" readonly>
<br></br>
    <label for="ticketno"><b>Ticket No</b></label>
    <input type="text"  name="ticketno" value="<%=ticketno%>" readonly>
<br></br>
    <label for="amount"><b>Amount</b></label>
    <input type="text"  name="Amount" value="<%=amount%>" readonly>
    <br></br>
    
		<div>
		<%
			if (loggedInAsUser.equalsIgnoreCase("Guest")) {
			%>
				      <label for="wallet"><b>Mode</b></label>
    
    <input type="radio" id="Creditcard" name="mode" 
				value="Creditcard" > 
				<label for="card" >Credit Card</label> 
				
				<input type="radio" id="Debitcard" name="mode" value="Debitcard" > 
				<label for="card" >Debitcard</label> 
				
				<% }
			else
			{
				%>
				      <label for="wallet"><b>Mode</b></label>
    
    <input type="radio" id="yesCheck" name="yesCheck" onclick="yesnoCheck()"
				value="Creditcard" > 
				<label for="card" >Credit Card</label> 
				
				<input type="radio" id="valuecheck" name="valuecheck"   onclick="yesnoCheck()" value="Debitcard"> 
				<label for="card" >Debitcard</label> 
				
                    				<input type="radio" id="Wallet" 
				name="yesCheck" value="Wallet"  > <label
				for="Wallet" >Wallet</label>
                    
			<% }
			
			%>
			
    		</div>
    		
    		<div id="ifYes" style="visibility:hidden">
     <br></br>
         <label for="cardno"><b>Card No</b></label>
    <input type="text"  name="cardno" readonly>
    <br></br>
    
  
    <label for="cardtype"><b>Card Type</b></label>
    <input type="text"  name="cardtype" readonly>
<br></br>
    <label for="holdername"><b>Holder Name</b></label>
    <input type="text"  name="holdername" readonly>
    <br></br>
    
    <label for="bankname"><b>Bank Name</b></label>
    <input type="text"  name="bankname" readonly>
    <br></br>
    
      <label for="expirydate"><b>Expiry Date</b></label>
    <input type="date"  name="expirydate" readonly>
    <br></br>
    
     <br></br>
    <button type="submit"><a href="FlightSearch.jsp">PAY</a></button>
   
				</div>
     
				
   </form>

   </main>
   <script>
   function yesnoCheck() {
	    if (document.getElementById('yesCheck').checked) 
	    {
	        document.getElementById('ifYes').style.visibility = 'visible';
	    }
	    else if(document.getElementById('valuecheck').checked)
	    	{
	         document.getElementById('ifYes').style.visibility = 'visible';
	    	}
	}   
   
   
   setTimeout(function(){
       window.location.href = 'FlightSearch.jsp';
    }, 10000);
</script>


</body>
</html>