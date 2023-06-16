<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
    	<title>예약 정보 상세</title>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/a_performance.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
    </head>
	<script type="text/javascript">
	function a_updatebooking() {
        location.href = "a_performance_edit?tseq=" + document.getElementById("tseq").value;
    }
	</script>
    <body class="sb-nav-fixed">
       <%@ include file="../a_header.jsp" %>
                <div id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">예약 정보 상세</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Booking Information</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                          		     예약 정보<br>
                            </div>
                            <div class="card-body">
                            <div class="detailimg">
                            	<c:choose>
                            	<c:when test="${totalent.category ==1}"><img alt="" src="img/concert/${totalent.pimg}.jpg"></c:when>
                            	<c:when test="${totalent.category ==2}"><img alt="" src="img/theater/${totalent.pimg}.jpg"></c:when>
                            	<c:when test="${totalent.category ==3}"><img alt="" src="img/museum/${totalent.pimg}.jpg"></c:when>
                            </c:choose>
                            </div>
                            <div class="detailtable">
                            <table class="detailtable1">
                            	<tr>
                            	<td>예약 번호</td>
                            	<td>${bookingVO.bseq}</td>
                            	</tr>
                            	<tr>
                            	<td>예약자 아이디</td>
                            	<td>${bookingVO.id}</td>
                            	</tr>
                            	<tr>
                            	<td>공연 종류</td>
                            	<td>
                            	<c:choose>
                            		<c:when test="${totalent.category ==1}">콘서트</c:when>
                            		<c:when test="${totalent.category ==2}">연극</c:when>
                            		<c:when test="${totalent.category ==3}">전시회</c:when>
                           		</c:choose>
                            	</td>
                            	</tr>
                            	<tr>
                            	<td>좌석 정보</td>
                            	<td>${bookingVO.seat}</td>
                            	</tr>
                            	<tr>
                            	<td>인원 정보</td>
                            	<td>${bookingVO.head}</td>
                            	</tr>
                            	<tr>
                            	<td>예약 날짜</td>
                            	<td>
                            	<fmt:formatDate value="${bookingVO.dday}" pattern="yyyy-MM-dd" var="dday"/>
                            	${dday}
                            	</td>
                            	</tr>
                            	<tr>
                            	<td>예약완료 시간</td>
                            	<td>
								<fmt:formatDate value="${bookingVO.today}" pattern="yyyy-MM-dd" var="today" />
								${today}
                            	</td>
                            	</tr>
                            	<tr>
                            	<td>결제 금액</td>
                            	<td>
                            	<c:set value="${bookingVO.head * totalent.price}" var="totalprice"></c:set>
                            	${totalprice}
                            	</td>
                            	</tr>
                            	<tr>
                            	<td>결제 상태</td>
                            	<td>
                            	<select>
                            	<option value="${bookingVO.bstatus}">${bookingVO.bstatus}</option>
                            	<option value="결제 취소">결제취소</option>
                            	<option value="환불완료">환불처리중</option>
                            	</select>
                            	</td>
                            	</tr>
                            	<tr>
                            	<td>
                            	<button type="button" onclick="a_updatebooking()">상태 변경</button>&emsp;&emsp;
                            	</td>
                            	</tr>
                            </table>
							</div>
								<div>
                          		
                          		</div>
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