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
        <link rel="stylesheet" href="post/css/style.css">

    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_MEMBER.roleID == 1}">
            <c:redirect url="login.jsp"/>           
        </c:if>  
        <%@include file="Components/navbarComponent.jsp" %>
        <div class="breadcrumb-section breadcrumb-bg">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 text-center">
                    <div class="breadcrumb-text">
                        <p>FPT University</p>
                        <h1>Profile User</h1>
                    </div>
                </div>
            </div>                    
        </div>
    <div id="layoutSidenav_content">
        <main>
            <nav class="navbar navbar-expand-lg" style="background-color: white;">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link  " aria-current="page" href="UserLostController"><i class="fas fa-box"></i>&nbsp;&nbsp;Lost Articles</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link  " href="profileUser.jsp"><i class="fas fa-address-card"></i>&nbsp;&nbsp;Account Details</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link  " href="UserFoundController"><i class="fas fa-hand-holding"></i>&nbsp;&nbsp;Found Articles</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="list-section pt-80 pb-80">
                <div id="layoutSidenav_content">
                    <main>
                        <div class="t1 mt-5" style="text-align: center;">
                            <h2>Account details</h2>
                        </div>
                    </main>
                </div>
                <div class="container-all mt-5">
                    <div class="user-card-full">
                        <div class="user-card-use">
                            <form action="UpdateController" method="POST">
                                <div class="pf-body Detail-A">
                                    <label for="exampleFormControlInput1" class="form-label font-weight-bold Detail-A">Full Name</label>
                                    <div class="border-bottom Detail-B">                                
                                        <input type="text" name="fullName" maxlength="50" value="${L.fullName}">
                                    </div>
                                </div>
                                <div class="pf-body Detail-A"> 
                                    <label for="exampleFormControlInput1" class="form-label font-weight-bold Detail-A">Avatar</label>
                                    <div class="border-bottom Detail-B">                    
                                        <img src="${L.picture}" class="rounded-circle" style="width: 100px;" alt="Avatar"/>                   
                                    </div>
                                </div>     
                                <div class="pf-body Detail-A">
                                    <label for="exampleFormControlInput1" class="form-label font-weight-bold Detail-A">Bio</label>
                                    <div class="border-bottom Detail-B">
                                        <input name="profileInfo" type="text" maxlength="50" value="${L.profileInfo}">
                                    </div>
                                </div>    
                                <div class="pf-body Detail-A">
                                    <label for="exampleFormControlInput1" class="form-label font-weight-bold Detail-A">Email</label>
                                    <div class="border-bottom Detail-B">
                                        <p>${L.email}</p>
                                    </div>
                                </div>
                                <div class="pf-body Detail-A">
                                    <label for="exampleFormControlInput1" class="form-label font-weight-bold Detail-A">Phone</label>
                                    <div class="border-bottom Detail-B">
                                        <span>+84 </span>
                                        <input maxlength="9" minlength="9" name="phone" type="text" maxlength="50" value="${L.phone}">                           
                                    </div>                        
                                </div>
                                    <div style="text-align: center" class="pf-body Detail-A">
                                    <button type="submit" name="action" value="Update" class="btn btn-outline-warning style-button">
                                        <i class="fas fa-edit"></i>&nbsp Update
                                    </button>
                                </div>
                                    <br>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </main>
    </div>
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