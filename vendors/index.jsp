
<%@page import="java.sql.ResultSet"%>
<%@page import="com.shonu.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <title>Diva - Beauty world</title>
        <meta charset="UTF-8">
        <meta name="description" content="Diva Beauty salon template">
        <meta name="keywords" content="diva, beauty, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Favicon -->   
        <link href="img/favicon.ico" rel="shortcut icon"/>

        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/font-awesome.min.css"/>
        <link rel="stylesheet" href="css/jquery-ui.min.css"/>
        <link rel="stylesheet" href="css/flaticon.css"/>
        <link rel="stylesheet" href="css/owl.carousel.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/animate.css"/>
        <script src="js/jquery-2.1.4.js"></script>
        <style>
            body {font-family: Arial, Helvetica, sans-serif;}

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 3; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */

                /* Modal Content */            }

            .modal-content {
                position: relative;
                background-color: #fefefe;
                margin: auto;
                padding: 0;
                border: 1px solid #888;
                width: 40%;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: animatetop;
                -webkit-animation-duration: 0.4s;
                animation-name: animatetop;
                animation-duration: 0.4s
            }

            /* Add Animation */
            @-webkit-keyframes animatetop {
                from {top:-300px; opacity:0} 
                to {top:0; opacity:1}
            }

            @keyframes animatetop {
                from {top:-300px; opacity:0}
                to {top:0; opacity:1}
            }

            /* The Close Button */
            .close {
                color: white;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

            .modal-header {
                padding: 2px 16px;
                background-color: #e22b63;
                color: white;
            }

            .modal-body {padding: 2px 16px;}

            .modal-footer {
                padding: 2px 16px;
                background-color: #e22b63;
                color: white;
            }
            body {font-family: Arial, Helvetica, sans-serif;}
            form {border: 3px solid #f1f1f1;}

            input[type=text], input[type=password], input[type=number], input[type=email] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            button {
                background-color: #4CAF50;
                color: white;
                height: 2.5rem;
                margin: 8px;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            button:hover {
                opacity: 0.8;
            }

            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                background-color: #f44336;
            }

            .imgcontainer {
                text-align: center;
                margin: 24px 0 12px 0;
            }

            img.avatar {
                width: 40%;
                border-radius: 50%;
            }

            .container {
                padding: 16px;
            }

            span.psw {
                float: right;
                padding-top: 16px;
            }

            /* Change styles for span and cancel button on extra small screens */
            @media screen and (max-width: 300px) {
                span.psw {
                    display: block;
                    float: none;
                }
                .cancelbtn {
                    width: 100%;
                }
            }
            #myBtn {
                color: #fff;
                font-size: 18px;
                padding: 53px 24px;
                transition: all 0.3s;
                width: 10rem;
                cursor: pointer;
            }
            .user-logo {
                width: 20%; 
            }
            .btnLink {
                background-color: #e22b63;
                width: 10rem;
            }
            .registerbtn {
                background-color: #e22b63;
                width: 10rem;
            }
            .dropbtn {
                background-color: #1c1e1c;
                color: white;
                padding: 16px;
                font-size: 16px;
                border: none;
            }

            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                top: 2.3rem;
                background-color:#fff;
                min-width: 30rem;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 2;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {background-color: #ddd;}

            .dropdown:hover .dropdown-content {display: grid;}

            .dropdown:hover .dropbtn {background-color: #1c1e1c; color: #e22b63; cursor: pointer;}
            /*e22b63*/
        </style>
        <script>
            $(document).ready(function () {
                $("#registerDiv").hide();
                $("#btnRegister").click(function () {
                    $("#loginDiv").slideUp();
                    $("#registerDiv").slideDown();
                });
                $("#btnSignin").click(function () {
                    $("#loginDiv").slideDown();
                    $("#registerDiv").slideUp();
                });
                $('#frmRegister').submit(function (e) {
                    var username = $('#txtName').val();
                    var email = $('#txtEmail').val();
                    var mobile = $('#txtMobile').val();
                    var password = $('#txtPassword').val();
                    var regEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
//                    var regEx = /^[A-Z0-9][A-Z0-9._%+-]{0,63}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/;
                    var validEmail = regEmail.test(email);
                    var regMobile = /^([7-9]{1})([0-9]{9})$/;
                    var validMobile = regMobile.test(mobile);
                    $(".error").remove();
                    if (username.length < 1) {
                        $('#txtName').after('<span class="error">This field is required</span><br>');
                        return false;
                    } else if (email.length < 1) {
                        $('#txtEmail').after('<span class="error">This field is required</span><br>');
                        return false;
                    } else if (!validEmail) {
                        $('#txtEmail').after('<span class="error">Enter a valid email</span><br>');
                        return false;
                    } else if (mobile.length < 1) {
                        $('#txtMobile').after('<span class="error">This field is required</span><br>');
                        return false;
                    } else if (!validMobile) {
                        $('#txtMobile').after('<span class="error">Enter a valid mobileno</span><br>');
                        return false;
                    } else if (password.length < 8) {
                        $('#txtPassword').after('<span class="error">Password must be at least 8 characters long</span><br>');
                        return false;
                    } else {
                        return true;
                    }
                });
            });
            $(document).ready(function () {
                $('.dropdown-submenu a.test').on("click", function (e) {
                    $(this).next('ul').toggle();
                    e.stopPropagation();
                    e.preventDefault();
                });
            });
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>



        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <%MyConnection con = new MyConnection();%>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header section -->
        <header class="header-section">
            <div class="header-warp">
                <!-- logo -->
                <a href="home.html" class="site-logo">
                    <img src="img/logo.png" alt="">
                </a>
                <!-- responsive -->
                <div class="nav-switch">
                    <i class="fa fa-bars"></i>
                </div>
                <!-- Navigation Menu -->
                <ul class="main-menu">

                    <li class="active"><a href="home.html">Home</a></li>
                        <%

                            String categoryTypeQuery = "SELECT * FROM EC_CATEGORYTYPE_MST";
                            ResultSet categoryTypeList = con.ReadRecord(categoryTypeQuery);
                            if (categoryTypeList != null) {
                                while (categoryTypeList.next()) {
                                    String categoryType = categoryTypeList.getString(2);
                        %>
                    <li>
                        <div class="dropdown">
                            <span class="dropbtn"><%=categoryType%></span>
                            <%
                                String categoryQuery = "SELECT * FROM EC_CATEGORY_MST WHERE ECTM_NAME ='" + categoryType + "'";
                                ResultSet categoryList = con.ReadRecord(categoryQuery);
                                if (categoryList != null) {
                            %>
                            <div class="dropdown-content">
                                <%
                                    while (categoryList.next()) {
                                        String category = categoryList.getString(2);
                                %>
                                <div>
                                    <h5><%=category%></h5>
                                    <%
                                        String subCategoryQuery = "SELECT * FROM EC_SUBcATEGORY_MST WHERE ECM_NAME ='" + category + "'";
                                        ResultSet subCategoryList = con.ReadRecord(subCategoryQuery);
                                        if (subCategoryList != null) {
                                    %>
                                    <div style="margin-left: 1rem;">

                                        <%
                                            while (subCategoryList.next()) {
                                                String subCategory = subCategoryList.getString(2);
                                        %>
                                        <div>
                                            <a href="index.jsp?<%=subCategory%>" style="padding: 0; color: #000"><%=subCategory%></a>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </li>

                    <%                            }
                        }
                    %>
                    <li><a href="about.html">About Us</a></li>
                    <li><a href="services.html">Services</a></li>
                    <li><a href="contact.html">Contact</a></li>
                        <%
                            if (session.getAttribute("user") == null) {
                        %>
                    <li><a id="myBtn">Login</a></li>
                        <%
                        } else {
                        %>
                    <li><a id="myBtn" href="user/Logout.jsp">Logout</a></li>
                        <%
                            }
                        %>


                </ul>

                <div class="header-right">
                    <a href="user/Cart.jsp" class="">
                        <i class="fa fa-shopping-cart" style="font-size: xx-large; color:#e22b63; "></i>
                    </a>

                </div>
            </div>
        </header>
        <!-- Header section end -->

        <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <div class="modal-header">
                    <span class="close">&times;</span>
                </div>
                <div class="modal-body">
                    <div id="loginDiv">
                        <form action="backend/LoginCode.jsp"method="post">
                            <center>
                                <div class="user-logo">
                                    <img src="img/login-image.png">
                                </div>
                            </center>
                            <div class="container">
                                <div>
                                    <label for="uname"><b>Username</b></label>
                                    <input type="text" placeholder="Enter Username" name="txtUsername" required>
                                </div>
                                <div>
                                    <label for="psw"><b>Password</b></label>
                                    <input type="password" placeholder="Enter Password" name="txtPassword" required>
                                </div>
                                <div>

                                    <button type="submit" name="btnLogin" class="btnLink">Login</button>
                                    <label>
                                        <input type="checkbox" checked="checked" name="remember"> Remember me
                                    </label>
                                </div>
                            </div>

                            <div class="container">
                                <button type="button" class="btnLink" id="btnRegister">New Registration</button>
                                <span class="psw">Forgot <a href="#">password?</a></span>
                            </div>
                        </form>
                    </div>
                    <div id="registerDiv">
                        <form action="backend/RegisterCode.jsp" method="POST" id="frmRegister">
                            <div class="container">
                                <h1>Register</h1>
                                <p>Please fill in this form to create an account.</p>
                                <hr> 
                                <label for="phoneno"><b>Name</b> </label>
                                <input type="text"placeholder="Enter Name" name="txtName" id="txtName">

                                <label for="phoneno"><b>Phone Number</b> </label>
                                <input type="number" placeholder="Enter No" name="txtMobile" id="txtMobile">

                                <label for="email"><b>Email</b></label>
                                <input type="email" placeholder="Enter Email" name="txtEmail"id="txtEmail">

                                <label for="psw"><b>Password</b></label>
                                <input type="password" placeholder="Enter Password" name="txtPassword"id="txtPassword">

                                <label for="psw-repeat"><b>Confirm Password</b></label>
                                <input type="password" placeholder="Confirm Password" name="txtConfirmPassword">
                                <hr>

                                <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
                                <button type="submit" class="registerbtn" name="btnSubmit">Register</button>
                            </div>

                            <div class="container signin">
                                <p><button type="button" class="btnLink" id="btnSignin">Sign in</button> if already a member</p>
                            </div>
                        </form>
                    </div>

                </div>

            </div>

        </div>
        <%
            if (request.getQueryString() == null) {
        %>
        <!-- Hero section -->
        <section class="hero-section set-bg" data-setbg="img/bg.jpg" >
            <div class="container">
                <div class="hero-slider owl-carousel">
                    <!-- slider item -->
                    <div class="hs-item">
                        <div class="hs-content text-white">
                            <h2>Be bold.<br>Be beautiful.</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris sceleri sque, at rutrum nulla dictum. Ut ac ligula sapien. Suspendisse cursus faucibus finibus.</p>
                            <a href="#" class="site-btn sb-big">See Offers</a>
                        </div>
                        <div class="hs-preview set-bg" data-setbg="img/hero-slider/1.jpg"></div>
                    </div>
                    <!-- slider item -->
                    <div class="hs-item">
                        <div class="hs-content text-white">
                            <h2>Be bold.<br>Be beautiful.</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris sceleri sque, at rutrum nulla dictum. Ut ac ligula sapien. Suspendisse cursus faucibus finibus.</p>
                            <a href="#" class="site-btn sb-big">See Offers</a>
                        </div>
                        <div class="hs-preview set-bg" data-setbg="img/hero-slider/1.jpg"></div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero section end -->


        <!-- intro section -->
        <section class="intro-section spad  set-bg" data-setbg="img/intro-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9">
                        <div class="intro-content">
                            <h2>Why Choose Us?</h2>
                            <p>In vitae nisi aliquam, scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat. Maecenas sollicitudin est in libero pretium interdum. Nullam volutpat dui sem, ac congue purus hendrerit, id lobortis leo luctus nec. In vitae nisi aliquam, scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat. Maecenas sollicitudin est in libero pretium interdum. Nullam volutpat dui sem, ac congue purus hendrerit, id lobortis leo luctus nec. </p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- fact -->
                    <div class="col-lg-3 col-sm-6 fact">
                        <i class="flaticon-016-woman"></i>
                        <h2>+3500</h2>
                        <p>Happy Clients</p>
                    </div>
                    <!-- fact -->
                    <div class="col-lg-3 col-sm-6 fact">
                        <i class="flaticon-020-mirror"></i>
                        <h2>12</h2>
                        <p>New Locations</p>
                    </div>
                    <!-- fact -->
                    <div class="col-lg-3 col-sm-6 fact">
                        <i class="flaticon-030-cream-1"></i>
                        <h2>+175</h2>
                        <p>Great Employees</p>
                    </div>
                    <!-- fact -->
                    <div class="col-lg-3 col-sm-6 fact">
                        <i class="flaticon-013-facial-mask-1"></i>
                        <h2>56K</h2>
                        <p>Instagram Followers</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- intro section end -->


        <!-- Services section -->
        <section class="services-section spad set-bg" data-setbg="img/service-bg.png">
            <div class="container">
                <div class="section-title text-white">
                    <h2>Our Services</h2>
                </div>
                <div class="row">
                    <!-- service -->
                    <div class="col-lg-4 col-md-6 service text-white">
                        <i class="flaticon-016-woman"></i>
                        <h2>Hair Dressing</h2>
                        <p>In vitae nisi aliquam, scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat.</p>
                    </div>
                    <!-- service -->
                    <div class="col-lg-4 col-md-6 service text-white">
                        <i class="flaticon-017-soap"></i>
                        <h2>Zen Massage</h2>
                        <p>Aliquam, scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat sollicitudin </p>
                    </div>
                    <!-- service -->
                    <div class="col-lg-4 col-md-6 service text-white">
                        <i class="flaticon-009-makeup-5"></i>
                        <h2>Manicure & Pedicure</h2>
                        <p>Scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat. Maecenas sollicitudin </p>
                    </div>
                    <!-- service -->
                    <div class="col-lg-4 col-md-6 service text-white">
                        <i class="flaticon-048-makeup"></i>
                        <h2>Make Up</h2>
                        <p>In vitae nisi aliquam, scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat.</p>
                    </div>
                    <!-- service -->
                    <div class="col-lg-4 col-md-6 service text-white">
                        <i class="flaticon-045-eyelid"></i>
                        <h2>Tanning Bed</h2>
                        <p>Aliquam, scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat sollicitudin </p>
                    </div>
                    <!-- service -->
                    <div class="col-lg-4 col-md-6 service text-white">
                        <i class="flaticon-015-facial-mask"></i>
                        <h2>Spa Treatments</h2>
                        <p>Scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat. Maecenas sollicitudin</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services section end -->


        <!-- Testimonials section -->
        <section class="testimonials-section set-bg" data-setbg="img/review-bg.jpg">
            <div class="container">
                <div class="section-title mb-0">
                    <h2>Client Testimonials</h2>
                </div>
                <div class="row">
                    <div class="col-lg-9">
                        <div class="testimonials-slider owl-carousel">
                            <!-- item -->
                            <div class="ts-item">
                                <div class="quota">“</div>
                                <p>In vitae nisi aliquam, scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat. Maecenas sollicitudin est in libero pretium interdum. Nullam volutpat dui sem, ac congue purus hendrerit, id lobortis leo luctus nec. In vitae nisi aliquam, scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat. </p>
                                <div class="ts-pic set-bg" data-setbg="img/review-author.jpg"></div>
                                <div class="ts-author-info">
                                    <h4>Maria Parker</h4>
                                    <span>Regular Client</span>
                                </div>
                            </div>
                            <!-- item -->
                            <div class="ts-item">
                                <div class="quota">“</div>
                                <p>In vitae nisi aliquam, scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat. Maecenas sollicitudin est in libero pretium interdum. Nullam volutpat dui sem, ac congue purus hendrerit, id lobortis leo luctus nec. In vitae nisi aliquam, scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat. </p>
                                <div class="ts-pic set-bg" data-setbg="img/review-author.jpg"></div>
                                <div class="ts-author-info">
                                    <h4>Maria Parker</h4>
                                    <span>Regular Client</span>
                                </div>
                            </div>
                            <!-- item -->
                            <div class="ts-item">
                                <div class="quota">“</div>
                                <p>In vitae nisi aliquam, scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat. Maecenas sollicitudin est in libero pretium interdum. Nullam volutpat dui sem, ac congue purus hendrerit, id lobortis leo luctus nec. In vitae nisi aliquam, scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat. </p>
                                <div class="ts-pic set-bg" data-setbg="img/review-author.jpg"></div>
                                <div class="ts-author-info">
                                    <h4>Maria Parker</h4>
                                    <span>Regular Client</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Testimonials section end -->
        <%
        } else {
        %>
        <section class="hero-section set-bg" data-setbg="img/bg.jpg" >
            <div class="container">
                <div class="row" style="display: grid; grid-template-columns: repeat(4,1fr);">
                    <%
                        String[] queryParameter = request.getQueryString().split("%20");
                        String subCategory = null;
                        if (queryParameter.length > 1) {
                            subCategory = queryParameter[0] + " " + queryParameter[1];
                        } else {
                            subCategory = queryParameter[0];
                        }
                        String query = String.format("SELECT * FROM EC_PRODUCT_DTL WHERE ESCM_NAME='%s'", subCategory);
                        ResultSet productList = con.ReadRecord(query);
                        if (productList != null) {
                            while (productList.next()) {
                                int id = productList.getInt(1);
                                String name = productList.getString(2);
                                String brand = productList.getString(3);
                                String shade = productList.getString(4);
                                double price = productList.getDouble(5);
                                int quantity = productList.getInt(6);
                                String description = productList.getString(7);
                                String photo = productList.getString(8);

                    %>
                    <div class="col-md-3 text-white" style="max-width: 100%;">
                        <a href="Single.jsp?<%=id%>">
                            <img src="ProductPhotos/<%=photo%>" class="my-3" style="" /><br>
                            <span style="color: <%=shade%>;"><%=name%></span>
                            <p>Price: <%=price%></p>
                        </a>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </section>

        <%
            }
        %>
        <!-- brands section -->
        <div class="brands-section set-bg" data-setbg="img/brands-bg.jpg">
            <div class="brands-slider owl-carousel">
                <div class="bs-item">
                    <img src="img/brands/1.png" alt="">
                </div>
                <div class="bs-item">
                    <img src="img/brands/2.png" alt="">
                </div>
                <div class="bs-item">
                    <img src="img/brands/3.png" alt="">
                </div>
                <div class="bs-item">
                    <img src="img/brands/4.png" alt="">
                </div>
                <div class="bs-item">
                    <img src="img/brands/5.png" alt="">
                </div>
            </div>
        </div>
        <!--  brands section end -->

        <!-- Footer section -->
        <footer class="footer-section set-bg" data-setbg="img/footer-bg.jpg">
            <div class="footer-warp">
                <div class="footer-widgets">
                    <div class="row">
                        <div class="col-xl-7 col-lg-7">
                            <div class="row">
                                <div class="col-xl-4 col-lg-5 col-md-6">
                                    <div class="footer-widget about-widget">
                                        <img src="img/logo.png" alt="">
                                        <p>In vitae nisi aliquam, scelerisque leo a, volu- tpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat.</p>
                                        <div class="fw-social">
                                            <a href=""><i class="fa fa-pinterest"></i></a>
                                            <a href=""><i class="fa fa-facebook"></i></a>
                                            <a href=""><i class="fa fa-twitter"></i></a>
                                            <a href=""><i class="fa fa-dribbble"></i></a>
                                            <a href=""><i class="fa fa-behance"></i></a>
                                            <a href=""><i class="fa fa-linkedin"></i></a>
                                        </div>
                                    </div> 
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 offset-xl-2 offset-lg-1 offset-md-0">
                                    <div class="footer-widget list-widget">
                                        <h4 class="fw-title"><i class="flaticon-009-makeup-5"></i>Our Services</h4>
                                        <ul>
                                            <li><a href="">Manicure</a></li>
                                            <li><a href="">Pedicure</a></li>
                                            <li><a href="">Massage</a></li>
                                            <li><a href="">Hair Dressing</a></li>
                                            <li><a href="">Spa</a></li>
                                            <li><a href="">Pedicure</a></li>
                                            <li><a href="">Beauty treatments </a></li>
                                        </ul>
                                        <ul>
                                            <li><a href="">Wedding Hair</a></li>
                                            <li><a href="">Manicure</a></li>
                                            <li><a href="">Pedicure</a></li>
                                            <li><a href="">Massage</a></li>
                                            <li><a href="">Hair Dressing</a></li>
                                            <li><a href="">Botox</a></li>
                                            <li><a href="">Slimming </a></li>
                                        </ul>
                                    </div> 
                                </div>
                            </div>	
                        </div>
                        <div class="col-xl-4 col-lg-5 offset-xl-1 offset-lg-0 offset-md-0">
                            <div class="footer-widget contact-widget">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom">
                    <div class="footer-nav">
                        <ul>
                            <li><a href="">Home</a></li>
                            <li><a href="">About us</a></li>
                            <li><a href="">Services</a></li>
                            <li><a href="">News</a></li>
                            <li><a href="">Contact</a></li>
                        </ul>
                    </div>
                    <div class="copyright">
                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer section end -->


        <!--====== Javascripts & Jquery ======-->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/circle-progress.min.js"></script>
        <script src="js/main.js"></script>
        <script>
// Get the modal
            var modal = document.getElementById("myModal");
// Get the button that opens the modal
            var btn = document.getElementById("myBtn");
// Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];
// When the user clicks the button, open the modal 
            btn.onclick = function () {
                modal.style.display = "block";
            }

// When the user clicks on <span> (x), close the modal                 
            span.onclick = function () {
                modal.style.display = "none";
            }

// When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>

    </body>
</html>