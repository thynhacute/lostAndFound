<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
        <c:set value="${requestScope.ARTICLE_DETAIL}" var="D"/>
        <div class="single-product mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <c:choose>
                            <c:when test="${fn:contains(D.imgURL, 'https')}">
                                <div class="single-product-img">
                                    <img style="    width: 70%;
                                         height: 440px;" src="${D.imgURL}" alt="">
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="single-product-img">
                                    <img style="    width: 70%;
                                         height: 440px;" src="./file_upload/${D.imgURL}" alt="">
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-md-7">
                        <div class="single-product-content">
                            <h2>${D.itemName}</h2>
                            <p class="single-product-pricing">Location:<span>${D.locationName}</span></p>
                            <p class="single-product-pricing">Description: <span>${D.articleContent}.</span></p>
                            <p class="col-12"><strong>Post Time: </strong>${D.postTime}</p>
                            <p class="col-12"><strong>${D.articleTypeName}</strong></p>

                            <c:choose >
                                <c:when test="${sessionScope.LOGIN_MEMBER == null}">
                                    <a class="text-danger mb-5" href="login.jsp" >
                                <i class="far fa-flag mr-3"></i>Report</a>                                      
                                </c:when>
                                <c:otherwise>
                                    <a class="text-danger mb-5" data-toggle="modal" data-target="#modalVip">
                                <i class="far fa-flag mr-3"></i>Report</a>
                                </c:otherwise>                                  
                            </c:choose>                                  
                            <div class="single-product-form mt-5">
                                <ul>
                                    <li>
                                        <a href="#" class="cart-btn"><i class="fas fa-address-book"></i>
                                            Contact</a>
                                        <ul class="sub-menu">
                                            <li> Member: <a href="#">${D.fullName} </a></li>

                                            <li><i class="fas fa-phone"></i>&nbsp<a href="#">Phone: ${D.phone} </a></li>
                                            <li><i class="fas fa-mail-bulk"></i>&nbsp<a href="#">Email: ${D.email}</a></li>
                                            <br>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end single product -->

        <div class="modal fade" id="modalVip" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">

                    <div class="modal-header">

                        <h3 class="text-center" id="exampleModalLabel">Report</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                    </div>
                    <form action="ReportController" method="POST" >
                        <div class="modal-body">
                            <p class="mb-1"><strong>Reason</strong></p>
                            <textarea name="reportContent" class="w-100 p-2" rows="3" placeholder="Typing..."></textarea>
                        </div>
                        <input type="hidden" name="articleID" value="${D.articleID}" />
                        <input type="hidden" name="memberID" value="${sessionScope.LOGIN_MEMBER.id}" />

                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger text-light" >Send</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>


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