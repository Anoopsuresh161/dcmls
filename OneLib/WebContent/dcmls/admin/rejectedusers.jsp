<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dcmls.dto.*,dcmls.bl.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String userid;
int result,result1;
UserDTO userdto=null;%>
<%


//String uid1="202";
userid=request.getParameter("userid");
try
{
	UserDTO userdt=new UserDTO();
	userdt.setUserID(userid);
	userdt.setStatus(2);
	result1=UserBL.updatestatus(userdt);
	Login login=new Login();
	login.setUserid(userid);
	login.setStatus(2);
	result=LoginBL.updatestatus(login);
	

	if(result>0 && result1>0)
	{
		out.println("details updated successfully");
		
		
	}
	else
	{
		out.println("update not possible");
	}
	response.sendRedirect("rejected.jsp");
}
catch(Exception e)
{
	out.println("table cant updated");
}

%>
</body>
</html>