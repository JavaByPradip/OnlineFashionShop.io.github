
<%@ page import="com.shonu.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Shopin A Ecommerce Category Flat Bootstrap Responsive
	Website Template | Home :: w3layouts</title>
<link href="../rikhi/css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Custom Theme files -->
<!--theme-style-->
<link href="../rikhi/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Shopin Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndroId Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!--theme-style-->
<link href="../rikhi/css/style4.css" rel="stylesheet" type="text/css"
	media="all" />
<!--//theme-style-->
<link href="../rikhi/css/myStyle.css" rel="stylesheet" type="text/css"
	media="all" />
<script src="../rikhi/js/jquery.min.js"></script>
<!--- start-rate---->
<script src="../rikhi/js/jstarbox.js"></script>
<link rel="stylesheet" href="../rikhi/css/jstarbox.css" type="text/css"
	media="screen" charset="utf-8" />
<script type="text/javascript">
	jQuery(function() {
		jQuery('.starbox')
				.each(
						function() {
							var starbox = jQuery(this);
							starbox
									.starbox(
											{
												average : starbox
														.attr('data-start-value'),
												changeable : starbox
														.hasClass('unchangeable') ? false
														: starbox
																.hasClass('clickonce') ? 'once'
																: true,
												ghosting : starbox
														.hasClass('ghosting'),
												autoUpdateAverage : starbox
														.hasClass('autoupdate'),
												buttons : starbox
														.hasClass('smooth') ? false
														: starbox
																.attr('data-button-count') || 5,
												stars : starbox
														.attr('data-star-count') || 5
											})
									.bind(
											'starbox-value-changed',
											function(event, value) {
												if (starbox.hasClass('random')) {
													var val = Math.random();
													starbox.next().text(
															' ' + val);
													return val;
												}
											})
						});
	});
</script>
<!---//End-rate---->
<style>
th {
	background-color: antiquewhite;
	font-family: times new roman;
	font-size: 15px;
}

td {
	font-family: times new roman;
	color: black;
	font-size: large;
}

.btn {
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 15px;
	padding: 15px;
	width: 100px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	background-color: salmon;
	border-radius: 5px;
}
</style>
<script>
	function del() {
		if (document.getElementById('catId').checked === false) {
			alert('No item Selected');
			window.location = 'Category.jsp';
		} else {
			if (confirm('Do you really want to delete the selected categories?') === true)
				window.location = 'CategoryCode.jsp';
			else
				window.location = 'Category.jsp';

		}
	}
