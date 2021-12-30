<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Screen</title>
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
  border: 3px solid #f1f1f1;
  width:30%;
  align:"center";
}

/* Full-width inputs */
input[type=text], input[type=password] {
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
String loggedInAsAdmin = (String) session.getAttribute("LOGGED_IN_ADMIN");
String loggedInAsUser = (String) session.getAttribute("LOGGED_IN_USER");
String error  = (String) session.getAttribute("Error");
%>		
<main class="container-fluid">
		<h3 align="center">Login</h3>
		<div align="center">
				<form  action="Loginservlet"  method="post"  >
				
				<div class="imgcontainer">
				<img src="image/images.jpg" alt="Avatar" class="avatar">
				</div>
				
				<div class="container">
				    <label for="username"><b>Username</b></label>
    <input type="text" id="username" placeholder="Enter Username" name="username" required>
<b></b>
    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>

    <button type="submit">Login</button>
   
				</div>
				
				<%
			
			String username = request.getParameter("username");
			
			
			%>
			    
		<div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
     <a href="ForgetPassword.jsp?username=<%=username %>" class="btn btn-primary" onclick="return validation()" >Forget password?</a>
  </div>
  
  
  
  
  		               
  
		
   </form>
   </div>
   <% 
      	if(error!=null){%>
      		        <p><%= session.getAttribute("Error")%> </p>

      	<%} %>

        <% session.removeAttribute("Error");%>
   
   
     <script>
		    function validation()
		    {
		    	let username = document.getElementById("username").value;
		    	
		    	
		    if(username == "")
		    {
		    	 alert("Please enter the username");  

                 
		    }
		    else 	
		    {
		    	return true;
		    }
		         

		    return false;  

		    }
		
		    



		  

   </script>
   </main>
</body>
</html>