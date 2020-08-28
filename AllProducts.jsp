

<%@page import="java.sql.ResultSet"%>
<%@page import="com.shonu.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="rikhi/img/favicon.png" type="image/png">
        <title>FASHIOP</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="rikhi/css/bootstrap.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="rikhi/css/font-awesome.min.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="vendors/lightbox/simpleLightbox.css">
        <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="vendors/animate-css/animate.css">
        <link rel="stylesheet" href="vendors/jquery-ui/jquery-ui.css">
        <!-- main css -->
        <link rel="stylesheet" href="rikhi/css/style.css">
        <link rel="stylesheet" href="rikhi/css/responsive.css">
    </head>

    <body>

        <!--================Header Menu Area =================-->
        <header class="header_area">
            <div class="main_menu">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <a class="navbar-brand logo_h" href="index.html">
                            <img src="img/logo.png" alt="">
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                            <div class="row w-100">
                                <div class="col-lg-7 pr-0">
                                    <ul class="nav navbar-nav center_nav pull-right">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="AdminHome.jsp">Home</a>
                                        </li>
                                        <li class="nav-item active">
                                            <a class="nav-link" href="AddCategories.jsp">Add Category</a>
                                        </li>
                                        <li class="nav-item active">
                                            <a class="nav-link" href="AddProduct.jsp">Add Product</a>
                                        </li>
                                        <li class="nav-item active">
                                            <a class="nav-link" href="AllProducts.jsp">View All Products</a>
                                        </li>
                                        <li class="nav-item active">
                                            <a class="nav-link" href="ViewBookings.jsp">View Bookings</a>
                                        </li>
                                    </ul>
                                </div>

                                <div class="col-lg-5">
                                    <ul class="nav navbar-nav navbar-right right_nav pull-right">
                                        <hr>
                                       
                                        <hr>

                                        
                                        <hr>

                                        

                                        <hr>

                                        <li class="nav-item">
                                            <a href="MyBookings.jsp" class="icons">
                                                <i class="lnr lnr lnr-cart"></i>
                                            </a>
                                        </li>

                                        <hr>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
        <!--================Header Menu Area =================-->
        <div style="margin-top: 5rem;">
            <%
                MyConnection con = new MyConnection();
                String query = "SELECT * FROM EB_PRODUCT_MST";
                ResultSet productList = con.ReadRecord(query);
                if (productList != null) {
            %>
            <div>
                <%
                    while (productList.next()) {
                %>
                <div class="row" style="border-bottom: 1px solid lightgray;">
                    <div class="col-md-3">
                       
                            <img src="../rikhi/ProductPhotos/<%=productList.getString(8)%>" style="width: 60%;" /><br>
                            <h4><%=productList.getString(2)%></h4>
                        </center>
                    </div>
                    <div class="col-md-9">
                        
                        <p>Brand:<%=productList.getString(3)%></p>
                        <p>Size:<%=productList.getString(4)%></p>
                        <p>Color:<%=productList.getString(5)%></p>
                        <p>Material:<%=productList.getString(6)%></p>
                        <p>Price:<%=productList.getString(7)%></p>
                        <p>Quantity:<%=productList.getString(10)%></p>
                    </div>
                </div>
                <%
                    }
                %>
            </div>

            <%
                }
            %>
        </div>
        <!--================Clients Logo Area =================-->
        <section class="clients_logo_area">
            <div class="container-fluid">
                <div class="clients_slider owl-carousel">
                    <div class="item">
                        <img src="rikhi/img/clients-logo/c-logo-1.png" alt="">
                    </div>
                    <div class="item">
                        <img src="rikhi/img/clients-logo/c-logo-2.png" alt="">
                    </div>
                    <div class="item">
                        <img src="rikhi/img/clients-logo/c-logo-3.png" alt="">
                    </div>
                    <div class="item">
                        <img src="rikhi/img/clients-logo/c-logo-4.png" alt="">
                    </div>
                    <div class="item">
                        <img src="rikhi/img/clients-logo/c-logo-5.png" alt="">
                    </div>
                </div>
            </div>
        </section>
        <!--================End Clients Logo Area =================-->


        <!--================ start footer Area  =================-->
        <footer class="footer-area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6 class="footer_title">About Us</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6 class="footer_title">Newsletter</h6>
                            <p>Stay updated with our latest trends</p>
                            <div id="mc_embed_signup">
                                <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                      method="get" class="subscribe_form relative">
                                    <div class="input-group d-flex flex-row">
                                        <input name="EMAIL" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address '"
                                               required="" type="email">
                                        <button class="btn sub-btn">
                                            <span class="lnr lnr-arrow-right"></span>
                                        </button>
                                    </div>
                                    <div class="mt-10 info"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-footer-widget instafeed">
                            <h6 class="footer_title">Instagram Feed</h6>
                            <ul class="list instafeed d-flex flex-wrap">
                                <li>
                                    <img src="rikhi/img/instagram/Image-01.jpg" alt="">
                                </li>
                                <li>
                                    <img src="rikhi/img/instagram/Image-02.jpg" alt="">
                                </li>
                                <li>
                                    <img src="rikhi/img/instagram/Image-03.jpg" alt="">
                                </li>
                                <li>
                                    <img src="rikhi/img/instagram/Image-04.jpg" alt="">
                                </li>
                                <li>
                                    <img src="rikhi/img/instagram/Image-05.jpg" alt="">
                                </li>
                                <li>
                                    <img src="rikhi/img/instagram/Image-06.jpg" alt="">
                                </li>
                                <li>
                                    <img src="rikhi/img/instagram/Image-07.jpg" alt="">
                                </li>
                                <li>
                                    <img src="rikhi/img/instagram/Image-08.jpg" alt="">
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="single-footer-widget f_social_wd">
                            <h6 class="footer_title">Follow Us</h6>
                            <p>Let us be social</p>
                            <div class="f_social">
                                <a href="#">
                                    <i class="fa fa-facebook"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-twitter"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-dribbble"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-behance"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row footer-bottom d-flex justify-content-between align-items-center">
                    <p class="col-lg-12 footer-text text-center"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Silan Tech</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </footer>
        <!--================ End footer Area  =================-->



        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="rikhi/js/jquery-3.2.1.min.js"></script>
        <script src="rikhi/js/popper.js"></script>
        <script src="rikhi/js/bootstrap.min.js"></script>
        <script src="js/stellar.js"></script>
        <script src="vendors/lightbox/simpleLightbox.min.js"></script>
        <script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
        <script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
        <script src="vendors/isotope/isotope-min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="rikhi/js/jquery.ajaxchimp.min.js"></script>
        <script src="vendors/counter-up/jquery.waypoints.min.js"></script>
        <script src="vendors/flipclock/timer.js"></script>
        <script src="vendors/counter-up/jquery.counterup.js"></script>
        <script src="rikhi/js/mail-script.js"></script>
        <script src="rikhi/js/theme.js"></script>
    </body>

</html>

