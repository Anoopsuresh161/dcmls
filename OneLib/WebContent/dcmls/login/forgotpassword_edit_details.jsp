<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dcmls.dto.*,dcmls.bl.*,dcmls.dl.*"%>
    <%
    String userid;
    String username,password;
     Login login=null;
    int result=0;
    %>
<%
try
{
userid=(String)session.getAttribute("userid");
username=request.getParameter("username");
password=request.getParameter("password");
login=new Login();
login.setUserid(userid);
login.setUsername(username);
login.setPassword(password);
//login.setUserid(userid);

result=LoginBL.forgotpasswordupdate(login);

if(result>0)
{
	session.setAttribute("message", "details edited successfully");
	
}
else
{
	session.setAttribute("message", "retry");
}
response.sendRedirect("home.jsp");
}
catch(Exception e)
{
	session.setAttribute("message", "entera valid number");
	response.sendRedirect("forgotpassword.jsp");
}
%>