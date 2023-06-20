<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/a_performance.css" rel="stylesheet" />
        <link rel="shortcut icon" href="img/favicon.png">
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
       <%@ include file="../a_header.jsp" %>
        <div id="layoutSidenav_content">
                <main>

                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Admin Page</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">관리자 페이지</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        월 별 수익 (단위 :원)
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40">
                                    </canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        월 예매 현황
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                               최근 예매 현황
                            </div>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>예매 번호</th>
                                            <th>ID</th>
                                            <th>공연종류</th>
                                            <th>공연명</th>
                                            <th>예약날짜</th>
                                            <th>인원</th>
                                            <th>좌석</th>
                                            <th>금액</th>
                                            <th>예약상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="book" items="${booklist}" varStatus="loop">
                                        <tr>
                                            <td>${book.bseq}</td>
                                            <td>${book.id}</td>
                                            <td>
                                            <c:choose>
                                            <c:when test="${book.category == 1}">콘서트</c:when>
                                            <c:when test="${book.category == 2}">연극</c:when>
                                            <c:when test="${book.category == 3}">전시회</c:when>
                                            </c:choose>
                                            </td>
                                            <td>${book.tname}</td>
                                            <td>
                                            <fmt:formatDate value="${book.dday}" pattern="yyyy-MM-dd" var="dday" />
											${dday}
                                            </td>
                                            <td>${book.head}</td>
                                            <td>${book.seat}</td>
                                            <td><c:set var="totalprice" value="${book.head*book.price}"></c:set>${totalprice}</td>
                                            <td>${book.bstatus}</td>
                                        </tr>
                                  </c:forEach>      
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/chart-area-demo.js"></script>
        <script src="assets/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script>createChartWithData();</script>
        <script>chart_bar_demo();</script>
    </body>
</html>
