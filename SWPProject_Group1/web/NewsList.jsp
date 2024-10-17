<%-- 
    Document   : NewsList
    Created on : Oct 14, 2024, 6:18:51 AM
    Author     : P C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Apz News</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/global.css" rel="stylesheet">
	<link href="css/blog.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
	<script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </head>
  
<body>

<section id="header">
 <div class="container">
  <div class="row">
   <div class="header_1 clearfix">
    <div class="col-sm-4">
	 <div class="header_1l clearfix">
	    <ul class="social-network social-circle">
			<li><a href="#" class="icoRss" title="Rss"><i class="fa fa-rss"></i></a></li>
			<li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#" class="icoGoogle" title="Instagram"><i class="fa fa-instagram"></i></a></li>
			<li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
		 </ul>
	 </div>
	</div>
	<div class="col-sm-4">
	 <div class="header_1m text-center clearfix">
	    <h1><a class="col_1" href="index.html">APZ</a></h1>
	 </div>
	</div>
	<div class="col-sm-4">
	 <div class="header_1r text-right clearfix">
	  	  <h3 class="mgt"><a href="#"><i class="fa fa-phone col_1"></i> 1 (001) 234-56-78 <span>Call us now. Resistance is futile!</span></a></h3>
	</div>
	</div>
   </div>
  </div>
 </div>
</section>

<section id="menu" class="clearfix cd-secondary-nav">
	<nav class="navbar nav_t">
		<div class="container">
		    <div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">APZ</a>
			</div>
			<!-- Brand and toggle get grouped for better mobile display -->
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			  	 <ul class="nav navbar-nav">
				
				<li><a class="m_tag" href="index.html">Home</a></li>
				<li><a class="m_tag" href="world.html">World</a></li>
				<li class="dropdown dropdown-large">
				<a href="#" class="dropdown-toggle m_tag" data-toggle="dropdown">Politics<b class="caret"></b></a>
				
				<ul class="dropdown-menu dropdown-menu-large row">
					<li class="col-sm-2 space_all">
						<ul>
							<li><a href="#"><img src="img/3.jpg" class="iw" alt="abc"></a></li>
							<li><a href="#">Minim Veniam â€“ An Exc...</a></li>
                            <li><a class="col_2" href="#"><i class="fa fa-calendar col_1"></i> March 29, 2019</a></li>
						</ul>
					</li>
					<li class="col-sm-2 space_all">
						<ul>
							<li><a href="#"><img src="img/4.jpg" class="iw" alt="abc"></a></li>
							<li><a href="#">Lorem world â€“ An Exc...</a></li>
                            <li><a class="col_2" href="#"><i class="fa fa-calendar col_1"></i> March 29, 2019</a></li>
						</ul>
					</li>
					<li class="col-sm-2 space_all">
						<ul>
							<li><a href="#"><img src="img/5.jpg" class="iw" alt="abc"></a></li>
							<li><a href="#">Eget Nulla â€“ An Exc...</a></li>
                            <li><a class="col_2" href="#"><i class="fa fa-calendar col_1"></i> March 29, 2019</a></li>
						</ul>
					</li>
					<li class="col-sm-2 space_all">
						<ul>
							<li><a href="#"><img src="img/6.jpg" class="iw" alt="abc"></a></li>
							<li><a href="#">Dabibus Diam â€“ An Exc...</a></li>
                            <li><a class="col_2" href="#"><i class="fa fa-calendar col_1"></i> March 29, 2019</a></li>
						</ul>
					</li>
					
					<li class="col-sm-2 space_all">
						<ul>
							<li><a href="#"><img src="img/7.jpg" class="iw" alt="abc"></a></li>
							<li><a href="#">Imperdi Board â€“ An Exc...</a></li>
                            <li><a class="col_2" href="#"><i class="fa fa-calendar col_1"></i> March 29, 2019</a></li>
						</ul>
					</li>
					
					<li class="col-sm-2 space_all">
						<ul>
							<li><a href="#"><img src="img/8.jpg" class="iw" alt="abc"></a></li>
							<li><a href="#">Semper Board â€“ An Exc...</a></li>
                            <li><a class="col_2" href="#"><i class="fa fa-calendar col_1"></i> March 29, 2019</a></li>
						</ul>
					</li>
					
				</ul>
				
			</li>
				<li><a class="m_tag" href="about.html">About Us</a></li>
				<li><a class="m_tag" href="service.html">Services</a></li>
				<li class="dropdown">
					  <a class="m_tag active_tab" href="#" data-toggle="dropdown" role="button" aria-expanded="false">Blog<span class="caret"></span></a>
					  <ul class="dropdown-menu drop_3" role="menu">
						<li><a class="hvr-forward" href="blog.html">Blog</a></li>
						<li><a class="border_none hvr-forward" href="blog_detail.html">Blog Detail</a></li>
					  </ul>
                   </li>
				<li class="dropdown">
					  <a class="m_tag" href="#" data-toggle="dropdown" role="button" aria-expanded="false">Pages<span class="caret"></span></a>
					  <ul class="dropdown-menu drop_3" role="menu">
					    <li><a class="hvr-forward" href="team.html">Team</a></li>
						<li><a class="border_none hvr-forward" href="contact.html">Contact Us</a></li>
					  </ul>
                   </li>
				
			</ul>
                 <ul class="nav navbar-nav">
				<li class="dropdown"><a class="m_tag m_tag_1" href="#" data-toggle="dropdown"><span class="fa fa-search"></span></a>
											<ul class="dropdown-menu drop_2" style="min-width: 300px;">
												<li>
													<div class="row_1">
														<div class="col-sm-12">
															<form class="navbar-form navbar-left" role="search">
															<div class="input-group">
																<input type="text" class="form-control" placeholder="Search">
																<span class="input-group-btn">
																	<button class="btn btn-primary" type="button">
																		Search</button>
																</span>
															</div>
															</form>
														</div>
													</div>
												</li>
											</ul>
				   </li>
			    </ul>
				 <section id="side_box">
				
				  <a id="menu-toggle" href="#" class="btn btn-primary btn-lg toggle"><i class="fa fa-bars"></i></a>
					<div id="sidebar-wrapper" class="">
					  <ul class="sidebar-nav">
						<a id="menu-close" href="#" class="btn btn-default btn-lg pull-right toggle"><i class="glyphicon glyphicon-remove"></i></a>
						<li class="sidebar-brand">
						  <a class="col_1" href="index.html">APZ NEWS</a>						</li>
					  </ul>
				     <div class="wrap_inner_1 clearfix">
	                    <div class="ziehharmonika">
						<h3 data-prefix="â˜…" class="active"><a href="#">FEATURES</a><div class="arrowDown"></div><div class="collapseIcon">â€“</div><div class="arrowDown"></div><div class="collapseIcon">â€“</div><div class="arrowDown"></div><div class="collapseIcon">â€“</div><div class="arrowDown"></div><div class="collapseIcon">â€“</div></h3>
						
					 <div class="wrap_inner_2  clearfix">
					  <h6 class="col_2">CONNECT WITH US</h6>
						<ul class="social-network social-circle">
						<li><a href="#" class="icoRss" title="Rss"><i class="fa fa-rss"></i></a></li>
						<li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#" class="icoGoogle" title="Instagram"><i class="fa fa-instagram"></i></a></li>
						<li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
						</ul>
  					 </div>
					</div>
		
	          </section>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	
	</section>
	