</script>
</head>
<body>
	<!--header-->
	<div class="header">
		<div class="container">
			<div class="head">
				<div class=" logo">
					<a href="index.jsp"><img src="rikhi/images/logo.PNG" alt=""></a>
				</div>
			</div>
		</div>
		<div class="header-top">
			<div class="container">
				<div class="col-sm-5 col-md-offset-2  header-login">
					<ul>
						<li><a href="../UserLogin.jsp">Login/Register</a></li>
						<li><a href="../checkout.html">Checkout</a></li>
					</ul>
				</div>
				<div class="col-sm-5 header-social">
					<ul>
						<li><a href="#"><i></i></a></li>
						<li><a href="#"><i class="ic1"></i></a></li>
						<li><a href="#"><i class="ic2"></i></a></li>
						<li><a href="#"><i class="ic3"></i></a></li>
						<li><a href="#"><i class="ic4"></i></a></li>
						<li></li>
						<li></li>
						<li><span><a href="Logout.jsp" style="color: #ffcccc;">Logout</a></span></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="container">
			<div class="head-top">
				<div class="col-sm-8 col-md-offset-2 h_menu4">
					<nav class="navbar nav_bottom" role="navigation">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header nav_2">
							<button type="button"
								class="navbar-toggle collapsed navbar-toggle1"
								data-toggle="collapse" data-target="#bs-megadropdown-tabs">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
							<ul class="nav navbar-nav nav_1">
								<li><a class="color" href="Index.jsp">Home</a></li>
								<li class="dropdown mega-dropdown active"><a class="color1"
									href="Category.jsp">Category</a></li>
								<li class="dropdown mega-dropdown active"><a class="color2"
									href="Product.jsp">Product</a></li>
								<li><a class="color3" href="Booking.jsp">View Booking</a></li>
								<li><a class="color3" href="../feedback.html">User
										feedback</a></li>
								<li><a class="color4" href="Products.jsp">View Products</a></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</nav>
				</div>
				<div class="col-sm-2 search-right">
					<ul class="heart">
						<li><a href="../wishlist.html"><span
								class="glyphicon glyphicon-heart" aria-hidden="true"></span></a></li>
						<li><a class="play-icon popup-with-zoom-anim"
							href="#small-dialog"><i class="glyphicon glyphicon-search">
							</i></a></li>
					</ul>
					<div class="cart box_1">
						<a href="../404.html"> <img src="../rikhi/images/cart.png"
							alt="" />
						</a>
						<p>
							<a href="../404.html" class="simpleCart_empty">Empty Cart</a>
						</p>

					</div>
					<div class="clearfix"></div>
					<!---pop-up-box---->
					<link href="../css/popuo-box.css" rel="stylesheet" type="text/css"
						media="all" />
					<script src="../js/jquery.magnific-popup.js" type="text/javascript"></script>
					<!---//pop-up-box---->
					<div id="small-dialog" class="mfp-hide">
						<div class="search-top">
							<div class="login-search">
								<input type="submit" value=""> <input type="text"
									value="Search.." onfocus="this.value = '';"
									onblur="if (this.value === '') {this.value = 'Search..';}">
							</div>
							<p>Shopin</p>
						</div>
					</div>
					<script>
						$(document).ready(function() {
							$('.popup-with-zoom-anim').magnificPopup({
								type : 'inline',
								fixedContentPos : false,
								fixedBgPos : true,
								overflowY : 'auto',
								closeBtnInside : true,
								preloader : false,
								midClick : true,
								removalDelay : 300,
								mainClass : 'my-mfp-zoom-in'
							});

						});
					</script>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--banner-->
	<div class="banner-top">
		<div class="container">
			<h1>Categories</h1>
			<em></em>
			<h2>
				<a href="Home.jsp">Home</a><label>/</label><a href="adminLogin.html">Login</a>
			</h2>
		</div>
	</div>
	<div id="AdminPage"
		style="width: 100%; min-height: 420px; background-color: white; margin-top: -20px; padding-top: 10px"
		align="center">
		<div style="font-family: times new roman;">Enter Category
			Details</div>
		<br />
		<form action="CategoryCode.jsp" method="post">
			<div class="login-mail" style="width: 60%; margin-bottom: 1%">
				<input type="text" id="txtCategory" name="txtCategory"
					placeholder="Enter A New Category"
					style="border: none; width: 100%;" />
			</div>
			<button type="submit" class="button" id="btnSubmit" name="btnSubmit"
				style="background-color: salmon; border-radius: 5px;">Submit</button>
			<div style="font-family: times new roman;">Category Details
				List</div>
			<div class="" style="">
				<table border="0" class="" style="width: 50%">
					<tr>
						<th>ID</th>
						<th>CATEGORY</th>
						<th width="15">SELECT</th>
					</tr>
					<%
						MyConnection con = new MyConnection();
						ResultSet rs = con.ReadRecord("SELECT * FROM CATEGORY_MST ORDER BY CAT_ID ASC");
						int id;
						String name;
						for (int i = 0; rs.next(); i++) {
							id = rs.getInt(1);
							name = rs.getString(2);
					%>
					<tr>
						<td style="color: black;"><%=id%></td>
						<td style="color: black;"><%=name%></td>
						<td align="center"><input type="hidden" id="catId"
							name="catid<%=i%>" value="<%=id%>" /> <input type="checkbox"
							id="catName" name="check<%=i%>" value="<%=id%>" /></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<input type="submit" class="btn" name="btnDelete" id="btnDelete"
				formnovalidate onclick="" value="Delete" />
	</div>
	</form>
	</div>
	<!--//footer-->
	<div class="footer">
		<div class="footer-middle">
			<div class="container">
				<div class="col-md-3 footer-middle-in">
					<a href="../index.jsp"><img src="images/logo.PNG" alt=""></a>
					<p>Suspendisse sed accumsan risus. Curabitur rhoncus, elit vel
						tincidunt elementum, nunc urna tristique nisi, in interdum libero
						magna tristique ante. adipiscing varius. Vestibulum dolor lorem.</p>
				</div>

				<div class="col-md-3 footer-middle-in">
					<h6>Information</h6>
					<ul class=" in">
						<li><a href="../404.html">About</a></li>
						<li><a href="../contact.html">Contact Us</a></li>
						<li><a href="../404.html">Returns</a></li>
						<li><a href="../404.html">Site Map</a></li>
					</ul>
					<ul class="in in1">
						<li><a href="../404.html">Order History</a></li>
						<li><a href="../wishlist.html">Wish List</a></li>
						<li><a href="../UserLogin.jsp">Login</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-3 footer-middle-in">
					<h6>Tags</h6>
					<ul class="tag-in">
						<li><a href="#">Lorem</a></li>
						<li><a href="#">Sed</a></li>
						<li><a href="#">Ipsum</a></li>
						<li><a href="#">Contrary</a></li>
						<li><a href="#">Chunk</a></li>
						<li><a href="#">Amet</a></li>
						<li><a href="#">Omnis</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-middle-in">
					<h6>Newsletter</h6>
					<span>Sign up for News Letter</span>
					<form>
						<input type="text" value="Enter your E-mail"
							onfocus="this.value='';"
							onblur="if (this.value == '') {this.value ='Enter your E-mail';}">
						<input type="submit" value="Subscribe">
					</form>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container">
				<ul class="footer-bottom-top">
					<li><a href="#"><img src="../images/f1.png"
							class="img-responsive" alt=""></a></li>
					<li><a href="#"><img src="../images/f2.png"
							class="img-responsive" alt=""></a></li>
					<li><a href="#"><img src="../images/f3.png"
							class="img-responsive" alt=""></a></li>
				</ul>
				<p class="footer-class">
					&copy; 2016 Shopin. All Rights Reserved | Design by <a
						href="http://w3layouts.com/" target="_blank">Silan Tech</a>
				</p>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--//footer-->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

	<script src="../rikhi/js/simpleCart.min.js">
		
	</script>
	<!-- slide -->
	<script src="../rikhi/js/bootstrap.min.js"></script>

</body>
</html>
