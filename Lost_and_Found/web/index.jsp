<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description"
              content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

        <!-- title -->
        <title>Page</title>

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
        <!-- hero area -->
        <div class="hero-area hero-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 offset-lg-2 text-center">
                        <div class="hero-text">
                            <div class="hero-text-tablecell">
                                <p class="subtitle">FPT University</p>
                                <h1>Find your lost items anywhere in FPTU </h1>
                                <div class="hero-btns">
                                    <a href="HomeController" class="boxed-btn">Find Items</a>
                                    <a href="postNews.jsp" class="bordered-btn">Post News</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end hero area -->

        <!-- features list section -->
        <div class="list-section pt-80 pb-80">
            <div class="container">

                <div class="row">
                    <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                        <div class="list-box d-flex align-items-center">
                            <div class="list-icon">
                                <i class="fas fa-shipping-fast"></i>
                            </div>
                            <div class="content">
                                <h3>Flash & safe</h3>
                                <p>help you find items quickly</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                        <div class="list-box d-flex align-items-center">
                            <div class="list-icon">
                                <i class="fas fa-phone-volume"></i>
                            </div>
                            <div class="content">
                                <h3>24/7 Support</h3>
                                <p>Get support all day</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="list-box d-flex justify-content-start align-items-center">
                            <div class="list-icon">
                                <i class="fas fa-sync"></i>
                            </div>
                            <div class="content">
                                <h3>Blog</h3>
                                <p>The secret to finding lost items</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- end features list section -->

        <!-- product Lost section -->
        <div class="product-section mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="section-title">
                            <h3><span class="orange-text"> NEW </span> Lost Articles</h3>
                        </div>
                    </div>
                </div>                                
                <div class="row">
                    <c:forEach items="${requestScope.LIST_LOST_ARTICLE}" var="L">
                        <div class=" col-lg-4 text-center strawberry">
                            <div class="single-product-item" style="height: 450px; width: 80%" >
                                <div class="product-image">
                                    <a href="DetailArticleController?articleID=${L.articleID}">
                                        <img style="height: 150px;" src="${L.imgURL}" />
                                    </a>
                                </div>
                                <h3>${L.itemName}</h3>
                                <p class="product-price"><span>${L.phone}</span>${L.locationName} </p>
                                <p>${L.fullName}</p>
                            </div>
                        </div>     
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- end product 1 section -->

        <!-- product picked up section -->
        <div class="product-section mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="section-title">
                            <h3><span class="orange-text">NEW </span> picked Articles</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${requestScope.LIST_PICKED_ARTICLE}" var="P">
                        <div class=" col-lg-4 text-center strawberry ">
                            <div class="single-product-item" style="height: 450px; width: 80%">
                                <div class="product-image">
                                    <a href="DetailArticleController?articleID=${P.articleID}"><img style="height: 150px;" src="${P.imgURL}" /></a>
                                </div>
                                <h3>${P.itemName}</h3>
                                <p class="product-price"><span>${P.phone}</span>${P.locationName} </p>
                                <p>${P.fullName}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- end product 2 section -->

            <!-- latest news -->
            <div class="latest-news pt-150 pb-150">
                <div class="container">

                    <div class="row">
                        <div class="col-lg-8 offset-lg-2 text-center">
                            <div class="section-title">
                                <h3><span class="orange-text">Our</span> Blog</h3>
                                <p>Guide to finding lost items.</p>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="single-latest-news">
                                <a href="blog-detail.jsp">
                                    <div class="latest-news-bg news-bg-1"></div>
                                </a>
                                <div class="news-text-box">
                                    <h3><a href="blog-detail.jsp">You will vainly look for fruit on it in autumn.</a></h3>
                                    <p class="blog-meta">
                                        <span class="author"><i class="fas fa-user"></i> Admin</span>
                                        <span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
                                    </p>
                                    <p class="excerpt">Vivamus lacus enim, pulvinar vel nulla sed, scelerisque rhoncus nisi.
                                        Praesent vitae mattis nunc, egestas viverra eros.</p>
                                    <a href="blog-detail.jsp" class="read-more-btn">read more <i
                                            class="fas fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="single-latest-news">
                                <a href="blog-detail.jsp">
                                    <div class="latest-news-bg news-bg-2"></div>
                                </a>
                                <div class="news-text-box">
                                    <h3><a href="blog-detail.jsp">A man's worth has its season, like tomato.</a></h3>
                                    <p class="blog-meta">
                                        <span class="author"><i class="fas fa-user"></i> Admin</span>
                                        <span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
                                    </p>
                                    <p class="excerpt">Vivamus lacus enim, pulvinar vel nulla sed, scelerisque rhoncus nisi.
                                        Praesent vitae mattis nunc, egestas viverra eros.</p>
                                    <a href="blog-detail.jsp" class="read-more-btn">read more <i
                                            class="fas fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0">
                            <div class="single-latest-news">
                                <a href="blog-detail.jsp">
                                    <div class="latest-news-bg news-bg-3"></div>
                                </a>
                                <div class="news-text-box">
                                    <h3><a href="blog-detail.jsp">Good thoughts bear good fresh juicy fruit.</a></h3>
                                    <p class="blog-meta">
                                        <span class="author"><i class="fas fa-user"></i> Admin</span>
                                        <span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
                                    </p>
                                    <p class="excerpt">Vivamus lacus enim, pulvinar vel nulla sed, scelerisque rhoncus nisi.
                                        Praesent vitae mattis nunc, egestas viverra eros.</p>
                                    <a href="blog-detail.jsp" class="read-more-btn">read more <i
                                            class="fas fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <a href="blog.jsp" class="boxed-btn">More News</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end latest news -->



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
            <%@include file="Components/footerComponents.jsp" %>
    </body>

</html>