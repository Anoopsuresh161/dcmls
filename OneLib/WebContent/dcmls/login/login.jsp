<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dcmls.dto.*,dcmls.bl.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post">
<%! 
String message=""; 
  String username;
		  Login login1=null;
		  Login login2=null;
  String password;
  %>               
   <%
                   if(request.getParameter("submit")!=null)
                   {
                	   
                	  username=request.getParameter("username") ;
                	  password=request.getParameter("password");
                	  login1=new Login();
                	  login1.setUsername(username);
                	  login1.setPassword(password);
                	  login2=LoginBL.validateLogin(login1);
                	  //System.out.println(login2.getType());
                	  if(login2!=null && login2.getType().equals("ADMIN"))
                	  {
                		  session.setAttribute("userid",login2.getUserid());
                		  session.setAttribute("username",login2.getUsername());
                		  session.setAttribute("password",login2.getPassword());
                		  response.sendRedirect("../admin/adminhome.jsp");
                	  }
                	  else if(login2!=null && !login2.getType().equals("ADMIN"))
                	  {
                		  String userid=login2.getUserid();
                		  LoginBL.userloginTime(userid);
                		  String username=login2.getUsername();
                		  session.setAttribute("userid",userid );
                		  //System.out.println(userid);
                		  session.setAttribute("username",username);
                		  response.sendRedirect("../user/userhome.jsp"); 
                	  }
                	  else
                	  {
                		  message="wrong userID or password";
                	
                	  }
                   }
   
   %>
   			      <%= message %>
<div>
<label>USERNAME</label>
<input type="text" name="username">
</div>
<div>
<label>PASSWORD</label>
<input type="password" name="password">
</div>
<div>
<input type="submit" value="submit" name="submit">
</div>
<div>
<a href="forgotpassword.jsp">Forgot Password?</a>
</div></form>
<a href="../user/user_add.jsp">singup</a>
</body>
</html>