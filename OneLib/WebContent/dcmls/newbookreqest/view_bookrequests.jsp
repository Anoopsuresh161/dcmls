<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dcmls.dto.*"%>
	<%@page import="dcmls.bl.*" %>
	<%@page import="dcmls.*" %>
	<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h5>BOOK REQUESTS</h5>
<% 
String userid=(String)session.getAttribute("userid");
System.out.println("hiii"+userid);
ArrayList<BookRequestDTO> bookrequestuser=BookRequestBL.getRequests(userid);
if(bookrequestuser!=null &&(bookrequestuser.size()>0))
{%>
<table border="solid">
<tr>
<td>Book Name </td>
<td>Author</td>
<td>Publisher</td>
</tr>
<%for(BookRequestDTO bookrequest:bookrequestuser)
{%>
<tr>
<td><%=bookrequest.getBookname()%>&nbsp;</td>
<td><%=bookrequest.getAuthor()%>&nbsp;</td>
<td><%=bookrequest.getPublisher()%>&nbsp;</td>
</tr>
<%}}%>
</table>
</body>
</html>