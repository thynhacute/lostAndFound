<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
        <link rel="stylesheet" href="css/bootstrap-social.css" />
        <link rel="stylesheet" href="post/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
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
        <script src="https://cdn.ckeditor.com/4.19.0/basic/ckeditor.js"></script>


    </head>
    <body style="background-color: #f4f4f4">
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
        <div class="product-section mt-150 mb-150">
            <div id="layoutSidenav_content">
                <main>
                    <div class="t1 mt-5 ">
                        <h2>POST PICK-ITEM FORM</h2>
                    </div>
                </main>
            </div>
            <br>
            <div class="container-all mt-5">
                <form action="CreateController" method="post" enctype="multipart/form-data">
                    <div class="user-card-full">
                        <div class="user-card-use">
                            <div class ="Detail-A">
                                <div>
                                    <label for="exampleFormControlInput1" class="form-label font-weight-bold"><i
                                            class="fa-solid fa-pen "></i>  
                                        <input type="hidden" name="articleTypeID" value="2"/>&nbsp Detail</label>
                                </div>
                            </div>

                            <!--SEARCH BY ITEMS START HERE-->
                            <div class="pf-body Detail-A">                            
                                <label for="exampleFormControlInput1" class="form-label font-weight-bold Detail-A"><i class="fas fa-list"></i>
                                    &nbsp Type Item</label>
                                <div>                                   
                                    <select name="Items" class="box-1">
                                        <option value="0">Choose item type</option>
                                        <c:forEach items="${requestScope.LIST_ITEM}" var="Item">                                            
                                            <option value="${Item.itemID}"> ${Item.itemName}</option>                                            
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <!--SEARCH BY ITEMS START HERE-->

                            <!--SEARCH BY LOCATION START HERE-->
                            <div class="Detail-A">
                                <label for="exampleFormControlInput1" class="form-label font-weight-bold Detail-A"> <i
                                        class="fa-solid fa-location-pin"></i>&nbsp Location</label> 
                                <select name="Locations"class="box-1">
                                    <option value="0">Choose location</option>
                                    <c:forEach items="${requestScope.LIST_LOCATION}" var="Location">                                      
                                        <option value="${Location.locationID}">${Location.locationName}</option>                                        
                                    </c:forEach>
                                </select>

                            </div> 
                            <!--SEARCH BY LOCATION START HERE-->

                            <br>
                            <div class="form-group font-weight-bold Detail-A">
                                <div class="Detail-A"><label for="comment" >Detailed Description: </label></div>                            
                                <textarea  minlength="10" maxlength="1000"  class="form-control Detail-A" rows="5" name="articleContent" id="comment"></textarea>
                                <script>
                                    CKEDITOR.replace('comment');
                                </script>
                            </div>                                                        
                            <div class="Detail-A">
                                <label for="exampleFormControlInput1" class="form-label font-weight-bold Detail-A"> <i
                                        class="fa-solid fa-image"></i> Picture </label>
                            </div>
                            <div class="input-group Detail-A " style="padding-bottom: 35px">
                                <input type="file" class="form-control" name="file" id="inputGroupFile02" placeholder="Enter photo">
                                <div>
                                    <c:if test="${requestScope.ERROR_UPLOAD != null}">
                                        <p> &nbsp &nbsp ${requestScope.ERROR_UPLOAD}</p>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="col-lg-8 " style="margin-left: 239px;">              
                        <button style="width: 700px" type="submit" class="btn btn-success">Submit</button>                
                    </div>
                    <div class="col-lg-8 Detail-A " style="margin-left: 239px;" >              
                        <a style="width: 700px" href="post.jsp" class="btn btn-outline-danger">Cancel</a>                              
                    </div>
                </form>  
            </div>
        </div>
        <c:if test="${requestScope.ERROR_MESSAGE != null}">
            <div class="toast-container" aria-atomic="true" style="  position: absolute; min-height: 5px;">
                <div id="liveToast" class="toast" role="alert" aria-live="assertive" data-delay="3500"
                     style="position: fixed; bottom: 10px; right: 15px;">
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
                        <p> Please Choice Type Item AND Location</p>
                    </div>
                </div>
            </div>
        </c:if>   
    </body>
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
    <script >$('#liveToast').toast('show');</script>
    <script src="https://cdn.ckeditor.com/4.19.0/standard/ckeditor.js"></script>


</html>