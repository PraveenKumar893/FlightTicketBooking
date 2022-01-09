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
	background-image: url(image/images_login.jpg);
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

</style>

			
			<main class="container-fluid">
		<h3 align="center">New User Registration Form </h3>
		<div align="center">	
		<form name="RegisterForm" action="FlightRegister" method="post"  >
		
		<div class="container">
			
			<br /> <input type="text" name="name" pattern="[A-Za-z]{3,20}" 
				placeholder="Enter name" required autofocus
				/>
				<br>
				
			<br> <input type="text"  id="email" name="email" onkeyup="sendemail()" 
				placeholder="Enter email address" style="position: relative;top: -8px" required/>	
				  
				 	
				<br>
				 
			
			
			<br> <input type="text" id="username" name="username"onkeyup="validemail()"  
				pattern="[A-Za-z\s]{3,8}"  placeholder="Enter User name" style="position: relative;top: -10px"  required
				autofocus  
				/>	<br>			 
				
			
				<br>
				
				
				<input type="password" name="password"placeholder="Enter new password" onkeyup="validuser()" 
					style="position: relative;top: -8px"
				required
				/><br>
				<br>
				
				
			<br> <input type="password" name="password1"style="position: relative;top: -25px"
				required  placeholder="Confirm Password " 
				 /><br>
				<br>
				


               		 <input type="tel" id="phoneNumber" name="phoneNumber" pattern = "[6-9][0-9]{9}" 
				 placeholder="Enter Mobile Number" style="position: relative;top: -25px" required  onkeydown="return validation()"
				 />
				
				
			<br> 
			
						<input type="radio" id="Male" name="Gender"
				value="Male"  onkeyup="phonenumber()"> 
				<label for="Male" >Male</label> 
				
				<input type="radio" id="Female" name="Gender" value="Female"> 
				<label for="Female" >Female</label> 
				<input type="radio" id="Others"
				name="Gender" value="Others" > <label
				for="Others" >Others</label>
			
            



			<div style="text-align: center">
				<button type="Submit"  style="position: relative;top: 4px" required     " 
					>
				Register	</button>
			</div>
		 <p  id = "emailresponse"></p> 
			<p id="validresponse" ></p>
			
			<p id = "userresponse"></p>
						<p id = "phoneresponse"></p>
			
			
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
		    
		    function sendemail()
		    {  
		    console.log("called");
		        let email=document.getElementById("email").value;

		        
		        console.log(email);

		    var url="Exception.jsp?email="+email;  
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
		    
		    function getInfo(){  
		    	if(request.readyState==4){  
		    	var response =request.responseText; 
		    	console.log(response);
		    	document.getElementById('emailresponse').innerHTML=response; 
		    	console.log("cjngchgc"+response);

		    	}  
		    	}  

		    function validemail()
		    {  
		    console.log("called");
		        let email=document.getElementById("email").value;

		        console.log(email);

		    var url="validemail.jsp?email="+email;  
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
		    
		    function getInfo(){  
		    	if(request.readyState==4){  
		    	var response =request.responseText;  
		    	document.getElementById('validresponse').innerHTML=response;  
		    	//alert(response);
		    	}  
		    	}  
		    function validuser()
		    {  
		    console.log("called");
		        let username=document.getElementById("username").value;
		        console.log(username);
		    var url="validusername.jsp?username="+username;  
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
		    
		    function getInfo(){  
		    	if(request.readyState==4){  
		    	var response =request.responseText;  
		    	document.getElementById('userresponse').innerHTML=response;  
		    	}  
		    	}  
		    
		    function phonenumber()
		    {
			    console.log("called");
		        let phoneno = document.getElementById("phoneNumber").value;

		        console.log(phoneno);

		    var url="phone.jsp?phoneno="+phoneno;  
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
		    
		    function getInfo(){  
		    	if(request.readyState==4){  
		    	var response =request.responseText;  
		    	document.getElementById('phoneresponse').innerHTML=response;  
		    	//alert(response);
		    	}  
		    	}  


		    



		    	
	 
		    



		  

   </script>
   							    
   </main>
		
</body>
</html>