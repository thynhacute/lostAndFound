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
                            <div class="single-product-form ">
                                <ul class="contact-a">
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
                                <br>
                                <br>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
            <div class="container mt-5">
                <div class="d-flex  row">
                    <div class="col-md-12">
                        <div class="d-flex flex-column comment-section">
                            <div class="bg-white">
                                <div class="d-flex flex-row fs-12">
                                    <div class="like p-2 cursor" style="width: 4rem"><i class="fas fa-thumbs-up"></i><span
                                            class="ml-1" >Like</span></div>
                                    <div class="like p-2 cursor "><i class="fas fa-comment-dots"></i></i><span
                                            class="ml-1" >Comment</span></div>
                                    <div class="like p-2 cursor"><i class="fa fa-share"></i><span
                                            class="ml-1">Share</span></div>
                                </div>
                            </div>
                            <div class="bg-white p-2">
                                <div class="d-flex flex-row align-items-start">
                                    <img class="rounded-circle" src="assets/img/avaters/avatar1.png" width="40">
                                    <textarea
                                        class="form-control ml-1 shadow-none textarea"></textarea></div>
                                <div class="mt-2 text-right"><button class="btn btn-primary btn-sm shadow-none"
                                                                     type="button"><i class="fas fa-paper-plane"></i> &nbsp Post</button><button
                                                                     class="btn btn-outline-primary btn-sm ml-1 shadow-none"
                                                                     type="button">Cancel</button></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row d-flex ">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="comment-widgets">
                                <!-- Comment Row -->
                                <div class="d-flex flex-row comment-row m-t-0">
                                    <div class="p-2"><img src="assets/img/avaters/avatar1.png" alt="user" width="50" class="rounded-circle"></div>
                                    <div class="comment-text w-100">
                                        <h6 class="font-medium">James Thomas</h6> <span class="m-b-15 d-block">This is awesome website. I would love to comeback again. </span>
                                        <div class="comment-footer"> <span class="text-muted float-right">April 14, 2019</span></div>
                                    </div>
                                </div> <!-- Comment Row -->
                                <div class="d-flex flex-row comment-row">
                                    <div class="p-2"><img src="assets/img/avaters/avatar1.png" alt="user" width="50" class="rounded-circle"></div>
                                    <div class="comment-text active w-100">
                                        <h6 class="font-medium">Michael Hussey</h6> <span class="m-b-15 d-block">Thanks bbbootstrap.com for providing such useful snippets. </span>
                                        <div class="comment-footer"> <span class="text-muted float-right">May 10, 2019</span></div>
                                    </div>
                                </div> <!-- Comment Row -->
                                <div class="d-flex flex-row comment-row">
                                    <div class="p-2"><img src="assets/img/avaters/avatar1.png" alt="user" width="50" class="rounded-circle"></div>
                                    <div class="comment-text w-100">
                                        <h6 class="font-medium">Johnathan Doeting</h6> <span class="m-b-15 d-block">Great industry leaders are not the real heroes of stock market. </span>
                                        <div class="comment-footer"> <span class="text-muted float-right">August 1, 2019</span></div>
                                    </div>
                                </div>
                            </div> <!-- Card -->
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