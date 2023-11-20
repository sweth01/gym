/**
 * @author Swetha Adluru, REC
 * 
 */

package com.gym;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 public RegisterServlet() {
	        super();

	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	System.out.println("New user enroll request");

	        response.setContentType("text/html");


	        String userName = request.getParameter("name");
	        String userEmail= request.getParameter("email");
	        String userPassword = request.getParameter("pass");
	        String userTelephone= request.getParameter("number");
	        String userAddress= request.getParameter("address");
	        String userRole= request.getParameter("user_role");
	        

	        //Object of Customer model and initialising values that we receive from the user
	        CustomerModel bean = new CustomerModel();
	        bean.setName(userName);
	        bean.setEmail(userEmail);
	        bean.setPassword(userPassword);
	        bean.setPhone(userTelephone);
	        bean.setAddress(userAddress);
	        bean.setUserRole(userRole);
	        

	        //set attribute of request object can be used to set an attribute and can be used within JSP files to display information whenever we want.
	        request.setAttribute("bean", bean);

	        //Three boolean type variables to invoke the validation methods of the Register Bean interface
	        boolean comparePassword = bean.validatePassword();
	        boolean passwordNull = bean.checkNullPass();
	        boolean usernameNull = bean.checkNullUserID();


	        //if the following information satisfies , create the connection
	        if(comparePassword && passwordNull && usernameNull){
	        	try{
	                Class.forName("com.mysql.jdbc.Driver");
	                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "chennai123");
	                Statement st=  conn.createStatement();
	    	        
	                String userid = request.getParameter("user_id");
	                if(userid != null && !userid.isBlank()) {
	                	long id= Long.parseLong(request.getParameter("user_id"));
	                	String updateQuery = "update users set user_name='"+userName+"', user_email='"+userEmail+"', user_password='"+userPassword+ "', user_phone='" + userTelephone+ "', user_address='"+ userAddress+"', user_role='"+ userRole+"' where user_id="+id;
	                	 st.executeUpdate(updateQuery);
			        	
	                }else {
	                    st.executeUpdate("insert into users(user_name,user_email,user_password,user_phone,user_address, user_role) values('"+userName+"','"+userEmail+"','"+userPassword+"','"+userTelephone+"','"+userAddress+"', '"+ userRole+ "' )");
		            }
	                
	              	RequestDispatcher rd=request.getRequestDispatcher("login-success-admin.jsp");
		            rd.forward(request, response);
	            }
	            catch(Exception e)
	            {
	                System.out.print(e);
	                e.printStackTrace();
	            }
	        }
	        else{
	            //else go to the following page
	            RequestDispatcher rd=request.getRequestDispatcher("register-error.jsp");
	            rd.forward(request, response);
	        }
	    }
	    @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
	        doPost(req, resp);
	    }
}
