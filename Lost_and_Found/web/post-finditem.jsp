<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

    <body>
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
        <div class="body-color">
            <div id="layoutSidenav_content">
                <main>
                    <div class="t1 mt-5 ">
                        <h1>Mô tả chi tiết món đồ</h1>
                    </div>
                </main>
            </div>
            <div class="container-all mt-5">
                <div class="user-card-full">
                    <div class="user-card-use">

                        <label for="exampleFormControlInput1" class="form-label font-weight-bold display-6"> <i
                                class="fa-solid fa-pen "></i> Mô tả chung</label>

                        <form>
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label font-weight-bold">Tiêu
                                    đề</label>
                                <input type="email" class="form-control" id="exampleFormControlInput1"
                                       placeholder="Rơi đồ gồm nhiều món ở trái đất">
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label font-weight-bold">Loại</label>
                                <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="">
                            </div>
                            <div class="form-group font-weight-bold">
                                <label for="comment">Mô tả chi tiết:</label>
                                <textarea class="form-control" rows="5" id="comment"></textarea>
                                <script>
                                    CKEDITOR.replace('comment');
                                </script>
                            </div>
                        </form>



                        <label for="exampleFormControlInput1" class="form-label font-weight-bold display-6"> <i
                                class="fa-solid fa-location-pin"></i> Vị trí</label>

                        <form>
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label font-weight-bold">Vị trí tìm kiếm</label>
                                <input type="email" class="form-control" id="exampleFormControlInput1"
                                       placeholder="Nhặt được ở nhà vệ sinh">
                            </div>
                        </form>


                        <label for="exampleFormControlInput1" class="form-label font-weight-bold display-6"> <i
                                class="fa-solid fa-image"></i> Ảnh</label>
                        <form>
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label font-weight-bold">Ảnh đồ tìm kiếm</label>
                            </div>
                            <div class="input-group mb-3">
                                <input type="file" class="form-control" id="inputGroupFile02">
                                <label class="input-group-text" for="inputGroupFile02">Upload</label>
                            </div>
                        </form>
                    </div>
                </div>
            </div>



            &emsp;
            <div class="col-lg-8 " style="margin-left: 45%;">
                <input type="reset" class="btn btn-secondary btnCancel" value="Cancel">
                <input type="submit" form="save-form" class="btn btn-primary btnSave" value="Submit">
            </div>
            &emsp;



        </div>
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
<script src="https://cdn.ckeditor.com/4.19.0/standard/ckeditor.js"></script>


</html>