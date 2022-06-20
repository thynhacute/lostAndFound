<%@page import="ArticleType.ArticleTypeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">
        <!-- title -->
        <title>Home</title>
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
                            <h1>Finding</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->
        <!-- products -->
        <div class="product-section mt-150 mb-150">
            <div class="container">               
                <div class="row product-lists">
                    <div class="col-md-3">
                        <div class="element ">
                            <div class=" finder-tabs col-md-12">
                                <h4 class="case27">What do you want to search?</h4>
                                <p></p>
                            </div>
                            <form action="HomeController" method="POST">
                                <div class="type-dropdown">
                                    <label for="">Listing Type</label>
                                    <div>
                                        <c:set var="searchByType" value = "${param.searchByType}" />
                                        <select name="searchByType" class ="box" >
                                            <option hidden="" value="all">All</option>
                                            <option  value="all">All</option>
                                            <c:forEach items="${sessionScope.LIST_ARTICLE_TYPE}" var="type">
                                                <option value="${type.articleTypeID}">${type.articleTypeName}</option>
                                            </c:forEach>
                                        </select>

                                    </div>
                                    <br>
                                    <label for="">Type Items</label>
                                    <div>
                                        <select name="" id="" class="box">
                                            <option value="">Lost Items</option>
                                            <option value="">Picked Items</option>
                                        </select>
                                    </div>
                                    <br>
                                    <label for="">Location</label>
                                    <div>
                                        <c:set var="searchByLocation" value="${param.searchByLocation}"/>
                                        <select name="searchByLocation" class="box">
                                            <option hidden="" value="all">All</option>
                                            <option value="all">All</option>
                                            <c:forEach items="${sessionScope.LIST_LOCATION}" var="Location">
                                                <option value="${Location.locationID}">${Location.locationName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <br>
                                    <nav class="main-menu">
                                        <ul class="map">
                                            <li><a href="#">Map FPTU</a>
                                                <ul class="sub-menu">
                                                    <li><a href="404.html">G</a></li>
                                                    <li><a href="404.html">1</a></li>
                                                    <li><a href="404.html">2</a></li>
                                                    <li><a href="404.html">3</a></li>
                                                    <li><a href="404.html">4</a></li>

                                                </ul>
                                            </li>
                                        </ul>


<!--                            <form action="HomeController">
                                <div class="type-dropdown">
                                    <label for="">Listing Type</label>
                                    <div>
                                        <select name="" id="" class="box">
                                            <option value="">Lost Items</option>
                                            <option value="">Picked Items</option>
                                        </select>
                                    </div>
                                    <br>
                                    <label for="">Type Items</label>
                                    <div>
                                        <select name="" id="" class="box">
                                            <option value="">Lost Items</option>
                                            <option value="">Picked Items</option>
                                        </select>
                                    </div>
                                    <br>
                                    <label for="">Location</label>
                                    <div>
                                        <select name="searchByLocation" class="box">
                                            <option hidden="" value="all">All</option>
                                            <option value="all">All</option>
                                        </select>
                                    </div>
                                    <br>
                                    <nav class="main-menu">
                                        <ul class="map">
                                            <li><a href="#">Map FPTU</a>
                                                <ul class="sub-menu">
                                                    <li><a href="404.html">G</a></li>
                                                    <li><a href="404.html">1</a></li>
                                                    <li><a href="404.html">2</a></li>
                                                    <li><a href="404.html">3</a></li>
                                                    <li><a href="404.html">4</a></li>

                                                </ul>
                                            </li>
                                        </ul>-->


                                    </nav>
                                    <br>
                                    <br>
                                    <button type="submit" class="btn  btn-lg active btn-search"
                                            >Search</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-9">                       
                        <div class="row">
                            <c:forEach items="${LIST_ARTICLE}" var="A">
                                <div class=" col-md-4 text-center strawberry" >
                                    <div class="single-product-item" style="height: 450px">
                                        <div class="product-image">
                                            <a href="#"><img style="height: 150px;" src="${A.imgURL}"/></a>
                                        </div>
                                        <h3>${A.itemName}</h3>
                                        <p class="product-price"><span>${A.phone}</span> ${A.locationName} </p>
                                        <p>${A.fullName}</p>
                                    </div>
                                </div>
                            </c:forEach>                    
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end products -->

        <!-- logo carousel -->
        <div class="logo-carousel-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="logo-carousel-inner">
                            <div class="single-logo-item">
                                <img src="assets/img/company-logos/1.png" alt="">
                            </div>
                            <div class="single-logo-item">
                                <img src="assets/img/company-logos/2.png" alt="">
                            </div>
                            <div class="single-logo-item">
                                <img src="assets/img/company-logos/3.png" alt="">
                            </div>
                            <div class="single-logo-item">
                                <img src="assets/img/company-logos/4.png" alt="">
                            </div>
                            <div class="single-logo-item">
                                <img src="assets/img/company-logos/5.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end logo carousel -->

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