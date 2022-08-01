<%@page import="ArticleType.ArticleTypeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
                                <br>
                                <h4 class="case27">What do you want to search?</h4>
                                <p></p>
                            </div>
                            <form action="HomeController" method="POST">
                                <div class="type-dropdown">

                                    <!--SEARCH BY TYPE START HERE-->
                                    <label for="">Listing Type</label>
                                    <c:set var="searchByType" value="${param.searchByType}"/>
                                    <select name="searchByType" onchange="this.form.submit()" class="box">
                                        <c:choose>
                                            <c:when test="${empty searchByType}">
                                                <option value="">All</option>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="all" value=""/>
                                                <c:if test="${searchByType ne all}">
                                                    <option value="${searchByType}">${searchByType}</option>
                                                    <option value="">All</option>
                                                </c:if>
                                                <c:if test="${searchByType eq all}">
                                                    <option value="${searchByType}">${searchByType}</option>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach items="${sessionScope.LIST_ARTICLE_TYPE}" var="type">
                                            <c:if test="${type.articleTypeName ne searchByType}">
                                                <option value="${type.articleTypeName}">${type.articleTypeName}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                    <!--SEARCH BY TYPE END HERE-->
                                    <br>
                                    <!--SEARCH BY ITEMS START HERE-->
                                    <label for="">Type Items</label>
                                    <c:set var="searchByItem" value="${param.searchByItem}"/>
                                    <select name="searchByItem" onchange="this.form.submit()" class="box">
                                        <c:choose>
                                            <c:when test="${empty searchByItem}">
                                                <option value="">All</option>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="all" value=""/>
                                                <c:if test="${searchByItem ne all}">
                                                    <option value="${searchByItem}">${searchByItem}</option>
                                                    <option value="">All</option>
                                                </c:if>
                                                <c:if test="${searchByItem eq all}">
                                                    <option value="${searchByItem}">${searchByItem}</option>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach items="${sessionScope.LIST_ITEM}" var="Item">
                                            <c:if test="${Item.itemName ne searchByItem}">
                                                <option value="${Item.itemName}">${Item.itemName}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                    <!--SEARCH BY ITEMS START HERE-->
                                    <br>

                                    <!--SEARCH BY LOCATION START HERE-->
                                    <label for="">Location</label>

                                    <c:set var="searchByLocation" value="${param.searchByLocation}"/>
                                    <select name="searchByLocation" onchange="this.form.submit()" class="box">
                                        <c:choose>
                                            <c:when test="${empty searchByLocation}">
                                                <option value="">All</option>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="all" value=""/>
                                                <c:if test="${searchByLocation ne all}">
                                                    <option value="${searchByLocation}">${searchByLocation}</option>
                                                    <option value="">All</option>
                                                </c:if>
                                                <c:if test="${searchByLocation eq all}">
                                                    <option value="${searchByLocation}">${searchByLocation}</option>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach items="${sessionScope.LIST_LOCATION}" var="Location">
                                            <c:if test="${Location.locationName ne searchByLocation}">
                                                <option value="${Location.locationName}">${Location.locationName}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>

                                    <!--SEARCH BY LOCATION START HERE-->
                                    <br>
                                    <br>
                                    <button type="submit" class="btn  btn-lg active btn-search"
                                            ><i class="fas fa-search"></i></i>&nbsp Search</button>
                                    <br>
                                    <br>     
                                </div>
                            </form>
                            <form action="ResetController" method="POST">
                                <button type="submit" name="action" value="Reset" style="width: 100% ; color:#ea7f23; " class="btn-outline-light  btn-lg "
                                        ><i class="fas fa-redo"></i>&nbsp Reset </button>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-9">                       
                        <div class="row">
                            <c:forEach items="${LIST_ARTICLE}" var="A">
                                <div class=" col-md-4 text-center strawberry" >
                                    <div class="single-product-item" style="height: 450px">
                                        <div class="product-image">
                                            <c:choose>
                                                <c:when test="${fn:contains(A.imgURL, 'https')}">
                                                    <a href="DetailArticleController?articleID=${A.articleID}">
                                                        <img style="height: 150px;" src="${A.imgURL}"/></a>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <a href="DetailArticleController?articleID=${A.articleID}">
                                                        <img style="height: 150px;" src="./file_upload/${A.imgURL}"/></a>
                                                    </c:otherwise>
                                                </c:choose>
                                        </div>
                                        <h3>${A.itemName}</h3>
                                        <p class="product-price"><span>(+84) ${A.phone}</span> ${A.locationName} </p>
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
                    </div
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