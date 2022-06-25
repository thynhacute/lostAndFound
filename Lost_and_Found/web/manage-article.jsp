<%@page import="java.util.List"%>
<%@page import="article.ArticleDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="manage-article/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a href="admin.jsp">
                <img class="img-fluid fpt-uni-logo" src="manage-article/assets/img/logo-fpt-certificate.png" style="width: 80%;" alt="Theme-Logo" />
            </a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form> -->
            <!-- Navbar-->

            <ul class="navbar-nav ms-auto me-0 me-md-3 my-2 my-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i >
                            <span>admins </span>
                            <i class="ti-angle-down"></i>
                        </i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">

                        <!-- <li><hr class="dropdown-divider" /></li> -->
                        <li><a class="dropdown-item" href="MainController?action=Logout">Logout</a></li>
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
                            <a class="nav-link" href="SearchAdminController">
                                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                                Home
                            </a>
                            <div class="sb-sidenav-menu-heading">Article</div>
                            <a class="nav-link" href="SearchAdminController">
                                <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                                Manager Article
                            </a>
                            <a class="nav-link" href="ReportArticleController">
                                <div class="sb-nav-link-icon"><i class="far fa-file-alt"></i></div>
                                Manager Report
                            </a>
                            <a class="nav-link" href="SearchAdminControllerBand">
                                <div class="sb-nav-link-icon"><i class="far fa-newspaper"></i></div>
                                Manage Band
                            </a>
                            <div class="sb-sidenav-menu-heading">Users</div>
                            <a class="nav-link" href="manager-user.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                                Manager User
                            </a>
                            <a class="nav-link" href="manage-user-report.jsp">
                                <div class="sb-nav-link-icon"><i class="far fa-file-alt"></i></div>
                                Manager Report
                            </a>
                            <a class="nav-link" href="manage-user-band.jsp">
                                <div class="sb-nav-link-icon"><i class="far fa-newspaper"></i></div>
                                Manage Band
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
                                            <th>Article ID</th>
                                            <th>Article Content</th>
                                            <th>Image</th>
                                            <th>Time</th>
                                            <th>Location</th>
                                            <th>Member</th>
                                            <th>Article Type</th>
                                            <th>Total Report</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Article ID</th>
                                            <th>Article Content</th>
                                            <th>Image</th>
                                            <th>Time</th>
                                            <th>Location</th>
                                            <th>Member</th>
                                            <th>Article Type</th>
                                            <th>Total Report</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        
                                        <c:forEach items="${GET_LIST_ARTICLE_ACTIVE}" var = "A">
                                            <tr>
                                                <td>${A.articleID}</td>
                                                <td>${A.articleContent}</td>
                                                <td><img src="${A.imgURL}" style="width: 230px"></td>
                                                <td>${A.postTime}</td>
                                                <td>${A.locationName}</td>
                                                <td>${A.fullName}</td>
                                                <td>${A.articleTypeName}</td>
                                                <th>${A.totalReport}</th>
                                                <td> 
                                                    <a href="DeleteArticleByAdminController?articleID=${A.articleID}" style="color: red;"> <i class="fa fa-trash" aria-hidden="true"></i> Delete</a></td>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="manage-job/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="manage-job/assets/demo/chart-area-demo.js"></script>
        <script src="manage-job/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="manage-job/js/datatables-simple-demo.js"></script>
    </body>
</html>
