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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;    
    
    public CustomerLogin() {
        super();
        
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String userName= request.getParameter("name");  
		String password = request.getParameter("pass"); 
		CustomerModel bean = new CustomerModel();
		bean.setName(userName);
		bean.setPassword(password);
		request.setAttribute("bean", bean);
		boolean status1 = bean.checkNullUserID();
		boolean status2 = bean.checkNullPass();
		String dbName = null;
		String dbPassword = null;
		String dbUserRole = null;
		
		if(status1 && status2){
			try {
				String sql = ("select * from users where user_name=? and user_password=?");
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "chennai123");
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, userName);
				ps.setString(2, password);
				ResultSet rs = ps.executeQuery();				
				
				while(rs.next()) {
					dbName = rs.getString("user_name");
					dbPassword = rs.getString("user_password");
					dbUserRole = rs.getString("user_role");
				}
				if(userName.equals(dbName) && password.equals(dbPassword)) {
					//Post login success, based on role -> direct to user specific landing page
					if(dbUserRole.equals("Administrator")) {	
						System.out.print("Processing as Admin");					
						RequestDispatcher rd=request.getRequestDispatcher("login-success-admin.jsp");
						rd.include(request, response);
				} if(dbUserRole.equals("Member")) {	
					//Process Member specific details here
				} if(dbUserRole.equals("Trainer")) {	
					//Process Trainer specific details here
				}
				
			}else {
			
				RequestDispatcher rd=request.getRequestDispatcher("customer-login-error-invalid.jsp");
				rd.include(request, response);
			}
				
			}catch(SQLException | ClassNotFoundException e) {
				System.out.print(e);
			}
		
		}
		else {
				RequestDispatcher rd=request.getRequestDispatcher("customer-login-error-null.jsp");
				rd.include(request, response);
		}
	}
}