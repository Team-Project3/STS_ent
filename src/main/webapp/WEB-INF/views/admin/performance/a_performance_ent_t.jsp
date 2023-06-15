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
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/a_performance.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%@ include file="a_header.jsp" %>
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>공연 번호</th>
                                            <th>공연명</th>
                                            <th>공연종류</th>
                                            <th>좌석</th>
                                            <th>날짜</th>
                                            <th>시간</th>
                                            <th>가격</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>공연 번호</th>
                                            <th>공연명</th>
                                            <th>공연종류</th>
                                            <th>좌석</th>
                                            <th>날짜</th>
                                            <th>시간</th>
                                            <th>가격</th>    
                                                                               
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="total" items="${tlist}" varStatus="loop">
                                        <tr>
                                            <td>${total.tseq}</td>
                                            <td>${total.tname}</td>
                                            <td>
                                            <c:choose>
                                            <c:when test="${total.category == 1}">콘서트</c:when>
                                            <c:when test="${total.category == 2}">연극</c:when>
                                            <c:when test="${total.category == 3}">전시회</c:when>
                                            </c:choose>
                                            </td>
                                            <td>${total.seat}</td>
                                            <td>
                                            <fmt:formatDate value="${total.sdate}" pattern="yyyy-MM-dd" var="sdate" />
											<fmt:formatDate value="${total.edate}" pattern="yyyy-MM-dd" var="edate" />
											${sdate} ~ ${edate}
                                            </td>
                                            <td>${total.time}</td>
                                            <td>${total.price}</td>
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
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>