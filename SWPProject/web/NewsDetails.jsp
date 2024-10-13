<%-- 
    Document   : NewsDetails
    Created on : Oct 14, 2024, 3:04:03 AM
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
	<link href="dcss/css/bootstrap.min.css" rel="stylesheet">
	<link href="dcss/css/global.css" rel="stylesheet">
	<link href="dcss/css/blog.css" rel="stylesheet">
	<link href="dcss/css/index.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="dcss/css/font-awesome.min.css" />
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
	<script src="dcss/js/jquery-2.1.1.min.js"></script>
    <script src="dcss/js/bootstrap.min.js"></script>
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
						<div class="clickable" style="display: block;">
						  <ul>
						   <li><a href="#">For Men</a></li>
						   <li><a href="#">For Function</a></li>
						   <li><a href="#">For Kids</a></li>
						   <li><a href="#">For Women</a></li>
						  </ul>
						</div>
						<h3 data-prefix="â˜…"><a href="#">BUY THEME</a><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div></h3>
						<div class="clickable" style="">
						  <ul>
						   <li><a href="#">For Men</a></li>
						   <li><a href="#">For Function</a></li>
						   <li><a href="#">For Kids</a></li>
						   <li><a href="#">For Women</a></li>
						  </ul>
						</div>
						<h3 data-prefix="â˜…" class=""><a href="#">MUSIC</a><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div></h3>
						<div class="clickable" style="display: none;">
						  <ul>
						   <li><a href="#">For Men</a></li>
						   <li><a href="#">For Function</a></li>
						   <li><a href="#">For Kids</a></li>
						   <li><a href="#">For Women</a></li>
						  </ul>
						</div>
						<h3 data-prefix="â˜…"><a href="#">POLITICS</a><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div></h3>
						<div class="clickable" style="">
						  <ul>
						   <li><a href="#">For Men</a></li>
						   <li><a href="#">For Function</a></li>
						   <li><a href="#">For Kids</a></li>
						   <li><a href="#">For Women</a></li>
						  </ul>
						</div>
						<h3 data-prefix="â˜…" class=""><a href="#">FASHION</a><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div></h3>
						<div class="clickable" style="display: none;">
						  <ul>
						   <li><a href="#">For Men</a></li>
						   <li><a href="#">For Function</a></li>
						   <li><a href="#">For Kids</a></li>
						   <li><a href="#">For Women</a></li>
						  </ul>
						</div>
						<h3 data-prefix="â˜…"><a href="#">SPORTS</a><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div></h3>
						<div class="clickable" style="">
						  <ul>
						   <li><a href="#">For Men</a></li>
						   <li><a href="#">For Function</a></li>
						   <li><a href="#">For Kids</a></li>
						   <li><a href="#">For Women</a></li>
						  </ul>
						</div>
						<h3 data-prefix="â˜…" class=""><a href="#">TECH</a><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div></h3>
						<div class="clickable" style="display: none;">
						  <ul>
						   <li><a href="#">For Men</a></li>
						   <li><a href="#">For Function</a></li>
						   <li><a href="#">For Kids</a></li>
						   <li><a href="#">For Women</a></li>
						  </ul>
						</div>
						<h3 data-prefix="â˜…"><a href="#">BUSINESS</a><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div></h3>
						<div class="clickable" style="">
						  <ul>
						   <li><a href="#">For Men</a></li>
						   <li><a href="#">For Function</a></li>
						   <li><a href="#">For Kids</a></li>
						   <li><a href="#">For Women</a></li>
						  </ul>
						</div>
						<h3 data-prefix="â˜…" class="border_none"><a href="#">SHOP</a><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div><div class="arrowDown"></div><div class="collapseIcon">+</div></h3>
						<div class="clickable" style="display: none;">
						  <ul>
						   <li><a href="#">For Men</a></li>
						   <li><a href="#">For Function</a></li>
						   <li><a href="#">For Kids</a></li>
						   <li><a href="#">For Women</a></li>
						  </ul>
						</div>
		  </div>
  					 </div>
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
	
