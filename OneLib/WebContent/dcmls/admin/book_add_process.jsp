<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dcmls.dto.*"%>
	<%@page import="dcmls.bl.*" %>
	<%@page import="dcmls.*" %>
	
	
<%
int book_id;
String bookname,booktype,author,publisher,pdf;
BookDTO book=null;
int result=0,result1=0;
%>


<%
try
{
bookname=request.getParameter("txtBookName");
booktype=request.getParameter("txtBookType");
author=request.getParameter("txtAuthor");
publisher=request.getParameter("txtPublisher");
pdf=request.getParameter("pdf");

book=new BookDTO();
book.setBookName(bookname);
book.setBookType(booktype);
book.setAuthor(author);
book.setPublisher(publisher);
book.setPdf(pdf);

result=BookBL.addBook(book);
response.sendRedirect("book_view_all.jsp");
}
catch(Exception e)
{
	System.out.println("**error** book_add_process:"+e.getMessage());
	session.setAttribute("message","please enter a valid quantity");
	response.sendRedirect("book_add.jsp");
}
%>