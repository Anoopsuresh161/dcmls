<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dcmls.dto.*,dcmls.bl.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <title>OneLib &mdash; Website by DCMLS</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="../../fonts/icomoon/style.css">

    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/jquery-ui.css">
    <link rel="stylesheet" href="../../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../../css/owl.theme.default.min.css">

    <link rel="stylesheet" href="../../css/jquery.fancybox.min.css">

    <link rel="stylesheet" href="../../css/bootstrap-datepicker.css">

    <link rel="stylesheet" href="../../fonts/flaticon/font/flaticon.css">

    <link rel="stylesheet" href="../../css/aos.css">

    <link rel="stylesheet" href="../../css/style.css">
    
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  
  <div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
   
    
    <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">
      
      <div class="container-fluid">
        <div class="d-flex align-items-center">
          <div class="site-logo mr-auto w-25"><a href="home.jsp">OneLib</a></div>

          <div class="mx-auto text-center">
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mx-auto d-none d-lg-block  m-0 p-0">
                <li><a href="home.jsp" class="nav-link">Home</a></li>
                <li><a href="#courses-section" class="nav-link">Top Chart</a></li>
              </ul>
            </nav>
          </div>

          <div class="ml-auto w-25">
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu site-menu-dark js-clone-nav mr-auto d-none d-lg-block m-0 p-0">
                <li class="cta"><a href="../user/user_add.jsp" class="nav-link"><span>Sign Up</span></a></li>
              </ul>
            </nav>
            <a href="home.jsp" class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black float-right"><span class="icon-menu h3"></span></a>
          </div>
        </div>
      </div>
      
    </header>

    <div class="intro-section" id="home-section">
      
      <div class="slide-1" style="background-image: url('../../images/bg_1.jpg');" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-12">
              <div class="row align-items-center">
                <div class="col-lg-6 mb-4">
                  <h1  data-aos="fade-up" data-aos-delay="100">Read. Evolve.</h1>
                  <p class="mb-4"  data-aos="fade-up" data-aos-delay="200"></p>
                  <p data-aos="fade-up" data-aos-delay="300"><a href="#programs-section" class="btn btn-primary py-3 px-5 btn-pill">About Us</a></p>

                </div>

                <div class="col-lg-5 ml-auto" data-aos="fade-up" data-aos-delay="500">
                  <form action="" method="post" class="form-box">
                  
                  
                  <%! String message=""; 
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
                    <h3 class="text-secondary">Log-In</h3>
                    <div class="form-group">
                      <input type="text" name="username" class="form-control" placeholder="Username">
                    </div>
                    <div class="form-group">
                      <input type="password" name="password" class="form-control" placeholder="Password">
                    </div>
                    <div class="form-group">
                      <input type="submit" class="btn btn-primary btn-pill" name="submit"value="Login">
                    </div>
                    <a class="text-secondary" href="forgotpassword.jsp">Forgot Password?</a>
                  </form>
					
                </div>
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>
    
    
    
    
    
    
     <div class="site-section courses-title" id="courses-section">
      <div class="container">
        <div class="row mb-5 justify-content-center">
          <div class="col-lg-7 text-center" data-aos="fade-up" data-aos-delay="">
            <h2 class="section-title">Trending</h2>
          </div>
        </div>
      </div>
    </div>
    <div class="site-section courses-entry-wrap"  data-aos="fade-up" data-aos-delay="100">
    
      <div class="container">
        <div class="row">
          <div class="owl-carousel col-12 nonloop-block-14">
               	<%
				ArrayList <Integer> bookids=UservisitedbookBL.getBookvisited();
				for(int bookid: bookids)
				{
					ArrayList<BookDTO> books=BookBL.getmostviewed(bookid);
					if(books!=null &&(books.size()>0))
					{%>
						<%for(BookDTO book:books)
						{%>

				            <div class="course bg-white h-100 align-self-stretch">
				            
				              <figure class="m-0">
				                <a href="../book/<%=book.getPdf()%>"><img src="../../images/pdf.jpg" alt="Image" class="img-fluid"></a>
				              </figure>
				              <div class="course-inner-text py-4 px-4">
				                <div class="meta"><span class="fa fa-flask"></span><%=book.getBookType() %></div>
				                <h3><%=book.getBookName() %></h3>
				                <p>By <%=book.getAuthor()%></p>
				              </div>
				            </div>
				        <%}
					}
				}%>
		</div>
        </div>
        <div class="row justify-content-center">
          <div class="col-7 text-center">
            <button class="customPrevBtn btn btn-secondary m-1"><</button>
            <button class="customNextBtn btn btn-secondary m-1">></button>
          </div>
        </div>
      </div>
    </div>
    
        <div class="site-section" id="programs-section">
      <div class="container">
        <div class="row mb-5 justify-content-center">
          <div class="col-lg-7 text-center"  data-aos="fade-up" data-aos-delay="">
            <h2 class="section-title">About Us</h2>
            <p>OneLib is a free online bookroom from DCMLS that lets you read and evolve</p>
          </div>
        </div>
        <div class="row mb-5 align-items-center">
          <div class="col-lg-7 mb-5" data-aos="fade-up" data-aos-delay="100">
            <img src="../../images/undraw_youtube_tutorial.svg" alt="Image" class="img-fluid">
          </div>
          <div class="col-lg-4 ml-auto" data-aos="fade-up" data-aos-delay="200">
            <h2 class="text-black mb-4">We Are Connected Globally</h2>
            <p class="mb-4">OneLib is in excellent touch with graduates and faculties around the world.</p>

            <div class="d-flex align-items-center custom-icon-wrap mb-3">
              <span class="custom-icon-inner mr-3"><span class="icon icon-graduation-cap"></span></span>
              <div><h3 class="m-0">22,931 Yearly Graduates Read OneLib</h3></div>
            </div>

          </div>
        </div>

        <div class="row mb-5 align-items-center">
          <div class="col-lg-7 mb-5 order-1 order-lg-2" data-aos="fade-up" data-aos-delay="100">
            <img src="../../images/undraw_teaching.svg" alt="Image" class="img-fluid">
          </div>
          <div class="col-lg-4 mr-auto order-2 order-lg-1" data-aos="fade-up" data-aos-delay="200">
            <h2 class="text-black mb-4">Mentor's Companion.</h2>
            <p class="mb-4">Teachers from all around the world refer OneLib for giving the best to thier Students</p>


            <div class="d-flex align-items-center custom-icon-wrap">
              <span class="custom-icon-inner mr-3"><span class="icon icon-university"></span></span>
              <div><h3 class="m-0">Faculties of over 150 Universities</h3></div>
            </div>

          </div>
        </div>
        

        <div class="row mb-5 align-items-center">
          <div class="col-lg-7 mb-5" data-aos="fade-up" data-aos-delay="100">
            <img src="../../images/undraw_teacher.svg" alt="Image" class="img-fluid">
          </div>
          <div class="col-lg-4 ml-auto" data-aos="fade-up" data-aos-delay="200">
            <h2 class="text-black mb-4">Free Source Of Knowledge</h2>
            <p class="mb-4">Our team strives best to provide free information to the needful and is a prime contributer to charity.</p>

            
            <div class="d-flex align-items-center custom-icon-wrap mb-3">
              <span class="custom-icon-inner mr-3">&nbsp;&nbsp;<span class='fas fa-hand-holding-heart' style='font-size:15px;color:white'></span></span>
              <div><h3 class="m-0">Helps over 1000 charitable socities.</h3></div>
            </div>

          </div>
        </div>

      </div>
    </div>
    
      <div class="site-section bg-image overlay" style="background-image: url('../../images/bg_1.jpg');">
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-md-8 text-center testimony">
          <h3 class="mb-4">Founder</h3>
            <img src="../../images/founder.jpg" alt="Image" class="img-fluid w-25 mb-4 rounded-circle">
            <h3 class="mb-4">Saravanan</h3>
            <blockquote>
              <p>&ldquo;DCMLS was founded with the vision of spreading knowledge to the public with least efforts.As a result OneLib was setup with zero cost to the public and is a prime contributer to charity.&rdquo;</p>
            </blockquote>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section pb-0">

      <div class="future-blobs">
        <div class="blob_2">
          <img src="../images/blob_2.svg" alt="Image">
        </div>
        <div class="blob_1">
          <img src="../images/blob_1.svg" alt="Image">
        </div>
      </div>
      <div class="container">
        <div class="row mb-5 justify-content-center" data-aos="fade-up" data-aos-delay="">
          <div class="col-lg-7 text-center">
            <h2 class="section-title">Why Choose OneLib</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 ml-auto align-self-start"  data-aos="fade-up" data-aos-delay="100">

            <div class="p-4 rounded bg-white why-choose-us-box">

              <div class="d-flex align-items-center custom-icon-wrap custom-icon-light mb-3">
                <div class="mr-3"><span class="custom-icon-inner"><span class="icon icon-graduation-cap"></span></span></div>
                <div><h3 class="m-0">22,931 Yearly Graduates Read Us</h3></div>
              </div>

              <div class="d-flex align-items-center custom-icon-wrap custom-icon-light mb-3">
                <div class="mr-3"><span class="custom-icon-inner"><span class="icon icon-university"></span></span></div>
                <div><h3 class="m-0">Faculties from 150 Universities Worldwide Read Us</h3></div>
              </div>

              <div class="d-flex align-items-center custom-icon-wrap custom-icon-light mb-3">
                <div class="mr-3"><span class="custom-icon-inner"><span class="icon icon-graduation-cap"></span></span></div>
                <div><h3 class="m-0">Choice Of Top Professionals in The World</h3></div>
              </div>

              <div class="d-flex align-items-center custom-icon-wrap custom-icon-light mb-3">
                <div class="mr-3"><span class="custom-icon-inner"><span class="icon icon-university"></span></span></div>
                <div><h3 class="m-0">Expand Your Knowledge With us</h3></div>
              </div>

              <div class="d-flex align-items-center custom-icon-wrap custom-icon-light mb-3">
                <div class="mr-3"><span class="custom-icon-inner"><span class="icon icon-graduation-cap"></span></span></div>
                <div><h3 class="m-0">Best Online Learning Assistance</h3></div>
              </div>

              <div class="d-flex align-items-center custom-icon-wrap custom-icon-light">
                <div class="mr-3"><span class="custom-icon-inner"><span class="icon icon-university"></span></span></div>
                <div><h3 class="m-0">Best Authors Share With Us</h3></div>
              </div>

            </div>


          </div>
          <div class="col-lg-7 align-self-end"  data-aos="fade-left" data-aos-delay="200">
            <img src="../../images/person_transparent.png" alt="Image" class="img-fluid">
          </div>
        </div>
      </div>
    </div>

 
    
    
    
    
    
    
    
    
    
      
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
              <li><a href="home.jsp">Home</a></li>
              <li><a href="#courses-section">Top chart</a></li>
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
    </footer>

  
    
  </div> <!-- .site-wrap -->

  <script src="../../js/jquery-3.3.1.min.js"></script>
  <script src="../../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../../js/jquery-ui.js"></script>
  <script src="../../js/popper.min.js"></script>
  <script src="../../js/bootstrap.min.js"></script>
  <script src="../../js/owl.carousel.min.js"></script>
  <script src="../../js/jquery.stellar.min.js"></script>
  <script src="../../js/jquery.countdown.min.js"></script>
  <script src="../../js/bootstrap-datepicker.min.js"></script>
  <script src="../../js/jquery.easing.1.3.js"></script>
  <script src="../../js/aos.js"></script>
  <script src="../../js/jquery.fancybox.min.js"></script>
  <script src="../../js/jquery.sticky.js"></script>

  
  <script src="../../js/main.js"></script>
    
  </body>
</html>