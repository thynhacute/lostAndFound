<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description"
              content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from
              https://imransdesign.com/">

        <!-- title -->
        <title>Shop</title>

        <!-- favicon -->
        <link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
        <!-- google font -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700"
              rel="stylesheet">
        <link
            href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap"
            rel="stylesheet">
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

        <!--PreLoader-->

        <%@include file="Components/navbarComponent.jsp" %>
        <div class="breadcrumb-section breadcrumb-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <p>FPT University</p>
                            <h1>User Found Article</h1>
                        </div>
                    </div>
                </div>                    
            </div>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #f5f5f5;">
                    <div class="container-fluid">

                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" href="UserLostController">Lost</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="profileUser.jsp">Profile</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="UserFoundController">Found</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <br>
                <br>

                <!-- products -->
                <div class="product-section mt-150 mb-150">
                    <div class="container">
                        <div class="row product-lists">
                            <div class="col-md-9">
                                <div class="row">
                                    <c:forEach items="${requestScope.LIST_FOUND}" var="LF">
                                        <div class="col-md-4 text-center strawberry">
                                            <a href="UpdateFoundController?render&id=${LF.articleID}">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <c:set var="img" value="${LF.imgURL}"/>
                                                        <c:choose>
                                                            <c:when test="${fn:contains(img, 'https://')}">
                                                                <img style="height: 150px;"
                                                                     src="${LF.imgURL}"
                                                                     alt="">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img style="height: 150px;"
                                                                     src="file_upload/${LF.imgURL}"
                                                                     alt="">
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </div>
                                                    <h3>${LF.itemName}</h3>
                                                    <p class="product-price"><span>${LF.phone}</span> ${LF.locationName} </p>
                                                    <p>${LF.fullName}</p>
                                                </div>
                                            </a>
                                        </div>
                                    </c:forEach>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <!-- end products -->

                <%@include file="Components/footerComponents.jsp" %>
                <div class="col-lg-6 text-right col-md-12">
                    <div class="social-icons">
                        <ul>
                            <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
                            <li><a href="#" target="_blank"><i class="fab fa-linkedin"></i></a></li>
                            <li><a href="#" target="_blank"><i class="fab fa-dribbble"></i></a></li>
                        </ul>
                    </div>
                </div>
        </div>
    </div>
</div>
<!-- end copyright -->

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