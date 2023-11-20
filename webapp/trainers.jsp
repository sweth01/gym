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
			                            <a class="nav-link active" href="login-success-admin.jsp">
			                                Members
			                            </a>
			                        </li>
			                      
			                        <li class="nav-item">
			                            <a class="nav-link" href="#">
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
			             
			            <div> Trainers List</div>

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
							 
							 try{
							 	
								Class.forName("com.mysql.jdbc.Driver");
								Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "chennai123");
								String query = "select * from users where user_role = \"Trainer\"";
							   	 
								PreparedStatement ps = conn.prepareStatement(query);
								ResultSet rs = ps.executeQuery();
								
								ArrayList arrayList = null;
						    	ArrayList membersList = new ArrayList();
					    	  
						    	while(rs.next()) {
						    		 arrayList = new ArrayList();
						    		 arrayList.add(rs.getString(1));
						    		 arrayList.add(rs.getString(2));
						    		 arrayList.add(rs.getString(3));
						    		 arrayList.add(rs.getString(5));
						    		 arrayList.add(rs.getString(6));
						    		 arrayList.add(rs.getString(7));
						    		 membersList.add(arrayList);    	  
					    		  
						    	}
							 
								int count=0;
								String color = "#F9EBB3";
								
								System.out.println("Count : " + count);
								
								
								Iterator itr = membersList.iterator();
								
								System.out.println("Count : " + count);
								
								while(itr.hasNext()){
									System.out.println("Count : " + count);
									if((count%2)==0){
										color = "#eeffee";
									}
									else{
										color = "#F9EBB3";
									}
									
									count++;
									ArrayList memberDetails = (ArrayList)itr.next();
									%>
									<tr style="background-color:<%=color%>;">
									
										<td><%=memberDetails.get(1)%></td>
										<td><%=memberDetails.get(2)%></td>
										<td><%=memberDetails.get(3)%></td>
										<td><%=memberDetails.get(4)%></td>
										<td><%=memberDetails.get(5)%></td>
										<td>
						                    <a href="editMember.jsp?user_id=${memberDetails.user_id}">Edit</a> |
						                    <a href="deleteMember?user_id=${memberDetails.user_id}">Delete</a>
						                </td>
									
									</tr>
								<%
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
								
							 }catch(SQLException | ClassNotFoundException e) {
									
									System.out.print(e);
								
								}
								%>
							  </tbody>
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

