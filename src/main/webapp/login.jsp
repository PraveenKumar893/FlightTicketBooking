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

input[type=text], input[type=password] {
  width: 63%;
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
  width: 62%;
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
body{
	background-image: url(image/254390.jpg);
	background-repeat: no-repeat;
	background-size: cover;

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
				<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIwMIGTutu1jpkhgNCLM-Rd2gz3d0MRSXuPw&usqp=CAU" alt="Avatar" class="avatar">
				</div>
				
				<div class="container">
				    <label for="username"><b>Username</b></label>
    <input type="text" id="username" placeholder="Enter Username" name="username"  required>
    
<b></b>

    <label for="password"><b>Password</b></label>
    <input type="password" id = "Password"  placeholder="Enter Password" name="password" required>
    
    <div style="text-align: center;color: white;font-family:cursive; font-style: inherit   ;font-size: 18px;">
    
        				 <p id = "loginresponse"></p>
    
    </div>

    <button type="submit"  onkeyup="validlogin()">Login</button>
    
    
    
    
   
				</div>
				
				<%
			
			String username = request.getParameter("username");
    		System.out.println("Username "+username);
			
			
			%>
			    
		<div class="container" style="background-color:#f1f1f1">
    <button type="button"  class="cancelbtn"><a href="FlightSearch.jsp" style="text-decoration: blink;">BACK</a></button>
     <a href="ForgetPassword.jsp?username=<%=username%>" class="btn btn-primary"  >Forget password?</a>
  </div>
  
  
  
  
  		               
  
		
   </form>
   </div>
      
   
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
		    
		    
		    function validlogin()
		    {
			    console.log("called");
		        let uname =document.getElementById("username").value;
		        let pass =document.getElementById("Password").value;

		        console.log(pass);

		        console.log(uname);
		   var url="Exceptionlogin.jsp?uname="+uname+'&Password='+pass;

	        console.log(url);

		    if(window.XMLHttpRequest){  
		    request=new XMLHttpRequest();  
		    }  
		    else if(window.ActiveXObject){  
		    request=new ActiveXObject("Microsoft.XMLHTTP");  
		    }  
		    try  
		    {  
		    request.onreadystatechange=getInfo;  
		    request.open("GET",url,true); 
		    request.send();
		    }  
		    catch(e)  
		    {  
		    alert("Unable to connect to server"); 
		    }
		        

		    }
		    
		    function getInfo()
		    {  
		    	if(request.readyState==4){  
		    	var loginresponse =request.responseText;  
		    	document.getElementById('loginresponse').innerHTML=loginresponse;  
		    	}  
		    }  

		
		    



		  

   </script>
   </main>
</body>
</html>