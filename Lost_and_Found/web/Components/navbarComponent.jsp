<%-- 
    Document   : navbar
    Created on : Jun 17, 2022, 10:29:49 AM
    Author     : Owner
--%>

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
                    <nav class="main-menu">
                        <ul>
                            <li class="current-list-item"><a href="PageController">Page</a>
                            </li>
                            <li><a href="blog.jsp">Blog</a>
                                <ul class="sub-menu">
                                    <li><a href="blog.jsp">Blog</a></li>
                                    <li><a href="blog-detail.jsp">Blog Detail</a></li>
                                </ul>
                            </li>
                            <li><a href="#">FPTU's Map</a>
                                <ul class="sub-menu">
                                    <li><a href="#">G floor </a></li>
                                    <li><a href="#">1st floor</a></li>
                                    <li><a href="#">2nd floor</a></li>
                                    <li><a href="#">3th floor</a></li>
                                    <li><a href="#">4th floor</a></li>
                                </ul>
                            </li>
                            <li><a href="HomeController">Home</a>
                                <ul class="sub-menu">
                                    <li><a href="HomeController">Home</a></li>
                                    <li><a href="Artical-detail.jsp">Artical-detail</a></li>
                                </ul>
                            </li>
                            <li>
                                <c:set value="${sessionScope.LOGIN_MEMBER}" var="L"/>
                                <div class="header-icons">
                                    <a class="mobile-hide search-bar-icon" href="#"><i
                                            class="fas fa-search"></i></a>
                                    <c:if test="${sessionScope.LOGIN_MEMBER == null }" >
                                        <a  href="login.jsp"> Login</a>  
                                    </c:if>
                                    <c:if test="${sessionScope.LOGIN_MEMBER != null }">
                                        <img src="${L.picture}"
                                             class="rounded-circle" style="width: 40px;" alt="Avatar" />
                                        <ul class="sub-menu">
                                            <li> <a href="#"></a>${L.fullName}</li>
                                            <li> <a href="login.jsp">Logout</a></li>
                                        </ul>
                                    </c:if>                               
                                </div>
                            </li>
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

<!-- search area -->
<div class="search-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <span class="close-btn"><i class="fas fa-window-close"></i></span>
                <div class="search-bar">
                    <div class="search-bar-tablecell">
                        <h3>Search For:</h3>
                        <input type="text" placeholder="Keywords">
                        <button type="submit">Search <i class="fas fa-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end search area -->
<!-- end nav -->


