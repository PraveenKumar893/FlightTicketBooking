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
	background-image: url("image/bg1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
     





		<%
String loggedInAsAdmin = (String) session.getAttribute("LOGGED_IN_ADMIN");
String loggedInAsUser = (String) session.getAttribute("LOGGED_IN_USER");

%>		
				<form  action="Loginservlet" method="post"  style="position: relative; left: 100px; height: 90px; top: 99px; width: 300px">
		
		

   <input type="text" name="username"
				placeholder="Enter User name" required
				autofocus  
				style="position: relative; left: 40px; height: 30px; top: 39px; width: 230px" />
			<br> 
			<input type="password" name="password"
				placeholder="Enter new password" required
				style="position: relative; left: 40px; height: 30px; top: 62px; width: 230px" />
				
			
								<button type="Submit" required
					style="position: relative; left: 40px; height: 30px; top: 110px; width: 230px">
                 	Login </button>
                 	
                 	
	
				
   </form>
</body>
</html>