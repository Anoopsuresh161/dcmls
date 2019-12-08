<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dcmls.dto.*,dcmls.bl.*,java.util.*"%>
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
  <link href="../../ilib/lightbox/css/lightbox.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="../../icss/style.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: Rapid
    Theme URL: https://bootstrapmade.com/rapid-multipurpose-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
  
  <!-- Icons font CSS-->
    <link href="../../rvendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="../../rvendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="../../rvendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="../../rvendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="../../rcss/main.css" rel="stylesheet" media="all">
  
</head>

<body background="../../images/bg_1.jpg">
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
<%String userid=(String)session.getAttribute("userid");%>

      <nav class="main-nav float-right d-none d-lg-block">
        <ul>
          <li class="active"><a href="../user/userhome.jsp">Home</a></li>
          <li><a href="../user/usereditprofile.jsp">Profile</a></li>
          <li class="drop-down"><a href="">Book</a>
            <ul>
              <li><a href="../../../SpringOneLib/viewbookrequestform?uid=<%=userid%>">Request new Book</a></li>
              <li><a href="../../../SpringOneLib/viewrequestedbook/<%=userid%>">Requests Pending</a></li>
            </ul>
          </li>
          <li class="drop-down"><a href="">BookMarks</a>
            <ul>
              <li><a href="../../../SpringOneLib/viewbookmarkrequestform?uid=<%=userid%>">New BookMark</a></li>
              <li><a href="../../../SpringOneLib/viewbookmarks/<%=userid%>">View BookMarks</a></li>
            </ul>
          </li>
          <li><a href="../login/logout.jsp">Logout</a></li>
          <li><%
String username=(String)session.getAttribute("username");
//String userid=(String)session.getAttribute("userid");
//out.println(username+""+userid);
%>
<form action="../book/selectbookresult.jsp" method="post">
<select name="selecttype" id="selecttype">
		<option>Book Category</option>
        <%
	ArrayList <BookDTO> types=BookBL.getTypes();
    for(BookDTO type: types)
    {

%>
            <option><%= type.getBookType()%></option>
        <% }%>
        </select>
       <button class="btn-sm btn--red " type="submit" name="submit" id="submit" value="Submit">SUBMIT</button>

        </form>
         </li>
        </ul>
      </nav><!-- .main-nav -->
      
    </div>
  </header><!-- #header -->






    <!--==========================
      Services Section
    ============================-->
    <section id="services" class="section-bg">
      <div class="container">
      <header class="section-header">
      <br><br>
          <h3>Read Books</h3>
        </header>
        <div class="row">
			<% 
			String booktype=request.getParameter("selecttype");
			String pdfpath;
			ArrayList<BookDTO> books=BookBL.getSelectbooks(booktype);
			if(books!=null && books.size()>0)
			{
				for(BookDTO book:books)
				{
				%>
						
          <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-duration="1.4s">
            <div class="box">
              <div class="icon" style="background: #fceef3;"><a href="<%=book.getPdf()%>"onClick="<%UservisitedbookBL.uservisit(book.getBookID());%>"><img src="../../images/pdf.jpg" alt="Image" class="img-fluid"></a></div>
              <h4 class="title"><%=book.getBookType() %></h4>
              <p class="description"><%=book.getBookName() %></p>
              <p class="description">by <%=book.getAuthor()%></p>
            </div>
              
          </div>
       
         <%}
				}%>
				 </div>
      </div>
    </section><!-- #services -->

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