<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dcmls.*,dcmls.bl.*,dcmls.dto.*,java.sql.*"%>
<%
    String userId;
    String userName,phoneNumber,emailId,address,category,dob,gender;
    UserDTO user=null;
    Login login=null;
    int result=0,result1=0;

try
{
	userId=request.getParameter("txtUserID");
	userName=request.getParameter("txtUserName");
	phoneNumber=request.getParameter("txtPhoneNumber");
	emailId=request.getParameter("txtEmailID");
	address=request.getParameter("txtAddress");
	dob=request.getParameter("date");
	gender=request.getParameter("gender");
	category=request.getParameter("category");
	
	user=new UserDTO();
	user.setUserID(userId);
	user.setUserName(userName);
	user.setPhoneNumber(phoneNumber);
	user.setEmailID(emailId);
	user.setAddress(address);
	user.setDob(dob);
	user.setType(category);
	user.setGender(gender);
	result=UserBL.addUser(user);
	
	login=new Login();
	
	login.setUsername(userName);
	login.setPassword(phoneNumber);
	login.setType(category);
	login.setUserid(userId);
	result1=LoginBL.addLogin(login);
%>	
<script>alert("datat added successfully");</script>
	
<%	
	response.sendRedirect("registrationSussessfull.jsp");
}
catch(Exception e)
{
	
	response.sendRedirect("user_add.jsp"); 
}
%>