<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Register</title>

</head>
<body>

	<style>
body {
	background-image: url(image/bg7.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

			<h1 style="text-align: center;">
				<b>New user Registration</b></h1>
		<form name="RegisterForm" action="FlightRegister" method="post" onsubmit="return validation()" >
			
			<br /> <input type="text" name="name" pattern="[A-Za-z]{3,20}" 
				placeholder="Enter name" required autofocus
				style="position: relative; left: 40px; height: 30px; top: -2px; width: 230px" />
				
			<br> <input type="email" id="email" name="email" pattern = "[a-zA-z][A-Za-z0-9]+[@][a-zA-Z]+[.][A-Za-z]{2,3}" 
				placeholder="Enter email address" required 
				style="position: relative; left: 41px; height: 33px; top: 17px; width: 228px" />
			
			
			<br> <input type="text" name="username"
				pattern="[A-Za-z\s]{3,8}"  placeholder="Enter User name" required
				autofocus  
				style="position: relative; left: 40px; height: 30px; top: 39px; width: 230px" />
				<br>
				
				<input type="password" name="password"placeholder="Enter new password" required
				style="position: relative; left: 40px; height: 30px; top: 62px; width: 230px" />
				
			<br> <input type="password" name="password1"
				placeholder="Confirm Password " required
				style="position: relative; left: 40px; height: 30px; top: 77px; width: 230px" /><br>
				
			<input type="radio" id="Male" name="Gender"
				value="Male" style="position: relative; left: -61px;height: 15px; top: 99px;width: 220px"> 
				<label for="Male" style="position: relative;left: -159px;height: 36px; top: 99px;width: 230px">MALE</label> 
				
				<input type="radio" id="Female" name="Gender" value="Female"style="position: relative; left: -230px;height: 15px; top: 100px;width: 220px"> 
				<label for="Female" style="position: relative;left: -325px;height: 36px; top: 99px;width: 230px">FEMALE</label> 
				<input type="radio" id="Others"
				name="Gender" value="Others" style="position: relative;left: -365px;height: 18px; top: 104px;width: 230px"> <label
				for="Others" style="position: relative;left: -440px;height: 23px; top: 100px;width: 230px">OTHERS</label>


               		 <input type="tel" id="phoneNumber" name="phoneNumber" pattern = "[6-9][0-9]{9}" 
				 placeholder="Enter Mobile Number" required  
				style="position: relative; left: -846px; height: 30px; top: 135px; width: 230px" />
				
				
			<br> 
               



			<div style="text-align: center">
				<button type="Submit"  required 
					style="position: relative; left: 40px; height: 30px; top: 110px; width: 230px">
				SIGNUp	</button>
			</div>
		</form>
		   <script>
		    function validation()
		    {
		     var password=document.RegisterForm.password.value 
		    var password1 = document.RegisterForm.password1.value
		    if(password==password1)
		    {
                 return true;
                 
		    }
		    else 		    {
		        alert("password must be same!");  

		    return false;  

		    }
		}
		    



		  

   </script>
   							    
   </main>
		
</body>
</html>