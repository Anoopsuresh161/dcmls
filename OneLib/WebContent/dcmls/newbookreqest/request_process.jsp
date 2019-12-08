<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dcmls.dto.*"%>
	<%@page import="dcmls.bl.*" %>
	<%@page import="dcmls.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String userid=(String)session.getAttribute("userid");
String bookname,author,publisher;
BookRequestDTO bookrequest=null;
int result=0;
try
{
bookname=request.getParameter("txtBookName");
author=request.getParameter("txtAuthor");
publisher=request.getParameter("txtPublisher");

bookrequest=new BookRequestDTO();
bookrequest.setBookname(bookname);
bookrequest.setAuthor(author);
bookrequest.setPublisher(publisher);
bookrequest.setUserid(userid);

result=BookRequestBL.addRequest(bookrequest);
response.sendRedirect("../user/userhome.jsp");
}
catch(Exception e)
{
	System.out.println("**error** book_add_process:"+e.getMessage());
}
%>
</body>
</html>