<section id="center" class="center_blog">
 <div class="container">
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row">
    <div class="center_blog_1 text-center clearfix">
        <div class="col-sm-12">
            <h4 class="head_bg mgt mgb"><span>BLOG</span></h4>
        </div>
    </div>
    <div class="center_blog_2 clearfix">
        <!-- Loop through the list of news items -->
        <c:forEach var="newsItem" items="${newsList}">
            <div class="col-sm-4">
                <div class="center_home_1lm1 clearfix">
                    <!-- Display news details dynamically -->
                    <a href="?action=view&id=${newsItem.id}">
                        <img src="${newsItem.image}" class="iw" alt="${newsItem.title}">
                    </a>
                    <h6 class="col_2">
                        <span class="bold col_1">${newsItem.title}</span> / ${newsItem.created_at}
                    </h6>
                    <ul>
                        <li><i class="fa fa-calendar"></i> <a href="?action=view&id=${newsItem.id}">${newsItem.created_at}</a></li>    
                        <li><i class="fa fa-user"></i> <a href="?action=view&id=${newsItem.id}">${newsItem.author}</a></li>
                        <li><i class="fa fa-tag"></i> <a href="?action=view&id=${newsItem.id}">${newsItem.category}</a></li>
                    </ul>
                    <p><a href="?action=view&id=${newsItem.id}">${newsItem.description}</a></p>
                    <h5 class="mgt"><a class="button" href="?action=view&id=${newsItem.id}">READ MORE</a></h5>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
     <div class="product_1_last text-center clearfix">
			  <div class="col-sm-12">
					   <ul>
						<li><a href="blog_detail.html"><i class="fa fa-chevron-left"></i></a></li>
						<li class="act"><a href="blog_detail.html">1</a></li>
						<li><a href="blog_detail.html">2</a></li>
						<li><a href="blog_detail.html">3</a></li>
						<li><a href="blog_detail.html">4</a></li>
						<li><a href="blog_detail.html">5</a></li>
						<li><a href="blog_detail.html">6</a></li>
						<li><a href="blog_detail.html"><i class="fa fa-chevron-right"></i></a></li>
					   </ul>
			  </div>
	       </div>
  </div>
 </div>
</section>

