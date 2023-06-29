<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html oncontextmenu="return false">
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel='stylesheet' href='css/total_ent/total_ent_booking_detail.css'>
<script src="js/total_ent/total_ent_booking_detail.js"></script>
</head>
<body oncontextmenu="return false">
	<div class="container">
		<form action="BookingMain" id="BookingMain" method="post"
			class="booking-form">
			<c:choose>
				<c:when test="${total_entVO.category ==1}">
					<img alt="" src="img/concert/${total_entVO.pimg}.jpg">
				</c:when>
				<c:when test="${total_entVO.category ==2}">
					<img alt="" src="img/theater/${total_entVO.pimg}.jpg">
				</c:when>
				<c:when test="${total_entVO.category ==3}">
					<img alt="" src="img/museum/${total_entVO.pimg}.jpg">
				</c:when>
			</c:choose>
			<table>
				<tr>
					<th colspan="2">예약 정보</th>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${membervo.id}</td>
				</tr>
				<tr>
					<td>공연명</td>
					<td>${total_entVO.tname}</td>
				</tr>
				<tr>
					<td>(구역/시간)정보</td>
					<td>${seat}</td>
				</tr>
				<tr>
					<td>인원 정보</td>
					<td>${bookingVO.head}명</td>
				</tr>
				<tr>
					<td>총 금액</td>
					<td><c:set value="${bookingVO.head*total_entVO.price}" var="totalprice"></c:set> ${totalprice} 원</td>
				</tr>
				<tr>
					<td>공연 날짜</td>
					<td><fmt:formatDate value="${bookingVO.dday}" pattern="yyyy-MM-dd" var="day" />${day}</td>
				</tr>
			</table>
			<div class = "buttons">
			<button type="button" onclick="prevpage()" class="prevbutton">이전으로</button>&emsp;&emsp;<button type="button" onclick="bookingdetail()" class="nextbutton">결제하기</button>
			</div>
			<input type="hidden" name="tseq" value="${total_entVO.tseq}">
			<input type="hidden" name="seat" value="${seat}"> <input
				type="hidden" name="id" value="${membervo.id}"> <input
				type="hidden" name="head" value="${bookingVO.head}"> <input
				type="hidden" name="dday" value="${day}">
		</form>
	</div>
</body>
</html>