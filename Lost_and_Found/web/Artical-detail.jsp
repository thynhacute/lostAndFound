<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

        <!-- title -->
        <title>Artical detail</title>

        <!-- favicon -->
        <link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
        <!-- google font -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
        <!-- fontawesome -->
        <link rel="stylesheet" href="assets/css/all.min.css">
        <!-- bootstrap -->
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <!-- owl carousel -->
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <!-- magnific popup -->
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <!-- animate css -->
        <link rel="stylesheet" href="assets/css/animate.css">
        <!-- mean menu css -->
        <link rel="stylesheet" href="assets/css/meanmenu.min.css">
        <!-- main style -->
        <link rel="stylesheet" href="assets/css/main.css">
        <!-- responsive -->
        <link rel="stylesheet" href="assets/css/responsive.css">

    </head>
    <body>

        <%@include file="Components/navbarComponent.jsp" %>

        <!-- breadcrumb-section -->
        <div class="breadcrumb-section breadcrumb-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <p>FPT University</p>
                            <h1>Artical detail</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->

        <!-- single product -->
        <div class="single-product mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <div class="single-product-img">
                            <img src="assets/img/products/product-img-5.jpg" alt="">
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="single-product-content">
                            <h3>Quả táo hình cục cức</h3>
                            <p class="single-product-pricing">Location:<span>lầu 1</span></p>
                            <p class="single-product-pricing">Description: <span> Lorem ipsum dolor
                                    sit amet, consectetur adipisicing elit. Dicta sint
                                    dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae
                                    ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi!
                                    Tempora, earum.</span></p>
                            <div class="single-product-form">
                                <ul>
                                    <li>
                                        <a href="#" class="cart-btn"><i class="fas fa-address-book"></i>
                                            Contract:</a>
                                        <ul class="sub-menu">
                                            <li><i class="fas fa-phone"></i>&nbsp<a href="#">Phone: 01233444</a></li>
                                            <li><i class="fas fa-mail-bulk"></i>&nbsp<a href="#">Email: ngu@fpt.edu.vn</a></li>
                                            <li><i class="fas fa-exclamation-circle"></i>&nbsp<a
                                                    href="#">Report</a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <p><strong>Categories: </strong>Fruits, Organic</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end single product -->

        <%@include file="Components/footerComponents.jsp" %>

        <!-- jquery -->
        <script src="assets/js/jquery-1.11.3.min.js"></script>
        <!-- bootstrap -->
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <!-- count down -->
        <script src="assets/js/jquery.countdown.js"></script>
        <!-- isotope -->
        <script src="assets/js/jquery.isotope-3.0.6.min.js"></script>
        <!-- waypoints -->
        <script src="assets/js/waypoints.js"></script>
        <!-- owl carousel -->
        <script src="assets/js/owl.carousel.min.js"></script>
        <!-- magnific popup -->
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <!-- mean menu -->
        <script src="assets/js/jquery.meanmenu.min.js"></script>
        <!-- sticker js -->
        <script src="assets/js/sticker.js"></script>
        <!-- main js -->
        <script src="assets/js/main.js"></script>

    </body>
</html>