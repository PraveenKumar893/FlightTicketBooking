<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Services.FlightService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
body {
	background-image: url(image/image_register.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
form {
  
  width:50%;
  align:"center";
  height:50%;
}
form {
 
  width:50%;
  align:"center";
}

/* Full-width inputs */
input[type=text], input[type=password],input[type=email],input[type=radio],input[type=tel] {
  width: 6%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

input[type=number] {
  width: 31%;
  left: 15%;
  padding: 2px 20px;
  margin: 3px 0;
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
  width: 25%;
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

</style>

<%
String loggedInAsAdmin = (String) session.getAttribute("LOGGED_IN_ADMIN");
String loggedInAsUser = (String) session.getAttribute("LOGGED_IN_USER");

FlightService flightService = new FlightService();
int Closingbalance = flightService.getclosingbalance(loggedInAsUser);

%>
    <jsp:include page="Header.jsp"></jsp:include>
    <main class="container-fluid">
    <h1 style="text-align: center;"> eWallet Deposit</h1>
        <div >
       
            <form  id="form" name ="amountvalid" action="Wallet" method="post"  onsubmit="return validation()" >
            <div class="container">
                  <label for="closingbalance"><b>Closing Balance</b></label>
                  <input type="number" name="closingbalance" value="<%=Closingbalance%>"
				 required autofocus readonly
				/>
			<br></br>
				 <label for="depositamount"><b>Deposit Amount</b></label>
			 <input type="number" id="depositamount" name="depositamount"  
				 required 
				 />
			<br></br>
			 <label for="confirmdepositamount"><b> Confirm Deposit Amount</b></label>
			 <input type="number" id="confirmdepositamount" name="confirmdepositamount"  
				 required 
				 />
				 <br></br>
				  <label for="mode"><b> Payment Mode</b></label>
				 <input type="radio" id="debit" name="debit"
				value="DebitCard" > 
				<label for="debit" >DebitCard</label> 
				
				<input type="radio" id="net" name="net" value="NetBanking"> 
				<label for="net" >Net Banking</label> 
				
				<br></br>
				<label for="bankname" style=" display: inline-block;">Select Bank</label>

<select name="bankname" id="bankname">
  <option value="hdfc">HDFC</option>
  <option value="sbi">SBI</option>
  <option value="standard">Standard Chartered Bank</option>
  <option value="icici">ICICI</option>
</select>

<br></br>
<div style="text-align: center">
				<button type="Submit"  required 
					>
				Submit	</button>
			</div>
			
            </div>
           </form>
            </div>
            </main>
            		   <script>
		    function validation()
		    {
		     var amount=document.amountvalid.depositamount.value 
		    var confirmamount = document.amountvalid.confirmdepositamount.value
		    if(amount==confirmamount)
		    {
                 return true;
                 
		    }
		    else 		    {
		        alert("Amount must be same!");  

		    return false;  

		    }
		}
		    	
	 
		    



		  

   </script>
            
</body>

</html>