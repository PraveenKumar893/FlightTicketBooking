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

button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 32%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 23%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

@media screen and (max-width: 300px) {
  span.psw {
    display: block;
    float: none;
  }
  .cancelbtn {
    width: 100%;
  }
}
a:link, a:visited {
  background-color: blue;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  background-color: red;
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
		
		<a href="FlightSearch.jsp"class="btn btn-primary" style="font-style: italic;"> Back </a> <br > <br />; 
		
		
				
				
					<div class="container">
					
													<form action="Payment" method="Get">
					
				
				    <label for="flightid"><b>Flight Id</b></label>
    <input type="text" id="flightid" name="flightid" value ="<%=flightid%>" readonly>
<br></br>
    <label for="ticketno"><b>Ticket No</b></label>
    <input type="text"  name="ticketno" value="<%=ticketno%>" readonly>
<br></br>
    <label for="amount"><b>Amount</b></label>
    <input type="text"  name="Amount" value="<%=amount%>" readonly>
    <br></br>
    
		<%
			if (loggedInAsUser.equalsIgnoreCase("Guest")) {
			%>
				      <label for="wallet"><b>Mode</b></label>
    
    <input type="radio" id="Creditcard" name="yesCheck" 
				value="Creditcard" onclick="yesnoCheck()" > 
				<label for="card" >Credit Card</label> 
				
				<input type="radio" id="Debitcard" name="yesCheck" value="Debitcard" onclick="dbcheck()" > 
				<label for="card" >Debitcard</label> 
				    <br>
				    <br>
				         		
				        				<button type="Submit"  required 
					>
				Register	</button>
				         		
				         		
				
				<% }
			else
			{
				%>
				      <label for="wallet"><b>Mode</b></label>
    
    <input type="radio" id="yesCheck" name="yesCheck" onclick="yesnoCheck()"
				value="Creditcard" > 
				<label for="card" >Credit Card</label> 
				
				<input type="radio" id="valuecheck" name="yesCheck"   onclick="dbcheck()" value="Debitcard"> 
				<label for="card" >Debitcard</label> 
				
                    				<input type="radio" id="Wallet" 
				name="yesCheck" value="Wallet"  > 
				<label
				for="Wallet" >Wallet</label>
				<br>
				<br>
				
								<button type="Submit"  required 
					>
				Register	</button>
				
				
                    
			<% }
			
			%>
				
			</form>
    		</div>
    		
    		
    		<div id="ifYes" style="visibility:hidden">
     <br></br>
         <label for="cardno"><b>Card No</b></label>
    <input type="text"  name="cardno"  min  = "0" pattern="[0-9]+" required>
    <br></br>
    
  
    <label for="cardtype"><b>Card Type</b></label>
    <input type="text"  name="cardtype" required >
<br></br>
    <label for="holdername"><b>Holder Name</b></label>
    <input type="text"  name="holdername" required >
    <br></br>
    
    <label for="bankname"><b>Bank Name</b></label>
    <input type="text"  name="bankname"  required>
    <br></br>
    
      <label for="expirydate"><b>Expiry Date</b></label>
    <input type="date"  name="expirydate" required >
    <br></br>
    
     <br></br>
   
				</div>
         		<div id="yes" style="visibility:hidden">
     <br></br>
         <label for="cardno"><b>Card No</b></label>
    <input type="text"  name="cardno"  min  = "0" pattern="[0-9]+" required>
    <br></br>
    
  
    <label for="cardtype"><b>Card Type</b></label>
    <input type="text"  name="cardtype" required>
<br></br>
    <label for="holdername"><b>Holder Name</b></label>
    <input type="text"  name="holdername" required>
    <br></br>
    
    <label for="bankname"><b>Bank Name</b></label>
    <input type="text"  name="bankname" required>
    <br></br>
    
      <label for="expirydate"><b>Expiry Date</b></label>
    <input type="date"  name="expirydate" required >
    <br></br>
    
     <br></br>
   
				</div>
     
     
				
   </form>
</div>
   </main>
   <script>
   function yesnoCheck() {
	   var credit = document.getElementById('ifYes');
	   if (credit.style.visibility === 'hidden') {
		   credit.style.visibility = 'visible';
		  } else {
			  credit.style.visibility = 'hidden';
		  }
  }   
   function dbcheck()
   {
	   var debit = document.getElementById('yes');
	   if (debit.style.visibility === 'hidden') {
		   debit.style.visibility = 'visible';
		  } else {
			  debit.style.visibility = 'hidden';
		  }

 

	   
	   
   }
   
   
/*    setTimeout(function(){
       window.location.href = 'FlightSearch.jsp';
    }, 100000);
 */
 </script>


</body>
</html>