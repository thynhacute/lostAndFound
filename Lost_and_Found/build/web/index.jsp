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
              content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">


        <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
            rel="stylesheet"
            id="bootstrap-css"
            />
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
            />
        <link rel="stylesheet" href="css/bootstrap-social.css" />
        <link rel="stylesheet" href="./post/image/style.css" />
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
        <link rel="stylesheet" href="post/css/style.css">
    </head>
    <c:if test="${sessionScope.LOGIN_MEMBER.roleID == 1}">
        <c:redirect url="login.jsp"/>           
    </c:if>  

    <body >      
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
                                    <c:choose >
                                        <c:when test="${sessionScope.LOGIN_MEMBER == null}">
                                            <a href="login.jsp" class="bordered-btn">Post Articles</a>                                         
                                        </c:when>
                                        <c:otherwise>
                                            <a href="post.jsp" class="bordered-btn">Post Articles</a>
                                        </c:otherwise>                                  
                                    </c:choose>                   
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        </div>
        <!-- end hero area -->

        <!-- post new articles -->

        <div class="product-section pt-80 pb-100" style="background: #e7e7e7fa ;">
            <div class="container">       
                <div class="col-lg-8 offset-lg-2 text-center">
                    <div class="section-title">
                        <h3><span class="orange-text"> Post </span> New Articles</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="button-card"  >
                        <div>
                            <c:choose >
                                <c:when test="${sessionScope.LOGIN_MEMBER == null}">
                                    <a href="login.jsp">
                                        <div class="card-2">
                                            <div class="imgBox">
                                                <img src="./post/image/dothatlac.jpg" alt="" />
                                            </div>
                                            <div class="content">
                                                <div class="details">
                                                    <h2>Lost Item</h2>
                                                </div>
                                            </div>
                                        </div>
                                    </a>                                        
                                </c:when>
                                <c:otherwise>
                                    <a href="TypePostController?articleTypeID=1">
                                        <div class="card-2">
                                            <div class="imgBox">
                                                <img src="./post/image/dothatlac.jpg" alt="" />
                                            </div>
                                            <div class="content">
                                                <div class="details">
                                                    <h2>Lost Item</h2>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </c:otherwise>                                  
                            </c:choose>    
                        </div>
                        <div>
                            <c:choose >
                                <c:when test="${sessionScope.LOGIN_MEMBER == null}">
                                    <a href="login.jsp">
                                        <div class="card-2">
                                            <div class="imgBox">
                                                <img src="./post/image/donhatduoc.jpg" alt="" />
                                            </div>
                                            <div class="content">
                                                <div class="details">
                                                    <h2>Picked Item</h2>
                                                </div>
                                            </div>
                                        </div>
                                    </a>                                       
                                </c:when>
                                <c:otherwise>
                                    <a href="TypePostController?articleTypeID=2">
                                        <div class="card-2">
                                            <div class="imgBox">
                                                <img src="./post/image/donhatduoc.jpg" alt="" />
                                            </div>
                                            <div class="content">
                                                <div class="details">
                                                    <h2>Picked Item</h2>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </c:otherwise>                                  
                            </c:choose> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end post new articles -->

        <!-- quick search new articles -->
        <div class="product-section pt-80 pb-100" style="background: #f8f8f8fa;">
            <div class="container">       
                <div class="col-lg-8 offset-lg-2 text-center">
                    <div class="section-title">
                        <h3><span class="orange-text"> Quick  </span> Search</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="button-card " style="margin-left: 0;" >
                        <div >                                                      
                            <a href="HomeController?searchByItem=Ví/Bóp">
                                <div class="card-2" style=" width: 156px;">
                                    <div class="imgBox">
                                        <img src="./post/image/vi_bop.jpg" alt="" />
                                    </div>
                                    <div class="content">
                                        <div class="details">
                                            <h2>Ví/Bóp</h2>
                                        </div>
                                    </div>
                                </div>
                            </a>                                                                                         
                        </div>
                        <div>                             
                            <a href="HomeController?searchByItem=Giấy tờ">
                                <div class="card-2" style=" width: 156px;">
                                    <div class="imgBox">
                                        <img src="./post/image/giay_to.jpg" alt="" />
                                    </div>
                                    <div class="content">
                                        <div class="details">
                                            <h2>Giấy Tờ</h2>
                                        </div>
                                    </div>
                                </div>
                            </a> 
                        </div>
                        <div >
                            <a href="HomeController?searchByItem=CCCD/CMND">
                                <div class="card-2" style=" width: 156px;">
                                    <div class="imgBox">
                                        <img src="./post/image/CCCD.jpg" alt="" />
                                    </div>
                                    <div class="content">
                                        <div class="details">
                                            <h2>CCCD/CMND</h2>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div >
                            <a href="HomeController?searchByItem=Giấy phép lái xe">
                                <div class="card-2" style=" width: 156px;">
                                    <div class="imgBox">
                                        <img src="./post/image/giay_lai_xe.jpg" alt="" />
                                    </div>
                                    <div class="content">
                                        <div class="details">
                                            <h5>Giấy phép lái xe</h5>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div >
                            <a href="HomeController?searchByItem=Khác">
                                <div class="card-2" style=" width: 156px;">
                                    <div class="imgBox">
                                        <img src="./post/image/khac.jpg" alt="" />
                                    </div>
                                    <div class="content">
                                        <div class="details">
                                            <h5>Khác</h5>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end quick search new articles -->

        <!-- product Lost section -->
        <div class="product-section pt-80 pb-80">
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
                                <c:choose>
                                    <c:when test="${fn:contains(L.imgURL, 'https')}">
                                        <div class="product-image">
                                            <a href="DetailArticleController?articleID=${L.articleID}">
                                                <img style="height: 150px;" src="${L.imgURL}" />
                                            </a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="product-image">
                                            <a href="DetailArticleController?articleID=${L.articleID}">
                                                <img style="height: 150px;" src="./file_upload/${L.imgURL}" />
                                            </a>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <h3>${L.itemName}</h3>
                                <p class="product-price"><span>(+84) ${L.phone}</span>${L.locationName} </p>
                                <p>${L.fullName}</p>
                            </div>
                        </div>     
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- end product 1 section -->

        <!-- product picked up section -->
        <div class="product-section pt-80 pb-80">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="section-title">
                            <h3><span class="orange-text">NEW </span> Picked Articles</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${requestScope.LIST_PICKED_ARTICLE}" var="P">
                        <div class=" col-lg-4 text-center strawberry ">
                            <div class="single-product-item" style="height: 450px; width: 80%">
                                <c:choose>
                                    <c:when test="${fn:contains(P.imgURL, 'https')}">
                                        <div class="product-image">
                                            <a href="DetailArticleController?articleID=${P.articleID}">
                                                <img style="height: 150px;" src="${P.imgURL}" />
                                            </a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="product-image">
                                            <a href="DetailArticleController?articleID=${P.articleID}">
                                                <img style="height: 150px;" src="./file_upload/${P.imgURL}" />
                                            </a>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <h3>${P.itemName}</h3>
                                <p class="product-price"><span>(+84) ${P.phone}</span>${P.locationName} </p>
                                <p>${P.fullName}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- end product 2 section -->

        <div class="product-section pt-80 pb-80">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="section-title">
                            <h3><span class="orange-text"> TOP </span> Likes Articles</h3>
                        </div>
                    </div>
                </div>                                
                <div class="row">
                    <c:forEach items="${requestScope.LIST_TOP_LIKES_ARTICLE}" var="LTLA">
                        <div class=" col-lg-4 text-center strawberry">
                            <div class="single-product-item" style="height: 450px; width: 80%" >
                                <c:choose>
                                    <c:when test="${fn:contains(LTLA.imgURL, 'https')}">
                                        <div class="product-image">
                                            <a href="DetailArticleController?articleID=${LTLA.articleID}">
                                                <img style="height: 150px;" src="${LTLA.imgURL}" />
                                            </a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="product-image">
                                            <a href="DetailArticleController?articleID=${LTLA.articleID}">
                                                <img style="height: 150px;" src="./file_upload/${LTLA.imgURL}" />
                                            </a>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <h3>${LTLA.itemName}</h3>
                                <p class="product-price"><span>(+84) ${LTLA.phone}</span>${LTLA.locationName} </p>
                                <p>${LTLA.fullName}</p>
                            </div>
                        </div>     
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- latest news -->
        <c:if test="${requestScope.SUCCESS_MESSAGE != null}">
            <div class="toast-container" aria-atomic="true" style="  position: absolute; min-height: 5px;">
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
                        <p>Hello, ${sessionScope.LOGIN_MEMBER.fullName}</p>
                        <p>welcome to Lost and Found </p>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${requestScope.SUCCESS_CREATE_MESSAGE != null}">
            <div class="toast-container" aria-atomic="true" style="  position: absolute; min-height: 5px;">
                <div id="liveToast" class="toast" role="alert" aria-live="assertive" data-delay="3500"
                     style="position: fixed; bottom: 20px; right: 15px;">
                    <div class="toast-header">
                        <img src="assets/img/logoteam/logoteam.png" width="6%" class="rounded me-2" alt="">
                        <strong style="color: #e88123" class="mr-auto">Notification</strong>
                        <small> &nbsp &nbsp Now</small>
                        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                            <span aria-hidden="true">&nbsp &nbsp &nbsp &times;</span>
                        </button>
                    </div>
                    <div class="toast-body">
                        <p>${sessionScope.LOGIN_MEMBER.fullName}</p>
                        <p> Post article success</p>
                    </div>
                </div>
            </div>
        </c:if> 
        <%@include file="Components/footerComponents.jsp" %>
    </body>
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
    <script >$('#liveToast').toast('show');</script>
</html>