<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>

<%@page import="com.gym.CustomerModel"%>

<%@page import="java.util.*"%>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>REGISTER</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
   
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
   
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700">
    
    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.css">
    
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    
    <link rel="stylesheet" href="css/custom.css">
    
    <link rel="shortcut icon" href="favicon.png">
    <style>
    
    .box {
        background: red;
    }
    </style>
   
  </head>
  <%@include file="header.jsp"%>
  <body>
 <br>
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li aria-current="page" class="breadcrumb-item active">Update Member details / Sign in</li>
                </ol>
              </nav>
            </div>
            
            
            
            
            
            <div class="col-lg-6 text-lg-left">
              <div class="box">
                <h1>Update Member details</h1>
                
                 <% 
                 
					System.out.println(request.getParameter("uid"));
			        long id= Long.parseLong(request.getParameter("uid"));
                 	Class.forName("com.mysql.jdbc.Driver");
				    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "chennai123");
				    			    
				        Statement st=con.createStatement();
				        ResultSet rs=st.executeQuery("select *  from users where user_id='"+id+"'");
				    rs.next();
				   System.out.println(rs.getString(1));
				   
				  CustomerModel customer = new CustomerModel();
		    		customer.setName(rs.getString("user_name"));
		    		customer.setEmail(rs.getString("user_email"));
		    		customer.setPassword(rs.getString("user_password"));
		    		customer.setPhone(rs.getString("user_phone"));
		    		customer.setAddress(rs.getString("user_address"));
		    		customer.setUserRole(rs.getString("user_role"));
		    		customer.setId(rs.getLong("user_id"));
				        
   				%>
    
                <form action ="RegisterServlet" method =  "post">
                
                  <div>
                    <label for="name">Name</label>
                    <input name="name" type="text" value="<%=rs.getString("user_name")%>">
                  </div>
                  
                  
                  <div>
                    <label for="email">Email</label>
                    <input name="email" type="email" value="<%=rs.getString("user_email")%>">
                  </div>
                  
                  
                  <div>
                    <label for="pass">Password</label>
                    <input name="pass" type="password" value="<%=rs.getString("user_password")%>">
                  </div>
                  
                  
                    <div>
                    <label for="address">Address</label>
                    <input name="address" type="text" value="<%=rs.getString("user_address")%>">
                  </div>
                  
                  <div>
                    <label for="number">Mobile</label>
                    <input name="number" type="text" value="<%=rs.getString("user_phone")%>">
                  </div>
                  
                   <div>
                    <label for="user_role">Select User Type:</label>
                    
              
                    <select name="user_role" value="<%=rs.getString("user_role")%>">
				            <option value="Administrator" <%= "Administrator".equals(rs.getString("user_role")) ? "selected" : "" %> >Administrator</option>
				            <option value="Receptionist" <%= "Receptionist".equals(rs.getString("user_role")) ? "selected" : "" %>>Receptionist</option>
				            <option value="Trainer" <%= "Trainer".equals(rs.getString("user_role")) ? "selected" : "" %>>Trainer</option>
				            <option value="Member" <%= "Member".equals(rs.getString("user_role")) ? "selected" : "" %>>Member</option>
    				</select>
    				
    				 <div>
                    <input name="user_id" type="hidden" value="<%=rs.getString("user_id")%>">
                  </div>
                  
                  </div>
                  </br>
                  
                   <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe"> <br>
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444"><br>
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">
            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>
          
        </div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
        </label>
                  
                 
                  <input type = "submit" name = "register" value = " Update">
                </form>
              </div>
             </div>
          
        </div>
      </div>
    </div>
    
    <%@include file="footer.jsp"%>
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
    <script src="js/front.js"></script>
  </body>
</html>