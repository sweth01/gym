<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Login</title>
<link rel = "stylesheet" href = "style.css">
<link rel = "stylesheet" href = "admin_style.css">
<style>



</style>
</head>

<body style="background-color: darkgrey;">
<jsp:include page="header.jsp"></jsp:include>

	<div class = "main_wrapper">
	
		
		
		<div id = "menubar">
		
			<ul id = "menu">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="register.jsp">Sign Up</a></li>
			
			
			
			<li><a href="contact_us.jsp">Contact Us</a></li>
			
			</ul>
			
			
		
		</div>
		
		</div>


<div id = "content_wrapper_admin">

	<div id = "content_area_admin">

	<form method = "post" action = "CustomerLogin" >
	
		<br / >
		<table height = "auto" width = "500" align = "center" bgcolor = "silver">
		
		
			<tr align = "center">
			
				<td bgcolor = "grey" colspan = "4"><h2>Customer Login</h2></td>
			
			</tr>
			<tr>
				<td align = "right"><b>Username: </b></td>
				<td><input type = "text" name="name" placeholder = "enter your username..."/></td>
			
			</tr>
			<tr>
			<td  align = "right"><b>Password:</b> </td>
			<td><input type = "password" name="pass" placeholder = "enter your password..."/></td>
			</tr>
		
			<tr align= "center">
			
			<td colspan = "4"><input type = "submit"  value = "Login"></td>
			
			
			
			</tr>
			<tr  align= "center"><td colspan = "4"><a href = "reset_password.jsp">Forgot password?</a></td></tr>
			<tr align = "center" >
				<td  colspan = "3"><a class = "login2" color:blue;"  href = "register.jsp"><h3>New? Register Here</h3></a></td>
			
			</tr>
			
		
		
		</table>
	
	
	
	</form>
	
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
	

</body>
</html>