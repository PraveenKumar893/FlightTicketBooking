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
	background-image: url(image/image_register.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
form {
  border: 3px solid #f1f1f1;
  width:30%;
  align:"center";
}
form {
  border: 3px solid #f1f1f1;
  width:30%;
  align:"center";
}

/* Full-width inputs */
input[type=text], input[type=password],input[type=email],input[type=radio],input[type=tel] {
  width: 63%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

input[type=radio] {
  width: 18%;
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

			
			<main class="container-fluid">
		<h3 align="center">New User Registration Form </h3>
		<div align="center">	
		<form name="RegisterForm" action="FlightRegister" method="post" onsubmit="return validation()" >
		
		<div class="container">
			
			<br /> <input type="text" name="name" pattern="[A-Za-z]{3,20}" 
				placeholder="Enter name" required autofocus
				/>
				
			<br> <input type="email" id="email" name="email" pattern = "[a-zA-z][A-Za-z0-9]+[@][a-zA-Z]+[.][A-Za-z]{2,3}" 
				placeholder="Enter email address" required 
				 />
			
			
			<br> <input type="text" name="username"
				pattern="[A-Za-z\s]{3,8}"  placeholder="Enter User name" required
				autofocus  
				/>
				<br>
				
				<input type="password" name="password"placeholder="Enter new password" required
				/>
				
			<br> <input type="password" name="password1"
				placeholder="Confirm Password " required
				 /><br>
				
			<input type="radio" id="Male" name="Gender"
				value="Male" > 
				<label for="Male" >Male</label> 
				
				<input type="radio" id="Female" name="Gender" value="Female"> 
				<label for="Female" >Female</label> 
				<input type="radio" id="Others"
				name="Gender" value="Others" > <label
				for="Others" >Others</label>


               		 <input type="tel" id="phoneNumber" name="phoneNumber" pattern = "[6-9][0-9]{9}" 
				 placeholder="Enter Mobile Number" required  
				 />
				
				
			<br> 
               



			<div style="text-align: center">
				<button type="Submit"  required 
					>
				Register	</button>
			</div>
			</div>
		</form>
		  </div>
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