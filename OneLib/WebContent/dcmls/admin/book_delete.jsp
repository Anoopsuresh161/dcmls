<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dcmls.dto.*"%>
	<%@page import="dcmls.bl.*" %>
	<%@page import="dcmls.dl.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>deleting</title>
</head>
<body>
<%
int book_id=0;
int result=0;

book_id=Integer.parseInt(request.getParameter("book_id"));
result=BookBL.deleteBook(book_id);
response.sendRedirect("book_view_all.jsp");
	

%>

</body>
</html>