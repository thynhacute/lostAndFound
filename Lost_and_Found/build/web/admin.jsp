<%@page import="java.util.List" %>
<%@page import="article.ArticleDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                        <h1 class="mt-4"><i class="fa-solid fa-house"></i>  Dashboard</h1>

                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body"><i class="fa-solid fa-user"></i> New Account Week</div>
                                    <div class="card-body"> Increase 10%  <i class="fa-solid fa-chart-line"></i></div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="SearchMemberByAdminController">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body"><i class="fa-solid fa-newspaper"></i> New Article Week</div>
                                    <div class="card-body"> Increase 30%  <i class="fa-solid fa-chart-line"></i></div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="SearchAdminController">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body"><i class="fa-solid fa-clipboard-check"></i> Article Success Week</div>
                                    <div class="card-body"> Increase 50%  <i class="fa-solid fa-chart-line"></i></div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="SearchArticleSuccessAdmin">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body"><i class="fa-solid fa-ban"></i> Article Band Week</div>
                                    <div class="card-body"> Reduce 10%  <i class="fa-solid fa-arrow-trend-down"></i></div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="SearchAdminControllerBand">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                Chart Article
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Chart Finded Item
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        Chart Of Lost And Found Article
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        Chart Of Lost And Found Article
                                    </div>
                                    <div class="card-body"><canvas id="myPieChartAccount" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Chart Account 
                                    </div>
                                    <div class="card-body"><canvas id="barChartHeadcount" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                        </div>
                    </div>

                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
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
        <script src="manage-article/assets/demo/chart-pie-demo.js"></script>
        <script src="manage-article/assets/demo/chart-bar-mix-demo.js"></script>
        <script src="manage-article/assets/demo/chart-pie-account.js"></script>
        <script src="manage-article/assets/demo/chart-bar-account.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
        crossorigin="anonymous"></script>
        <script src="manage-article/js/datatables-simple-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script>        
    </body>

</html>