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
        <title>공연 목록</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/a_performance.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%@ include file="a_header.jsp" %>
                <div id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">전체 공연 목록</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Performance List</li>
                        </ol>
                        
                        <div align="right">
							<a class="btn btn-primary" href="#" id="perInsert" style="margin-bottom:10px;">공연 등록</a>
						</div>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                          		     전체 공연 목록
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
                                    <tbody>
                                    <c:forEach var="total" items="${tlist}" varStatus="loop">
                                        <tr>
                                            <td data-sortable="true"><a href="index" id="detail">${total.tseq}</a></td>
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
                 </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>