<section id="center" class="center_detail">
 <div class="container">
  <div class="row">
     <div class="center_blog_1 text-center clearfix">
		<div class="col-sm-12">
		  <h4 class="head_bg mgt"><span>BLOG DETAIL</span></h4>
		</div>
   </div>
     <div class="center_detail_1 clearfix">
		<div class="col-sm-9">
		  <div class="center_detail_1lm clearfix">
		    <div class="center_detail_1lm1 clearfix">
	   <a href="#"><img src="img/53.jpg" class="iw" alt="abc"></a>
	   <h6 class="col_2"><span class="bold col_1">HEADLINES</span> / 3 year ago / <i class="fa fa-calendar col_1"></i> March 29, 2019</h6>
	   <h2><a href="#">Tips On How To Get The Maximum Out Of Your Exotic Vacation</a></h2>
	   <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis Theme natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.</p>
	   <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis Theme natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus.</p>
         <div class="news_pg1 clearfix">
		<img src="img/36.jpg" alt="abc">
		<p class="mgt">Morbi finibus dui nec orci eleifend, at semper eros iaculis. Donec sem nulla, lobortis vitae justo ac, ornare consequat sem. Quisque varius vitae urna id volutpat. Etiam et erat eu mauris vestibulum laoreet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer est metus, vestibulum quis eros id, dapibus molestie turpis. Pellentesque lobortis mi id pellentesque bibendum. Nam sed ipsum auctor, dignissim libero eget, ultricies neque. Maecenas a ligula nec lorem rutrum cursus. In massa ante, dapibus eget ex a, tempus dignissim nulla. Praesent congue tempus nisl eu feugiat.  In id nunc vitae magna tempor suscipit quis eu libero. Cras laoreet velit suscipit orci mattis consequat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin id nisl sodales, tincidunt purus sagittis, tempus magna. Donec fermentum elit in sapien porta, id interdum urna lacinia. Aenean maximus mauris diam, sit amet vulputate nisi bibendum sed. Sed a dolor turpis.</p>
		<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis Theme natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue.</p>
		<ul class="nav_n">
		<li>Comodous in tempor ullamcorper miaculis.</li>
		<li>Pellentesque vitae neque mollis urna mattis laoreet.</li>
		<li>Divamus sit amet purus justo.</li>
		<li>Proin molestie egestas orci ac suscipit risus posuere loremous.</li>
		</ul>
		<blockquote>
		<h4 class="mgt">It is a capital mistake to theorize before one has data. Insensibly one begins to twist facts to suit theories, instead of theories to suit facts.</h4>
		</blockquote>
		<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis Theme natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet commodo ligula eget dolor.</p>
		<h4>Keep Yourself Updated By Following Our Stories From The Whole World</h4>
		<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis Theme natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus.</p>
		<h4>Share With</h4>
		<ul class="social-network social-circle">
			<li><a href="#" class="icoRss" title="Rss"><i class="fa fa-rss"></i></a></li>
			<li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
			<li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
		 </ul>
		 
		</div>
	  </div>
	        <div class="center_detail_1lm2 clearfix">
			  <div class="center_blog_1 clearfix">
		        <h4 class="head_bg mgt mgb"><span>RELATED ARTICLES</span></h4>
              </div>
			  <div class="center_blog_2 clearfix">
		<div class="col-sm-4 space_left">
		  <div class="center_home_1lm1 mgt clearfix">
	   <a href="#"><img src="img/47.jpg" class="iw" alt="abc"></a>
	   <h6 class="col_2"><span class="bold col_1">HEADLINES</span> / 3 year ago</h6>
	   <ul>
	    <li><i class="fa fa-calendar"></i> <a href="#">June 12</a></li>    
		<li><i class="fa fa-user"></i> <a href="#"> Sed Augue</a></li>
		<li><i class="fa fa-tag"></i> <a href="#">Design</a></li>
	   </ul>
	   <p><a href="#">Lorem ipsum dolor sit amet consectetur adipiscing elitsed do eiusmod tempor incididunt utlabore et dolore...</a></p>
	   <h5 class="mgt"><a class="button" href="#">READ MORE</a></h5>
	  </div>
		</div>
		<div class="col-sm-4 space_left">
		  <div class="center_home_1lm1 mgt clearfix">
	   <a href="#"><img src="img/48.jpg" class="iw" alt="abc"></a>
	   <h6 class="col_2"><span class="bold col_1">HEADLINES</span> / 3 year ago</h6>
	   <ul>
	    <li><i class="fa fa-calendar"></i> <a href="#">June 12</a></li>    
		<li><i class="fa fa-user"></i> <a href="#"> Sed Augue</a></li>
		<li><i class="fa fa-tag"></i> <a href="#">Design</a></li>
	   </ul>
	   <p><a href="#">Lorem ipsum dolor sit amet consectetur adipiscing elitsed do eiusmod tempor incididunt utlabore et dolore...</a></p>
	   <h5 class="mgt"><a class="button" href="#">READ MORE</a></h5>
	  </div>
		</div>
		<div class="col-sm-4 space_left">
		  <div class="center_home_1lm1 mgt clearfix">
	   <a href="#"><img src="img/49.jpg" class="iw" alt="abc"></a>
	   <h6 class="col_2"><span class="bold col_1">HEADLINES</span> / 3 year ago</h6>
	   <ul>
	    <li><i class="fa fa-calendar"></i> <a href="#">June 12</a></li>    
		<li><i class="fa fa-user"></i> <a href="#"> Sed Augue</a></li>
		<li><i class="fa fa-tag"></i> <a href="#">Design</a></li>
	   </ul>
	   <p><a href="#">Lorem ipsum dolor sit amet consectetur adipiscing elitsed do eiusmod tempor incididunt utlabore et dolore...</a></p>
	   <h5 class="mgt"><a class="button" href="#">READ MORE</a></h5>
	  </div>
		</div>
   </div>
              <div class="center_detail_1lm2i clearfix">
		        <h4 class="head_bg mgb"><span>LEAVE A COMMENT</span></h4>
              </div>
			  <div class="news_pg5 clearfix">
	   <textarea placeholder="Type Message:" class="form-control mgt form_1"></textarea>
	   <div class="news_pg5i clearfix">
	    <div class="col-sm-4 space_left">
		 <input placeholder="Name:" class="form-control" type="text">
		</div>
		<div class="col-sm-4 space_all">
		 <input placeholder="Email:" class="form-control" type="text">
		</div>
		<div class="col-sm-4 space_right">
		 <input placeholder="Website:" class="form-control" type="text">
		</div>
	   </div>
	   <p><input type="checkbox"> Save my name, email, and website in this browser for the next time I comment.</p>
	   <h5 class="text-center"><a class="button block" href="#">Post A Comment</a></h5>
	  </div>
			</div>
		  </div>
		</div>
		<div class="col-sm-3 space_left">
	 <div class="center_detail_1rm clearfix">
	  <div class="center_home_1lm1 mgt clearfix">
	   <a href="#"><img src="img/11.jpg" class="iw" alt="abc"></a>
	   <h6 class="col_2"><span class="bold col_1">SPORTS</span> / 3 year ago</h6>
	   <h5 class="bold"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit ligula eget dolor massa</a></h5>
	  </div>
	  <div class="center_home_1lm1 clearfix">
	   <a href="#"><img src="img/13.jpg" class="iw" alt="abc"></a>
	   <h6 class="col_2"><span class="bold col_1">POLITICS</span> / 3 year ago</h6>
	   <h5 class="bold"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit ligula eget dolor massa</a></h5>
	  </div>
      <div class="center_home_1r1 clearfix">
	    <ul class="nav_1">
			  <li class="active"><a data-toggle="tab" href="#home">LATEST </a></li>
			  <li class=""><a data-toggle="tab" href="#menu1">VIDEOS </a></li>
			  <li class=""><a data-toggle="tab" href="#menu2">GALLERIES </a></li>
          </ul>
		<div class="tab-content clearfix">
			  <div id="home" class="tab-pane fade  clearfix active in">
				 <div class="click clearfix">
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/17.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">SPORT</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/18.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">TRENDING</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/19.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">LATEST</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/20.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">BUSINESS</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/21.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">POPULAR</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/22.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">TECH</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/23.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">POLITICS</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/24.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">LATEST</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/25.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">BUSINESS</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/26.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">POPULAR</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
			   </div>
			  </div>
			  <div id="menu1" class="tab-pane fade   clearfix">
				 <div class="click clearfix">
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/22.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">TECH</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/23.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">POLITICS</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/24.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">LATEST</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/25.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">BUSINESS</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/26.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">POPULAR</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/17.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">SPORT</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/18.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">TRENDING</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/19.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">LATEST</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/20.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">BUSINESS</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/21.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">POPULAR</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
			   </div>
			  </div>
			  <div id="menu2" class="tab-pane fade  clearfix ">
				 <div class="click clearfix">
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/17.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">SPORT</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/18.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">TRENDING</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/19.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">LATEST</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/20.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">BUSINESS</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/21.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">POPULAR</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/22.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">TECH</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/23.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">POLITICS</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/24.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">LATEST</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/25.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">BUSINESS</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
					<div class="click_i clearfix">
					  <div class="col-sm-4 space_left">
					   <div class="click_il clearfix">
					     <a href="#"><img src="img/26.jpg" class="iw" alt="abc"></a>
					   </div>
					  </div>
					  <div class="col-sm-8 space_all">
					   <div class="click_ir clearfix">
					    <h6 class="col_2 mgt"><span class="bold col_1">POPULAR</span> / 3 year ago</h6>
						<h5 class="bold"><a href="#"> Adipiscing elit ligula eget dolor massa</a></h5>
					   </div>
					  </div>
					</div>
			   </div>
			  </div>
			</div>
	  </div>
	 </div>
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
