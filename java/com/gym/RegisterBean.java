/**
 * @author Swetha Adluru, REC
 * 
 */

package com.gym;


//Model interface of customer
public interface RegisterBean {


	
	//method to check whether the password is empty
	public boolean checkNullPass();
		
	//method to check whether the user-name is empty
	public boolean checkNullUserID();

	//method to validate password	
	public boolean validatePassword(); 
	
	//method to validate username
	public boolean validateUsername();


	
	
}