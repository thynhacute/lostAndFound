<%@page import="like.LikeDTO"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

        <!-- title -->
        <title>Article Detail</title>


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
        <c:if test="${sessionScope.LOGIN_MEMBER.roleID == 1}">
            <c:redirect url="login.jsp"/>           
        </c:if>  
        <%@include file="Components/navbarComponent.jsp" %>

        <!-- breadcrumb-section -->
        <div class="breadcrumb-section breadcrumb-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <p>FPT University</p>
                            <h1>Article Detail</h1>
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
                            <p class="single-product-pricing"><h3>${D.itemName} &nbsp / &nbsp ${D.articleTypeName} </h3></p>
                            <p class="single-product-pricing">Location:<span>${D.locationName}</span></p>
                            <p class="single-product-pricing">Description: <span>${D.articleContent}.</span></p>
                            <p class="col-12" style="padding-left: 0; margin-bottom: 10px" ><strong>Post Time: </strong>${D.postTime}</p>
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
                                            <li><i class="fas fa-phone"></i>&nbsp<a href="#">Phone: (+84) ${D.phone} </a></li>
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
                            <input type="hidden" name="fullName" value="${D.fullName}" />
                            <input type="hidden" name="articleContent" value="${D.articleContent}" />
                            <input type="hidden" name="articleID" value="${D.articleID}" />
                            <input type="hidden" name="email" value="${D.email}" />
                            <input type="hidden" name="articleMemberID" value="${D.memberID}" />
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
                                    <c:choose >
                                        <c:when test="${sessionScope.LOGIN_MEMBER == null}">
                                            <button type="submit" name="action" value="Like" class="like_btn" style="outline: none;">
                                                <a class="text-danger mb-5" href="login.jsp" >
                                                    <span id="icon"><i class="far fa-thumbs-up icon-2"></i></span>
                                                    <span id="count">${D.totalLike}</span>
                                                    <span id="like">Like</span>
                                                </a>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="submit" name="action" value="Like" class="like_btn" style="outline: none;">
                                                <a href="LikeArticleController?articleID=${D.articleID}&memberID=${D.memberID}">
                                                    <span id="icon"><i class="far fa-thumbs-up icon-2"></i></span>
                                                    <span id="count">${D.totalLike}</span>
                                                    <span id="like">Like
                                                    </span>
                                                </a>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                    <a style="text-decoration: none;" class="like text-dark p-2 cursor"><i  class="fas fa-comment-dots icon-2"></i><span
                                            class="ml-1">Comment</span></a>
                                </div>
                            </div>
                            <form action="CommentController" method="POST">
                                <input type="hidden" name="articleID" value="${D.articleID}" />
                                <input type="hidden" name="memberID" value="${D.memberID}"/>
                                <div class="bg-white p-2">
                                    <c:choose >
                                        <c:when test="${sessionScope.LOGIN_MEMBER == null}">
                                            <div class="d-flex flex-row align-items-start">
                                                <img class="rounded-circle"  src="http://phunuvietnam.mediacdn.vn/media/news/33abffcedac43a654ac7f501856bf700/anh-profile-tiet-lo-g-ve-ban-1.jpg" width="40">
                                                <textarea class="form-control ml-1 shadow-none textarea" id="comment"  name="commentContent" ></textarea>
                                            </div>
                                            <div class="mt-2 text-right">
                                                <a class="btn btn-primary btn-sm shadow-none" href="login.jsp">
                                                    <i class="fas fa-paper-plane"></i> &nbsp Post</a>
                                                <button class="btn btn-outline-primary btn-sm ml-1 shadow-none" type="reset">Cancel</button>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="d-flex flex-row align-items-start">
                                                <img class="rounded-circle" src="${sessionScope.LOGIN_MEMBER.picture}" width="40">
                                                <textarea class="form-control ml-1 shadow-none textarea" id="comment" required="" placeholder="Typing..." name="commentContent" ></textarea>
                                            </div>
                                            <div class="mt-2 text-right">
                                                <button class="btn btn-primary btn-sm shadow-none" type="submit">
                                                    <i class="fas fa-paper-plane"></i> &nbsp Post</button>
                                                <button class="btn btn-outline-primary btn-sm ml-1 shadow-none" type="reset">Cancel</button>
                                            </div>
                                        </c:otherwise>                                  
                                    </c:choose>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row d-flex ">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="comment-widgets">
                                <!-- Comment Row -->
                                <c:forEach items="${requestScope.LIST_COMMENTS}" var="C">                                  
                                    <div class="d-flex flex-row comment-row m-t-0">
                                        <div class="p-2"><img src="${C.picture}" alt="user" width="50" class="rounded-circle"></div>
                                        <div class="comment-text w-100">
                                            <h6 class="font-medium">${C.fullName}</h6> <span class="m-b-15 d-block">${C.commentContent}</span>
                                            <div class="comment-footer"> <span class="text-muted float-right">${C.commentTime}</span></div>
                                        </div>
                                    </div> 
                                </c:forEach>
                                <!-- Comment Row -->            
                            </div> <!-- Card -->
                        </div>
                    </div>
                </div>
            </div>  

        </div>
        <!-- end single product -->
        <c:if test="${requestScope.SUCCESS_MESSAGE != null}">
            <div class="toast-container" aria-atomic="true" style="  position: relative; min-height: 20px;">
                <div id="liveToast" class="toast" role="alert" aria-live="assertive" data-delay="4000"
                     style="position: fixed; bottom: 20px; right: 15px;">
                    <div class="toast-header">
                        <img src="assets/img/logoteam/logoteam.png" width="6%" class="rounded me-2" alt="">
                        <strong style="color: #e88123"  class="mr-auto">Notification</strong>
                        <small> &nbsp &nbsp Now</small>
                        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                            <span aria-hidden="true">&nbsp &nbsp &nbsp &times;</span>
                        </button>
                    </div>
                    <div class="toast-body">
                        <p>Comment Success</p>
                    </div>
                </div>
            </div>
        </c:if>  
        <c:if test="${requestScope.SUCCESS_MESSAGE_REPORT != null}">
            <div class="toast-container" aria-atomic="true" style="  position: relative; min-height: 20px;">
                <div id="liveToast" class="toast" role="alert" aria-live="assertive" data-delay="4000"
                     style="position: fixed; bottom: 20px; right: 15px;">
                    <div class="toast-header">
                        <img src="assets/img/logoteam/logoteam.png" width="6%" class="rounded me-2" alt="">
                        <strong style="color: #e88123"  class="mr-auto">Notification</strong>
                        <small> &nbsp &nbsp Now</small>
                        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                            <span aria-hidden="true">&nbsp &nbsp &nbsp &times;</span>
                        </button>
                    </div>
                    <div class="toast-body">
                        <p>You have successfully report ${D.fullName} post</p>
                    </div>
                </div>
            </div>
        </c:if>  

        <c:if test="${requestScope.ERORR_MESSAGE_REPORT != null}">
            <div class="toast-container" aria-atomic="true" style="  position: relative; min-height: 20px;">
                <div id="liveToast" class="toast" role="alert" aria-live="assertive" data-delay="4000"
                     style="position: fixed; bottom: 20px; right: 15px;">
                    <div class="toast-header">
                        <img src="assets/img/logoteam/logoteam.png" width="6%" class="rounded me-2" alt="">
                        <strong style="color: #e88123"  class="mr-auto">Notification</strong>
                        <small> &nbsp &nbsp Now</small>
                        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                            <span aria-hidden="true">&nbsp &nbsp &nbsp &times;</span>
                        </button>
                    </div>
                    <div class="toast-body">
                        <p>${sessionScope.LOGIN_MEMBER.fullName}</p>
                        <p>You can not report your Article </p>
                    </div>
                </div>
            </div>
        </c:if> 

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
        <script src="assets/js/app.js"></script>
        <script >$('#liveToast').toast('show');</script>

    </body>
</html>