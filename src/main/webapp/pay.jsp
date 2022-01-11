<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment JSP</title>
</head>
<body>
    		    		<div id="master">
    		    <form action="Payment" method="get" class="container" >
    		    
    		    
  
        <label for="cardno"><b>Card No</b></label>
        <input type="text"  name="cardno"  min  = "0" max = "16" pattern="[0-9]+" required style="margin-left: 60px; height: 35px">
        <br></br>
        
      
        <label for="cardtype"><b>Card Type</b></label>
        <input type="text"  name="cardtype" required style="margin-left: 51px;height: 35px" >
    <br></br>
        <label for="holdername"><b>Holder Name</b></label>
        <input type="text"  name="holdername" required style="margin-left: 33px;height: 35px">
        <br></br>
        
        <label for="bankname"><b>Bank Name</b></label>
        <input type="text"  name="bankname"  required style="margin-left: 46px;height: 35px">
        <br></br>
        
          <label for="expirydate"><b>Expiry Date</b></label>
        <input type="date"  name="expirydate" required style="margin-left: 132px;height: 35px" >
        <br></br>
        
         <br></br>
				
       							<button type="Submit"><a href="FlightSearch.jsp">
					
				SUBMIT</a>	</button>
       
    
    </form>
</div>


</body>
</html>