<section id="footer" class="clearfix">
 <div class="container">
  <div class="row">
   <div class="footer_1 clearfix">
    <div class="col-sm-3">
	 <div class="footer_1i clearfix">
	  <h3 class="mgt"><a class="col_1" href="index.html"><i class="fa fa-ticket"></i> APZ News</a></h3>
	  <p>Worlds's No. 1 Local Business Directory Website.</p>
	  <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
	 </div>
	</div>
	<div class="col-sm-3">
	 <div class="footer_1i clearfix">
	  <h4 class="col_1">Support &amp; Help</h4>
      <ul>
	   <li><a href="#"><i class="fa fa-check"></i> Advertise us</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> Review</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> Login</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> Ratings</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> Register</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> About Us</a></li>
	  </ul>
	 </div>
	</div>
	<div class="col-sm-3">
	 <div class="footer_1i clearfix">
	  <h4 class="col_1">Popular Services</h4>
      <ul>
	   <li><a href="#"><i class="fa fa-check"></i> Hotels</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> Hospitals</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> Resorts</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> Skin Care</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> Education</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> Real Estates</a></li>
	  </ul>
	 </div>
	</div>
	<div class="col-sm-3">
	 <div class="footer_1i clearfix">
	  <h4 class="col_1">Cities Covered</h4>
      <ul>
	   <li><a href="#"><i class="fa fa-check"></i> Delhi</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> Lucknow</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> Chennai</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> Mumbai</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> Newyork</a></li>
	   <li><a href="#"><i class="fa fa-check"></i> London</a></li>
	  </ul>
	 </div>
	</div>
   </div>
   <div class="footer_2 clearfix">
    <div class="col-sm-4">
	 <div class="footer_1i clearfix">
	  <h4 class="col_1">Payment Options</h4>
      <ul>
	   <li><a href="#"> Pay Pal</a></li>
	   <li><a href="#"> Credit Card</a></li>
	   <li><a href="#"> Debit Card</a></li>
	   <li><a href="#"> UPI</a></li>
	  </ul>
	 </div>
	</div>
	<div class="col-sm-4">
	 <div class="footer_1i clearfix">
	  <h4 class="col_1">Address</h4>
      <p>18700 Orchard Lake Road, Suite 120 Farmington Hills, U.S.A. Landmark : Next To Airport</p>
	  <h4 class="col_1"><span class="normal">Phone:</span> +01 2345 6789</h4>
	 </div>
	</div>
	<div class="col-sm-4">
	 <div class="footer_1i clearfix">
	  <h4 class="col_1">Follow with us</h4>
      <p>Join the thousands of other There are many variations of passages of Lorem Ipsum available</p>
      <ul class="social-network social-circle">
                        <li><a href="#" class="icoRss" title="Rss"><i class="fa fa-rss"></i></a></li>
                        <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
       </ul>
	 </div>
	</div>
   </div>
  </div>
 </div>
</section>

<section id="footer_m">
 <div class="container">
  <div class="row">
   <div class="footer_m_1 clearfix">
    <div class="col-sm-12">
	  <div class="header_1m text-center clearfix">
	    <h1><a class="col_1" href="index.html">APZ</a></h1>
		<ul class="social-network social-circle">
			<li><a href="#" class="icoRss" title="Rss"><i class="fa fa-rss"></i></a></li>
			<li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#" class="icoGoogle" title="Instagram"><i class="fa fa-instagram"></i></a></li>
			<li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
		 </ul>
		 <ul class="nav_f">
		  <li><a href="#">BUY THEME </a></li>
		  <li><a href="#">ENTERTAINMENT  </a></li>
		  <li><a href="#">FASHION  </a></li>
		  <li><a href="#">SPORTS  </a></li>
		  <li><a href="#">BUSINESS  </a></li>
		  <li><a href="#">SHOP </a></li>
		 </ul>
	 </div>
	</div>
   </div>
  </div>
 </div>
</section>

<section id="footer_bottom">
 <div class="container">
  <div class="row">
   <div class="footer_b text-center clearfix">
	 <div class="col-sm-12">
	  <p class="mgt col_2">Â© 2013 Your Website Name. All Rights Reserved | Design by <a class="col_1" href="http://www.templateonweb.com">TemplateOnWeb</a></p>
	 </div>
   </div>
  </div>
 </div>
</section>

<script>
$(document).ready(function(){

/*****Fixed Menu******/
var secondaryNav = $('.cd-secondary-nav'),
   secondaryNavTopPosition = secondaryNav.offset().top;
	$(window).on('scroll', function(){
	    var navbar_height = document.querySelector('.navbar').offsetHeight;
		var top = 30;
		if($(window).scrollTop() > secondaryNavTopPosition ) {
			secondaryNav.addClass('is-fixed');	
			$("body").css("padding-top", navbar_height);
		} else {
			secondaryNav.removeClass('is-fixed');
			$("body").css("padding-top", 0);
		}
	});	
	
});
</script>

<script>
	  $("#menu-close").click(function(e) {
    e.preventDefault();
    $("#sidebar-wrapper").toggleClass("active");
  });
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#sidebar-wrapper").toggleClass("active");
  });
	</script>

<script src="js/ziehharmonika.js"></script>

<script>
$(document).ready(function() {
		$('.ziehharmonika').ziehharmonika({
			collapsible: true,
			prefix: 'â˜…'
		});
	});
</script>

</body>
 
</html>
