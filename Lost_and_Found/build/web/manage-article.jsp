<%@page import="java.util.List" %>
<%@page import="article.ArticleDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
              rel="stylesheet" />
        <link href="manage-article/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
        crossorigin="anonymous"></script>
    </head>

    <body class="sb-nav-fixed">
        <c:if test="${sessionScope.LOGIN_MEMBER.roleID != 1}">
            <c:redirect url="login.jsp" />
        </c:if>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="logo-img" href="admin.jsp">
                <img class="img-fluid fpt-uni-logo" src="assets/img/logoteam/logoteam.png"
                     style="width: 80%;" alt="Theme-Logo" />
            </a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"
                    href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search
<form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
    <div class="input-group">
        <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
        <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
    </div>
</form> -->
            <!-- Navbar-->
            <c:set value="${sessionScope.LOGIN_MEMBER}" var="L" />
            <ul class="navbar-nav ms-auto me-0 me-md-3 my-2 my-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false"><i>

                            <span>${L.fullName}</span>

                            <i class="ti-angle-down"></i>
                        </i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">

                        <!-- <li><hr class="dropdown-divider" /></li> -->
                        <li><a class="dropdown-item" href="login.jsp">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">HOME</div>
                            <a class="nav-link" href="admin.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                                Home
                            </a>
                            <div class="box">
                                <div class="box-sm red"></div>
                                <div class="box-sm orange"></div>
                                <div class="box-sm yellow "></div>
                                <div class="box-sm green "></div>
                                <div class="box-sm blue "></div>
                                <div class="box-sm purple"></div>
                            </div>
                            <div class="sb-sidenav-menu-heading">MANAGER</div>
                            <a class="nav-link" href="SearchMemberByAdminController">
                                <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                                Manager User
                            </a>
                            <a class="nav-link" href="SearchAdminController">
                                <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                                Manager Article
                            </a>
                            <a class="nav-link" href="SearchArticleSuccessAdmin">
                                <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                                Manager Article Success
                            </a>
                            <div class="box">
                                <div class="box-sm red"></div>
                                <div class="box-sm orange"></div>
                                <div class="box-sm yellow "></div>
                                <div class="box-sm green "></div>
                                <div class="box-sm blue "></div>
                                <div class="box-sm purple"></div>
                            </div>
                            <div class="sb-sidenav-menu-heading">MANAGER REPORT</div>
                            <a class="nav-link" href="ReportMemberController">
                                <div class="sb-nav-link-icon"><i class="far fa-file-alt"></i></div>
                                User Report
                            </a>
                            <a class="nav-link" href="ReportArticleController">
                                <div class="sb-nav-link-icon"><i class="far fa-file-alt"></i></div>
                                Article Report
                            </a>
                            <div class="box">
                                <div class="box-sm red"></div>
                                <div class="box-sm orange"></div>
                                <div class="box-sm yellow "></div>
                                <div class="box-sm green "></div>
                                <div class="box-sm blue "></div>
                                <div class="box-sm purple"></div>
                            </div>
                            <div class="sb-sidenav-menu-heading">MANAGER BAN</div>
                            <a class="nav-link" href="SearchBandMemberByAdminController">
                                <div class="sb-nav-link-icon"><i class="far fa-newspaper"></i></div>
                                User Ban
                            </a>
                            <a class="nav-link" href="SearchAdminControllerBand">
                                <div class="sb-nav-link-icon"><i class="far fa-newspaper"></i></div>
                                Article Ban
                            </a>
                        </div>

                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        ADMIN
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Manage Article</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"></li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Manage Article
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Article Content</th>
                                            <th>Image</th>
                                            <th>Time</th>
                                            <th>Location</th>
                                            <th>Member</th>
                                            <th>Total Report</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Article Content</th>
                                            <th>Image</th>
                                            <th>Time</th>
                                            <th>Location</th>
                                            <th>Member</th>
                                            <th>Total Report</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${GET_LIST_ARTICLE_ACTIVE}" var="A" varStatus="counting">
                                            <tr>
                                                <td>${A.articleContent}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${fn:contains(A.imgURL, 'https')}">
                                                            <div class="product-image">

                                                                <img style="width: 230px" src="${A.imgURL}" />                                                          
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="product-image">                                                             
                                                                <img style="width: 230px" src="./file_upload/${A.imgURL}" />                                                               
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>
                                                <td>${A.postTime}</td>
                                                <td>${A.locationName}</td>
                                                <td>${A.fullName}</td>
                                                <th>${A.totalReport}</th>
                                                <td>
                                                    <button data-bs-toggle="modal" data-bs-target="#noteModal${counting.count}" class="btn" style="color: red;"><i class="fa fa-trash" aria-hidden="true"></i>
                                                        Ban
                                                    </button>
                                                    <div id="noteModal${counting.count}" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    Do you want ban the article : ${A.articleContent} ?
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                                                                    <a href="DeleteArticleByAdminController?articleID=${A.articleID}" type="button" class="btn btn-primary"> <i  aria-hidden="true"></i> YES</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>


                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted"></div>
                            <div>

                            </div>
                        </div>
                    </div>
                </footer>

            </div>
        </div>
        <style>
            .box {
                display: flex;
                width: 100%;
                height: 3px;
                margin: 5px 0px 5px 0px;
            }

            .box-sm {
                height: 3px;
                margin: 0;
                flex-grow: 1;
                transition: all .8s ease-in-out;
                cursor: pointer;
            }

            .red {
                background-color: #FF5852;
            }

            .orange {
                background-color: #FF9000;
            }

            .yellow {
                background-color: #FFD300;
            }

            .green {
                background-color: #3DCD49;
            }

            .blue {
                background-color: #0089D7;
            }

            .purple {
                background-color: #9E44C4;
            }

            .box-sm:hover {
                flex-grow: 12;
            }

            .logo-img {
                width: 100px;
                height: 100px;
                margin-left: 85px;
                margin-right: 45px;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
        <script src="manage-article/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
        crossorigin="anonymous"></script>
        <script src="manage-article/assets/demo/chart-area-demo.js"></script>
        <script src="manage-article/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
        crossorigin="anonymous"></script>
        <script src="manage-article/js/datatables-simple-demo.js"></script>
    </body>

</html>