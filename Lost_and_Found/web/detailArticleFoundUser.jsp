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
        <div class="breadcrumb-section breadcrumb-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <p>FPT University</p>
                            <h1>Detail</h1>
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
                                    <a class="nav-link" href="UserFoundController">Found</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <br>
                <br>
                <c:set value="${requestScope.DETAIL_ARTICLE_FOUND}" var="DAF"/>
                <form action="UpdateFoundController" method="POST">  
                    <input type="hidden" name="Update" value="">
                    <div class="container-fluid px-4">                    
                        <div class="border-bottom">
                            <h6>Article Type</h6>
                            <input type="text" name="" maxlength="50" value="${DAF.articleTypeName}">
                            <input name="id" type="hidden" value="${DAF.articleID}"/>
                        </div>
                    </div>
                    <div class="container-fluid px-4">
                        <div class="border-bottom">
                            <h6>Picture</h6>                      
                            <img src="${DAF.imgURL}" class="rounded-circle" style="width: 200px;"/>                   
                        </div>
                    </div>     
                    <div class="container-fluid px-4">
                        <div class="border-bottom">
                            <h6>Location</h6>
                            <select name="locationID">
                                <option value="${DAF.locationName}">
                                    ${DAF.locationName}
                                </option>
                                    <c:forEach items="${sessionScope.LIST_LOCATION}" var="Location">
                                        <c:if test="${Location.locationName ne DAF.locationName}">
                                            <option value="${Location.locationID}">${Location.locationName}</option>
                                        </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="container-fluid px-4">                    
                        <div class="border-bottom">
                            <h6>Nội dung</h6>
                            <input type="text" name="articleContent" maxlength="50" value="${DAF.articleContent}">
                        </div>
                    </div>
                    <div style="text-align: center">
                        <button type="submit" value="Update" class="btn btn-outline-dark">
                            Chỉnh sửa
                        </button>                           
                        <button type="submit" name="delete" value="Delete" class="btn btn-outline-dark">
                            Xóa bài
                        </button>
                    </div>
                </form>
            </main>
        </div>
        <br>
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
