<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dcmls.dl.*,dcmls.bl.*,dcmls.dto.*"%>
    <%
    String phone,userid;
    int updatelogin;
    %>
<%
try
{
	
	phone=request.getParameter("phone");
	userid=UserBL.forgotpassword(phone);
if(!userid.equals(""))
{
	
	session.setAttribute("message", "you are a valid user");
	session.setAttribute("userid",userid);
}
else
{
	session.setAttribute("message", "your phone number is not registered");
}
response.sendRedirect("change_login_details.jsp");
}
catch(Exception e)
{
	session.setAttribute("message", "entera valid phone number");
	response.sendRedirect("home.jsp");
}
%>