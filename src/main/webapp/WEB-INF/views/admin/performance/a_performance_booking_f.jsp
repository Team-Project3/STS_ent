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
        <title>
        <c:choose>
			<c:when test="${category == 1}">콘서트 예약 목록</c:when>
			<c:when test="${category == 2}">연극 예약 목록</c:when>
			<c:when test="${category == 3}">전시회 예약 목록</c:when>
		</c:choose>
		</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/a_performance.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%@ include file="a_header.jsp" %>
        <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">
                        <c:choose>
							<c:when test="${category == 1}">콘서트 예약 목록</c:when>
							<c:when test="${category == 2}">연극 예약 목록</c:when>
							<c:when test="${category == 3}">전시회 예약 목록</c:when>
						</c:choose>
						</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">
                       	 <c:choose>
							<c:when test="${category == 1}">Concert bookingList</c:when>
							<c:when test="${category == 2}">theater bookingList</c:when>
							<c:when test="${category == 3}">Museum bookingList</c:when>
						</c:choose>
                            </li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
						<c:choose>
							<c:when test="${category == 1}">콘서트 예약 목록</c:when>
							<c:when test="${category == 2}">연극 예약 목록</c:when>
							<c:when test="${category == 3}">전시회 예약 목록</c:when>
						</c:choose>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>예약 번호</th>
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
                                    <tfoot>
                                        <tr>
                                            <th>예약 번호</th>
                                            <th>ID</th>
                                            <th>공연종류</th>
                                            <th>공연명</th>
                                            <th>예약날짜</th>
                                            <th>인원</th>
                                            <th>좌석</th>
                                            <th>금액</th>
                                            <th>예약상태</th>                                        
                                        </tr>
                                    </tfoot>
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
            </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>