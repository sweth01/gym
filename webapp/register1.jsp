<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registration</title>
    <link rel = "stylesheet" href = "style.css">
    <link rel = "stylesheet" href = "admin_style.css">
</head>

<body style="background-color: darkgrey;">

<jsp:include page="header.jsp"></jsp:include>
<div class = "main_wrapper">

    <div id = "menubar">

        <ul id = "menu">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="login.jsp">Login</a></li>


            <li><a href="contact_us.jsp">Contact Us</a></li>

        </ul>
    </div>

</div>


<div id = "content_wrapper_admin">

    <div id = "content_area_admin">

        <form  action ="RegisterServlet" method =  "post">

            <table height = "auto" width = "500" align = "center" bgcolor = "silver">

                <tr  align = "center">
                    <td bgcolor = "grey" colspan =  "6"><h2>Create an Account!</h2></td></tr>
                <tr>
                    <td align = "right">Customer Name: </td>
                    <td><input type = "text" name = "name"></td>
                </tr>

                <tr>
                    <td align = "right">Customer E-mail: </td>
                    <td><input type = "email" name = "email"></td>
                </tr>
                <tr>
                    <td align = "right">Password: </td>
                    <td><input type = "password" name = "pass"></td>
                </tr>
                <tr>
                    <td align = "right">Contact Number: </td>
                    <td><input type = "text" name = "phone"></td>
                </tr>
                <tr>
                    <td align = "right">Address: </td>
                    <td><textarea name = "address"></textarea></td>
                    
                </tr>
                
                  <tr>
                    <td align = "right">Select User Type: </td>
                    <td>
                    	<select name="user_role" >
				            <option value="Administrator">Administrator</option>
				            <option value="Receptionist">Receptionist</option>
				            <option value="Trainer">Trainer</option>
				            <option value="Member">Member</option>
      					  </select>
                    </td>
                    
                </tr>
                
                <br />

                <tr align = "center">

                    <td colspan = "5"><input type = "submit" name = "register" value = " Create Account"></td>
                </tr>
            </table>


        </form>
    </div >
    <div><jsp:include page="footer.jsp"></jsp:include></div>
</div>

</body>
</html>





