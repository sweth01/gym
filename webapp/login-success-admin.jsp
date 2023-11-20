<%@page import="com.gym.CustomerModel"%>

<%@page import="java.util.*"%>

<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.ResultSet" %>
<%@page import = "java.sql.Connection" %>
<%@page import = "java.sql.Statement" %>
<%@page import = "java.sql.*" %>

<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
       
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
     <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.css">
    
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    
    <link rel="stylesheet" href="css/custom.css">
    
    <link rel="shortcut icon" href="favicon.png">
    
</head>


 <div id="top">
        <div class="container">
          <div class="row">
            <div class="col-lg-6 offer mb-3 mb-lg-0"><a href="#" class="btn btn-success btn-sm">Offer of the day</a><a href="#" class="ml-1">Get flat 35% off on orders over $50!</a></div>
            <div class="col-lg-6 text-center text-lg-right">
              <ul class="menu list-inline mb-0">
                <a href="logout.jsp" class="nav-link"><i class="fa fa-sign-out"></i> Logout</a></ul>
              </ul>
            </div>
          </div>
        </div>
        
 	</div>
      

<body>
<jsp:include page="header.jsp"></jsp:include>


<!--  login success page -->

		
<div id="all">
      <div id="content">
        <div class="container">
        



			 <div class="container-fluid">
			        <div class="row">
			            <!-- Left Navigation -->
			            <nav class="col-md-2 d-none d-md-block bg-light sidebar">
			                <div class="sidebar-sticky">
			                    <ul class="nav flex-column">
			                      
			                        <li class="nav-item">
			                            <a class="nav-link active" href="#">
			                                Members
			                            </a>
			                        </li>
			                      
			                        <li class="nav-item">
			                            <a class="nav-link" href="trainers.jsp">
			                                Trainers
			                            </a>
			                        </li>
			                        
			                         <li class="nav-item">
			                            <a class="nav-link active" href="#">
			                                Equipment
			                            </a>
			                        </li>
			                        <li class="nav-item">
			                            <a class="nav-link" href="#">
			                                Exercise
			                            </a>
			                        </li>
			                        <li class="nav-item">
			                            <a class="nav-link" href="#">
			                                Payments
			                            </a>
			                        </li>
			                        
			                        <!-- Add more navigation items as needed -->
			                    </ul>
			                </div>
			            </nav>
			
			            <!-- Center Content -->
			            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			               


    <div class="container">
          <div class="row">
            <div class="col-lg-6 text-right text-lg-right">
              <ul class="menu list-inline mb-0">
                <a href="register.jsp" class="nav-link"><i class="fa fa-sign-out"></i> Enroll New Member</a></ul>
              </ul>
              
            </div>
          </div>
        </div>
        
<div>
				           <table class="table">
							  <thead class="thead-dark">
							    <tr>
							      <th scope="col">Name</th>
							      <th scope="col">Email</th>
							      <th scope="col">Phone Number</th>
							      <th scope="col">Address</th>
							      <th scope="col">Member Since</th>
							      <th scope="col">Action</th>
							    </tr>
							  </thead>
							  
							  
							  <tbody>
							 <%
										int count=0;
										String color = "#F9EBB3";
										
										request.setAttribute("membersList", null);
										//Check once if members is actually empty
										
										if(request.getAttribute("membersList")==null)
										{
											try{
											 	
												Class.forName("com.mysql.jdbc.Driver");
												Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "chennai123");
												String query = "select * from users where user_role = \"Member\"";
											   	 
												PreparedStatement ps = conn.prepareStatement(query);
												ResultSet rs = ps.executeQuery();
												
												
										    	ArrayList <CustomerModel>membersList = new ArrayList<CustomerModel>();
									    	  
										    	while(rs.next()) {
										    		CustomerModel customer = new CustomerModel();
										    		customer.setName(rs.getString("user_name"));
										    		customer.setEmail(rs.getString("user_email"));
										    		customer.setPassword(rs.getString("user_password"));
										    		customer.setPhone(rs.getString("user_phone"));
										    		customer.setAddress(rs.getString("user_address"));
										    		customer.setUserRole(rs.getString("user_role"));
										    		customer.setId(rs.getLong("user_id"));
										    		membersList.add(customer);       	  
									    		  
										    	}
										    	request.setAttribute("membersList", membersList);
											}catch(SQLException | ClassNotFoundException e) {
												
												System.out.print(e);
											
											}
										}
										
										
										if(request.getAttribute("membersList")!=null)
										{
											
											ArrayList al = (ArrayList)request.getAttribute("membersList");
											Iterator itr = al.iterator();
											
											
											while(itr.hasNext()){
												
											if((count%2)==0){
												color = "#eeffee";
											}
											else{
												color = "#F9EBB3";
											}
											
											count++;
											CustomerModel memberDetails = (CustomerModel)itr.next();
											
											 Long uid= memberDetails.getId();
											
											%>
											<tr style="background-color:<%=color%>;">
											
											<td><%=memberDetails.getName()%></td>
											<td><%=memberDetails.getEmail()%></td>
											
											<td><%=memberDetails.getPhone()%></td>
											
											<td><%=memberDetails.getAddress()%></td>
											<td><%=memberDetails.getName()%></td>
											<td>
							                    <a href="editMember.jsp?uid=<%=memberDetails.getId()%>">Edit</a> |
							                    
							                    <a href="#" onclick="confirmDelete(<%=memberDetails.getId()%>, <%=memberDetails.getId()%>);">Delete</a>
							                </td>
											
											</tr>
											<%
											}
										}
										%>
										<%
										if(count==0){
										%>
										<tr>
										<td colspan=8 align="center"
										style="background-color:eeffee"><b>No Record</b></td>
										</tr>
										<%
										}
										%>
							  </tbody>
							  
							      <script>
							        function confirmDelete(memberId, memberName) {
							        	alert(memberId);
							            var result = confirm("Are you sure you want to delete member with ID " + memberId + "?");
							
							            if (result) {
							                // Perform the actual delete action or redirect to a delete servlet
							                // Example: window.location.href = "deleteMember?memberId=" + memberId;
							            	window.location.href = "deleteMember?uid="+memberId;
							                console.log("Member deleted");
							            } else {
							                console.log("Deletion canceled");
							            }
							        }
							    </script>
													</table>
					
         </div>  
			            </main>
			        </div>
			    </div>
          
        </div>
     
      <%@include file="footer.jsp" %>
      
      </div>
			
	</div>
</div>
			


    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
    <script src="js/front.js"></script>
</body>
</html>

