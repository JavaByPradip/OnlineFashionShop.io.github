

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
                            <img src="rikhi/img/logo.png" alt="">
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
        <div style="margin-top: 10rem;">
            <div style='width: 20%;'>
                <form action='ViewBookings.jsp' method='POST'>
                    <input type='email' name='txtEmail' class='form-control' />
                    <input type='submit' name='btnSubmit' value='Search' />
                </form>
            </div>
            
                <%
                    MyConnection con = new MyConnection();
                    String query = "SELECT * FROM EB_CART_DTL";
                    if (request.getParameter("txtEmail") != null) {
                        String email = request.getParameter("txtEmail");
                        String user = con.ReadOneData("EB_USER_MST", "EUM_ID", "EUM_EMAIL='" + email + "'");
                        if (user != null) {
                            int userId = Integer.parseInt(user);
                            query = "SELECT * FROM EB_CART_DTL WHERE EUM_ID=" + userId;
                        }
                    }

                    ResultSet bookings = con.ReadRecord(query);
                    if (bookings != null) {
                %>
                <table border='1'>
                    <tr>
                        <th></th>
                        <th>User Name</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Date</th>
                    </tr>
                    <%
                        while (bookings.next()) {
                            String userName = con.ReadOneData("EB_USER_MST", "EUM_NAME", "EUM_ID=" + bookings.getInt(5));

                            String productName = con.ReadOneData("EB_PRODUCT_MST", "EPM_NAME", "EPM_ID=" + bookings.getInt(6));
                            String photo = con.ReadOneData("EB_PRODUCT_MST", "EPM_PHOTO", "EPM_ID=" + bookings.getInt(6));
                            double price = bookings.getDouble(4);
                            int quantity = bookings.getInt(3);
                            String date = bookings.getString(2);
                             
                    %>
                    <tr>
                        <td><img src="../ProductPhotos/<%=photo%>" style="width: 20%;"/></td>
                        <td><%=userName%></td>
                        <td><%=productName%></td>
                        <td><%=price%></td>
                        <td><%=quantity%></td>
                        <td><%=date%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>   
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
        <script src="rikhi/js/stellar.js"></script>
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

