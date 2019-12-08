<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,dcmls.bl.*,dcmls.dto.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Rapid Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="../../iimg/favicon.png" rel="icon">
  <link href="../../iimg/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,600,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="../../ilib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="../../ilib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="../../ilib/animate/animate.min.css" rel="stylesheet">
  <link href="../../ilib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="../../ilib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href=".././ilib/lightbox/css/lightbox.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="../../icss/style.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: Rapid
    Theme URL: https://bootstrapmade.com/rapid-multipurpose-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
  
  <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../../timages/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../tvendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../tfonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../tvendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../tvendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../tvendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../tcss/util.css">
	<link rel="stylesheet" type="text/css" href="../../tcss/main.css">
<!--===============================================================================================-->
  
  
  
  
  
  
  
</head>

<body background="images/bg_1.jpg">
  <!--==========================
  Header
  ============================-->
  <header id="header">

    <div id="topbar">
      <div class="container">
        <div class="social-links">
          <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
          <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
          <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
          <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
        </div>
      </div>
    </div>

    <div class="container">

      <div class="logo float-left">
        <!-- Uncomment below if you prefer to use an image logo -->
        <h1 class="site-logo mr-auto w-25"><a href="#intro" class="scrollto"><span>OneLib</span></a></h1>
        <!-- <a href="#header" class="scrollto"><img src="iimg/logo.png" alt="" class="img-fluid"></a> -->
      </div>

      <nav class="main-nav float-right d-none d-lg-block">
        <ul>
          <li class="active"><a href="adminhome.jsp">Home</a></li>
          <li><a href="usereditprofile.jsp">Profile</a></li>
          <li class="drop-down"><a href="">Manage User</a>
            <ul>
              <li><a href="registered_users.jsp">New Users</a></li>
              <li><a href="approved.jsp">Approved Users</a></li>
              <li><a href="rejected.jsp">Suspended Users</a></li>
              <li><a href="trackuser.jsp">Track User</a></li>
            </ul>
          </li>
          <li class="drop-down"><a href="">Manage Books</a>
            <ul>
              <li><a href="book_add.jsp">Add Books</a></li>
              <li><a href="book_view_all.jsp">View Books</a></li>
              <li><a href="bookrequest.jsp">New Book Requests</a></li>
            </ul>
          </li>
          <li><a href="../login/logout.jsp">Logout</a></li>
        </ul>
      </nav><!-- .main-nav -->
      
    </div>
  </header><!-- #header -->

  
  

    <!--==========================
      Services Section
    ============================-->
      <div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
				<% 
String pdfpath;
ArrayList<BookDTO> books=BookBL.getBooks();
if(books!=null &&(books.size()>0))
{%>
				<br><br><br>
					<table>
						<thead>
							<tr class="table100-head">
								<td class="column1">BOOK ID</td>
								<td class="column2">BOOK Name </td>
								<td class="column3">BOOK Type </td>
								<td class="column4">Author</td>
								<td class="column5">Publisher</td>
								<td class="column6">PDF</td>
								<td class="column7">Edit</td>
								<td class="column8">Delete</td>								
							</tr>
						</thead>
						<tbody>
						<%for(BookDTO book:books)
						{%>
								<tr>
									<td class="column1"><%=book.getBookID() %></td>
									<td class="column2"><%=book.getBookName() %></td>
									<td class="column3"><%=book.getBookType() %></td>
									<td class="column4"><%=book.getAuthor()%></td>
									<td class="column5"><%=book.getPublisher()%></td>
									<td class="column6"><a href="<%=book.getPdf()%>">document</a></td>
									<td class="column7"><a href="book_edit.jsp?book_id=<%=book.getBookID()%>">Edit</a></td>
									<td class="column8"><a href="book_delete.jsp?book_id=<%=book.getBookID()%>" onclick="return confirm('Are you sure?')">Delete</a></td>
								</tr>
								<%}
					          }
					          else
					          {%>
					          <tr>
					          <td>no records found</td>
					          </tr>
					          <%}%>
								
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
    <!-- #services -->

   
  <!--==========================
    Footer
  ============================-->
     <footer class="footer-section bg-white">
      <div class="container">
        <div class="row pt-5 mt-5 text-center">
        <div class="col-md-4">
            <h3>About OneLib</h3>
            <p>A website from DCMLS</p>
          </div>
        <div class="col-md-3 ml-auto">
            <h3>Links</h3>
            <ul class="list-unstyled footer-links">
              <li><a href="adminhome.jsp">Home</a></li>
            </ul>
          </div>
          <div class="col-md-12">
            <div class="border-top pt-5">
            <p>
       				 <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
        			Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This website is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >DCMLS</a>
        			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
      		</p>
            </div>
          </div>
          
        </div>
      </div>
    </footer><!-- #footer -->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <!-- Uncomment below i you want to use a preloader -->
  <!-- <div id="preloader"></div> -->
  
<!--===============================================================================================-->	
	<script src="../../tvendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../../tvendor/bootstrap/js/popper.js"></script>
	<script src="../../tvendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../../tvendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../../tjs/main.js"></script>
  

  <!-- JavaScript Libraries -->
  <script src="../../ilib/jquery/jquery.min.js"></script>
  <script src="../../ilib/jquery/jquery-migrate.min.js"></script>
  <script src="../../ilib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../../ilib/easing/easing.min.js"></script>
  <script src="../../ilib/mobile-nav/mobile-nav.js"></script>
  <script src="../../ilib/wow/wow.min.js"></script>
  <script src="../../ilib/waypoints/waypoints.min.js"></script>
  <script src="../../ilib/counterup/counterup.min.js"></script>
  <script src="../../ilib/owlcarousel/owl.carousel.min.js"></script>
  <script src="../../ilib/isotope/isotope.pkgd.min.js"></script>
  <script src="../../ilib/lightbox/js/lightbox.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="../../icontactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="../../ijs/main.js"></script>

</body>
</html>