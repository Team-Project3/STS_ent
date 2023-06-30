<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link rel="shortcut icon" href="img/favicon.png">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/a_performance.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="admin_main">관리자 페이지</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="admin_main">메인으로</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="adminlogout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">공연</div>
                            <a class="nav-link" href="a_performance_main">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                             	   종합 분석
                            </a>
                            <div class="sb-sidenav-menu-heading">공연 관리</div>
                            <a class="nav-link collapsed" href="a_performance_ent_t" data-bs-toggle="collapse" data-bs-target="#performancelist" aria-expanded="false" aria-controls="performancelist">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                공연 정보 조회
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="performancelist" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="a_performance_ent_t">전체</a>
                                    <a class="nav-link" href="a_performance_ent_f?category=1">콘서트</a>
                                    <a class="nav-link" href="a_performance_ent_f?category=2">연극</a>
                                    <a class="nav-link" href="a_performance_ent_f?category=3">전시</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#bookinglist" aria-expanded="false" aria-controls="bookinglist">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                공연 예약 조회
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="bookinglist" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="a_performance_booking_t">전체 예약 조회</a>
                                    <a class="nav-link" href="a_performance_booking_f?category=1">콘서트 예약 조회</a>
                                    <a class="nav-link" href="a_performance_booking_f?category=2">연극 예약 조회</a>
                                    <a class="nav-link" href="a_performance_booking_f?category=3">전시회 예약 조회</a>
                                </nav>
                            </div>
                        </div>                
                        <div class="nav">
						<div class="sb-sidenav-menu-heading">회원</div>
						<a class="nav-link" href="a_member_main">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 전체 회원 관리
						</a>
					</div>
					<div class="nav">
                            <div class="sb-sidenav-menu-heading">공지</div>
                            <a class="nav-link" href="a_notice_main">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                             	   전체 공지 사항
                            </a>
                        </div>
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">리뷰</div>
                            <a class="nav-link" href="a_review_main">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                             	  전체 리뷰 목록
                            </a>
                        </div>
                    </div>

					

                    <a href="index">@STS ent.</a>
                </nav>
            </div>
</body>
</html>