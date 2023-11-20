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
                  <li aria-current="page" class="breadcrumb-item active">New account / Sign in</li>
                </ol>
              </nav>
            </div>
            
            
            
            
            
            <div class="col-lg-6 text-lg-center">
              <div class="box">
                <h1>New account</h1>
                <p class="lead">Not our registered customer yet?</p>
                <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p>
                <hr>
                <form action ="RegisterServlet" method =  "post">
                
                  <div class="form-group">
                    <label for="name">Name</label>
                    <input name="name" type="text" >
                  </div>
                  
                  
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input name="email" type="email" >
                  </div>
                  
                  
                  <div class="form-group">
                    <label for="pass">Password</label>
                    <input name="pass" type="password" >
                  </div>
                  
                  
                    <div class="form-group">
                    <label for="address">Address</label>
                    <input name="address" type="text" >
                  </div>
                  
                  <div class="form-group">
                    <label for="number">Mobile</label>
                    <input name="number" type="text" >
                  </div>
                  
                   <div class="form-group">
                    <label for="user_role">Select User Type:</label>
                    <select name="user_role" >
				            <option value="Administrator">Administrator</option>
				            <option value="Receptionist">Receptionist</option>
				            <option value="Trainer">Trainer</option>
				            <option value="Member">Member</option>
    				</select>
                  </div>
                  
                  
                  <div class="text-center">
                  <input type = "submit" name = "register" value = " Create Account">
                <!-- 
                    <button type="submit" class="btn btn-primary"><i class="fa fa-user-md"></i> Register</button>
                     -->
                  </div>
                  
                  
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