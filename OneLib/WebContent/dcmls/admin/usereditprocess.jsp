<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dcmls.dl.*,dcmls.bl.*,dcmls.dto.*"%>
    <%
    String userId;
    String name,phoneNumber,emailId,address,username,password;
    UserDTO user=null;
    Login login=null;
    int result=0,result1=0;
    %>
<%
try
{
	userId=request.getParameter("txtUserID");
	name=request.getParameter("txtUserName");
	phoneNumber=request.getParameter("txtPhoneNumber");
	emailId=request.getParameter("txtEmailID");
	address=request.getParameter("txtAddress");
	
	
user=new UserDTO();
user.setUserID(userId);
user.setUserName(name);
user.setPhoneNumber(phoneNumber);
user.setEmailID(emailId);
user.setAddress(address);
result=UserBL.updateuser(user);

login=new Login();
username=request.getParameter("username");
password=request.getParameter("password");
login.setUserid(userId);
login.setUsername(username);
login.setPassword(password);
result1=LoginBL.updateuser(login);

if(result>0 & result1>0)
{
	session.setAttribute("message", "details edited successfully");
	
}
else
{
	session.setAttribute("message", "retry");
}
String usertype=request.getParameter("type");
System.out.println(usertype);
if(usertype.equals("ADMIN"))
{
	response.sendRedirect("../admin/adminhome.jsp");
}
else
{
response.sendRedirect("userhome.jsp");
}
}
catch(Exception e)
{
	session.setAttribute("message", "entera valid number");
	response.sendRedirect("usereditprofile.jsp");
}
%>