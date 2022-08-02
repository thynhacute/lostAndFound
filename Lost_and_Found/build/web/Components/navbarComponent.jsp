<%-- 
    Document   : navbar
    Created on : Jun 17, 2022, 10:29:49 AM
    Author     : Owner
--%>

<style>

    ::-webkit-scrollbar{
        width: 10px;
    }
    ::-webkit-scrollbar-track{
        box-shadow: inset 0 0 10px #0000004c;
    }
    ::-webkit-scrollbar-thumb{
        border-radius: 5px;
        background-color: #ee8138;
    }
</style>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- nav -->
<!--PreLoader-->
<div class="loader">
    <div class="loader-inner">
        <div class="circle"></div>
    </div>
</div>

<!--PreLoader Ends-->
<!-- header -->
<div class="top-header-area" id="sticker">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-sm-12 text-center">
                <div class="main-menu-wrap">
                    <!-- logo -->
                    <div class="site-logo">
                        <a href="PageController">
                            <img src="assets/img/logoteam/logoteam.png" style="width: 33%;" alt="">
                        </a>
                    </div>
                    <!-- logo -->
                    <!-- menu start -->
                    <c:set value="${sessionScope.LOGIN_MEMBER}" var="L"/>
                    <nav class="main-menu">
                        <ul>
                            <li class="current-list-item"><a href="PageController">Page</a>                                
                            </li>
                            <li><a href="BlogController">Blog</a>
                                <!--                                <ul class="sub-menu">
                                                                    <li><a href="blog.jsp">Blog</a></li>
                                                                    <li><a href="blog-detail.jsp">Blog Detail</a></li>
                                                                </ul>-->
                            </li>
                            <li><a href="#">FPTU's Map</a>
                                <ul class="sub-menu">
                                    <li><a data-toggle="modal" data-target="#exampleModal" >G floor </a></li>
                                    <li><a data-toggle="modal" data-target="#exampleModal1">1st floor</a></li>
                                    <li><a data-toggle="modal" data-target="#exampleModal2">2nd floor</a></li>
                                    <li><a data-toggle="modal" data-target="#exampleModal3">3th floor</a></li>
                                    <li><a data-toggle="modal" data-target="#exampleModal4">4th floor</a></li>
                                </ul>
                            </li>
                            <li><a href="HomeController">Find Items</a></li>
                                <c:if test="${sessionScope.LOGIN_MEMBER == null }" >
                                <li><a href="login.jsp">Post Articles</a></li>
                                </c:if>
                                <c:if test="${sessionScope.LOGIN_MEMBER != null }" >
                                <li><a href="post.jsp">Post Articles</a></li>
                                </c:if>
                                <c:if test="${sessionScope.LOGIN_MEMBER != null }" >                               
                                <li class="dropdown" style="transform: translateX(180px);
                                    font-size: 20px;
                                    color: white;"> 
                                    <!--                                 
                                                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                                                            <li> <a href="#"></a>${L.fullName}</li>
                                                                            <li> <a href="login.jsp">Logout</a></li>
                                                                            <li><a href="profileUser.jsp">Profile</a></li>
                                                                        </ul>-->
                                    <c:if test="${sessionScope.LIST_NOTIFICATION.size() > 0}">
                                        <div class="size-noti">${sessionScope.LIST_NOTIFICATION.size()}</div>
                                    </c:if>
                                    <button onclick="hamDropdown()" class="nut_dropdown" style="background-color: transparent; border: none; outline: none"> 
                                        <i class="fas fa-bell"></i>
                                        <span class="caret"></span></button>
                                    <ul class="noidung_dropdown">
                                        <div>
                                            <div>
                                                <p class="title-noti text-center mt-3">Notification</p>
                                                <!--                                                <form class="col-3" action="NotificationController" method="POST">
                                                                                                    <button class="tick" type="submit" name="action" value="NotificationSeenAll" style="background-color: red;
                                                                                                            border: none;
                                                                                                            outline: none;
                                                                                                            text-align: center">
                                                                                                        <i class="fas fa-check"></i>
                                                                                                    </button>
                                                                                                </form>-->
                                            </div>
                                            <c:if test="${sessionScope.LIST_NOTIFICATION.size() > 0}">
                                                <div class="row justify-content-between my-2">
                                                    <p class="noidung_dropdown_content col-5 align-self-center">Latest</p>
                                                    <form class="col-3 align-self-center" action="NotificationController" method="POST">
                                                        <button class="tick mt-0 px-2" type="submit" name="action" value="NotificationSeenAll" style="background-color: transparent;
                                                                border: 1px solid #ee8138;
                                                                outline: none;
                                                                border-radius: 8px;
                                                                cursor: pointer">
                                                            <i class="fas fa-check" style="color: #ee8138"></i>
                                                        </button>
                                                    </form>
                                                </div>
                                                <div>
                                                    <c:forEach items="${sessionScope.LIST_NOTIFICATION}" var="LN">
                                                        <a href="NotificationController?articleID=${LN.articleID}">
                                                            <div>
                                                                <div class="notification">
                                                                    <img width="50px" height="50px" src="${LN.picture}">                                                    
                                                                    <p><b>${LN.fullName}</b> ${LN.content}</p>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </c:forEach>
                                                </div>

                                                <hr/>
                                            </c:if>
                                        </div>
                                        <div>
                                            <p class="noidung_dropdown_content text-left ml-4">Read</p>
                                            <c:forEach items="${sessionScope.LIST_NOTIFICATION_SEEN}" var="LNS">
                                                <a href="NotificationController?articleID=${LNS.articleID}">
                                                    <div>
                                                        <div class="notification">
                                                            <img width="50px" height="50px" src="${LNS.picture}">                                                    
                                                            <p><b>${LNS.fullName}</b> ${LNS.content}</p>
                                                        </div>
                                                    </div>
                                                </a>
                                            </c:forEach>
                                        </div>
                                        <!--                                        <div>
                                        <c:forEach items="${sessionScope.LIST_NOTIFICATION_ARTICLE_FIND}" var="LNAF">
                                            <p>${LNAF.fullName} <span>${LNAF.content}</span></p>
                                        </c:forEach>
                                    </div>-->
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_MEMBER == null }" >
                                <li>
                                    <a  href="login.jsp"> Login</a>  
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_MEMBER != null }" >
                                <li style="transform: translateY(4px);">
                                    <c:if test="${sessionScope.LOGIN_MEMBER != null }"> 
                                        <img src="${L.picture}"
                                             class="rounded-circle" style="width: 40px;" alt="Avatar" />
                                        <ul class="sub-menu">
                                            <li><a href="profileUser.jsp">${L.fullName}</a></li>
                                            <li><a href="profileUser.jsp">Profile</a></li>
                                            <li><a href="login.jsp">Logout</a></li>
                                        </ul>
                                    </c:if>
                                </li>
                            </c:if>


                        </ul>
                    </nav>
                    <a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                    <div class="mobile-menu"></div>
                    <!-- menu end -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end header -->
<!-- end nav -->

<!--Map begin-->

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Floor G</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <img src="assets/img/imga map/Gfloor.jpg" alt="">
            </div>
            <div class="modal-footer">
                <p> Find your items  anywhere in FPT</p>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Floor 1</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <img src="assets/img/imga map/1floor.jpg"/>               
            </div>
            <div class="modal-footer">
                <p> Find your items  anywhere in FPT</p>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">Floor 2</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <img src="assets/img/imga map/2floor.jpg"/>               
            </div>
            <div class="modal-footer">
                <p> Find your items  anywhere in FPT</p>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel3">Floor 3</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <img src="assets/img/imga map/3floor.jpg"/>               
            </div>
            <div class="modal-footer">
                <p> Find your items  anywhere in FPT</p>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel4">Floor 4</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <img src="assets/img/imga map/4floor.jpg"/>               
            </div>
            <div class="modal-footer">
                <p> Find your items  anywhere in FPT</p>
            </div>
        </div>
    </div>
</div>

<!--Map end-->


