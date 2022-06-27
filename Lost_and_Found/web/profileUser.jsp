<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Bootstrap4 Shop Template, Created
              by Imran Hossain from https://imransdesign.com/">

        <!-- title -->
        <title>News</title>

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
        <c:if test="${sessionScope.LOGIN_MEMBER.roleID == 1}">
            <c:redirect url="login.jsp"/>           
        </c:if>  
        <%@include file="Components/navbarComponent.jsp" %>
        <div class="breadcrumb-section breadcrumb-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <p>FPT University</p>
                            <h1>Profile User</h1>
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
                                    <a class="nav-link active" href="profileUser.jsp">Profile</a>
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
                <form action="UpdateController" method="POST">
                    <div class="container-fluid px-4">                    
                        <div class="border-bottom">
                            <h6>Họ tên</h6>
                            <input type="text" name="fullName" maxlength="50" value="${L.fullName}">
                        </div>
                    </div>
                    <div class="container-fluid px-4">
                        <div class="border-bottom">
                            <h6>Avatar</h6>                      
                            <img src="${L.picture}" class="rounded-circle" style="width: 100px;" alt="Avatar"/>                   
                        </div>
                    </div>     
                    <div class="container-fluid px-4">
                        <div class="border-bottom">
                            <h6>Profile Info</h6>
                            <input name="profileInfo" type="text" maxlength="50" value="${L.profileInfo}">
                        </div>
                    </div>    
                    <div class="container-fluid px-4">
                        <div class="border-bottom">
                            <h6>Email</h6>
                            <p>${L.email}</p>
                        </div>
                    </div>
                    <div class="container-fluid px-4">
                        <div class="border-bottom">
                            <h6>Phone</h6>
                            <input name="phone" type="text" maxlength="50" value="${L.phone}">                           
                        </div>                        
                    </div>
                    <div style="text-align: center">
                        <button type="submit" name="action" value="Update" class="btn btn-outline-warning style-button">
                            Chỉnh sửa
                        </button>
                    </div>
                </form>
            </main>
        </div>
        <br>
        <!-- end logo carousel -->

        <!-- footer -->
        <%@include file="Components/footerComponents.jsp" %>
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