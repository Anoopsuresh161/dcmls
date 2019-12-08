<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dcmls.dto.*,dcmls.bl.*"%>
<%@ page  import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
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
UserDTO userdto=null;
Login login1;%>
<%


//String uid1="202";
userid=request.getParameter("userid");
out.println(userid);
login1=new Login();
userdto=new UserDTO();
login1=LoginBL.approveuser(userid);
userdto=UserBL.approveuser(userid);
//String email1="anoopsuresh161@gmail.com";
String email1=userdto.getEmailID();
out.println(email1);

String nn="provided";

String host="", user="", pass="";

host ="smtp.gmail.com"; //"smtp.gmail.com";

user ="onelibbydcmls@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails

pass ="dcmlsOne@123"; //Your gmail password

String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

String to =email1; // out going email id

String from ="onelibbydcmls@gmail.com"; //Email id of the recipient
String subject="WELCOME TO DCMLS ";
//String subject ="welcome";
String messageText ="username="+login1.getUsername()+"password="+login1.getPassword();
boolean sessionDebug = true;

Properties props = System.getProperties();
props.put("mail.host", host);
props.put("mail.transport.protocol.", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getDefaultInstance(props, null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setContent(messageText, "text/html"); // use setText if you want to send text
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);
try
{
	transport.sendMessage(msg, msg.getAllRecipients());
	out.println("Message has not been sent successfully"); 
	transport.close();	
}
catch(Exception e)
{
	out.println("mail cant send correctly");
}
try
{
	UserDTO userdt=new UserDTO();
	userdt.setUserID(userid);
	userdt.setStatus(1);
	result1=UserBL.updatestatus(userdt);
	Login login=new Login();
	login.setUserid(userid);
	login.setStatus(1);
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