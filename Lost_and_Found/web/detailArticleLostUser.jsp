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
        <script src="//cdn.ckeditor.com/4.19.0/basic/ckeditor.js"></script>
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
                            <h1>Lost Article Detail</h1>
                        </div>
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
                                    <a class="nav-link" aria-current="page" href="UserLostController"><i class="fas fa-box"></i>&nbsp;&nbsp;Lost Articles</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="profileUser.jsp"><i class="fas fa-address-card"></i>&nbsp;&nbsp;Account Details</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="UserFoundController"><i class="fas fa-hand-holding"></i>&nbsp;&nbsp;Found Articles</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <c:set value="${requestScope.DETAIL_ARTICLE_LOST}" var="DAL"/>
                <form action="UpdateLostController" method="POST" enctype="multipart/form-data">   
                    <div class="list-section pt-80 pb-80">
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="t1 mt-5" style="text-align: center;">
                                    <input type="hidden" name="Update" value="">
                                    <h2>${DAL.articleTypeName}</h2>
                                    <input name="id" type="hidden" value="${DAL.articleID}"/>
                                </div>
                            </main>  
                        </div>
                        <div class="container-all mt-5">
                            <div class="user-card-full">
                                <div class="user-card-use">
                                    <div class="pf-body Detail-A">
                                        <label for="exampleFormControlInput1" class="form-label font-weight-bold Detail-A">Location</label>
                                        <div class="border-bottom Detail-B ">
                                            <select name="locationID" class="box">
                                                <option value="${DAL.locationID}">
                                                    ${DAL.locationName}
                                                </option>
                                                <c:forEach items="${sessionScope.LIST_LOCATION}" var="Location">
                                                    <c:if test="${Location.locationName ne DAL.locationName}">
                                                        <option value="${Location.locationID}">${Location.locationName}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="pf-body Detail-A">
                                        <label for="exampleFormControlInput1" class="form-label font-weight-bold Detail-A">Picture</label>
                                        <div class="border-bottom Detail-B">   
                                            <c:set var="img" value="${DAL.imgURL}"/>
                                            <c:choose>
                                                <c:when test="${fn:contains(img, 'https://')}">
                                                    <img src="${DAL.imgURL}" style="width: 100px;"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="file_upload/${DAL.imgURL}" style="width: 100px;"/>
                                                </c:otherwise>
                                            </c:choose>
                                            <input type="hidden" name="imgURL" value="${DAL.imgURL}"/>
                                            <div class="pf-body Detail-B"> <input type="file" name="file"/>  </div>                                                    
                                        </div>
                                    </div >     
                                    <div class="pf-body Detail-A">
                                        <label for="exampleFormControlInput1" class="form-label font-weight-bold Detail-A">Content</label>
                                        <div class="Detail-B">    
                                            <textarea id="editor" name="articleContent">${DAL.articleContent}</textarea>
                                        </div>
                                    </div>
                                    <div style="text-align: center"  class="pf-body Detail-A">
                                        <button type="submit" name="action" value="Update" class="btn btn-outline-warning style-button">
                                            <i class="fas fa-edit"></i> Edit
                                        </button>                           
                                        <button type="submit" name="delete" value="Delete" class="btn btn-outline-danger style-button">
                                            <i class="fas fa-check-circle"></i> Done
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
        <br>
        <%@include file="Components/footerComponents.jsp" %>
        <!-- jquery -->
        <script src="assets/js/jquery-1.11.3.min.js"></script>
        <script>
            CKEDITOR.replace('editor');
        </script>
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
