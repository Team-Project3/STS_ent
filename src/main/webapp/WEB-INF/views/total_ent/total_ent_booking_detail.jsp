<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 96vh;
	font-family: Arial, sans-serif;
	background-color: #f1f1f1;
}

.booking-form {
	width: 509px;
	padding: 20px;
	border: 1px solid #e1e1e1;
	border-radius: 5px;
}

.booking-form img {
	width: 200px;
	height: 300px;
	object-fit: cover;
	margin-bottom: -304px;
}

.booking-form table {
	width: 280px;
	margin-left: 229px;
	border-collapse: collapse;
}

.booking-form th, .booking-form td {
	padding: 10px;
	text-align: left;
	border: 1px solid #e1e1e1;
}

.booking-form th {
	background-color: #d1d1d1;
	font-weight: bold;
	color: #444444;
}

.booking-form button {
	width: 100%;
	padding: 10px;
	margin-top: 20px;
	background-color: #4caf50;
	border: none;
	color: #ffffff;
	font-weight: bold;
	cursor: pointer;
}

.booking-form button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
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
					<td>공연 명</td>
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
					<td><c:set value="${bookingVO.head*total_entVO.price}" var="totalprice"></c:set>
					${totalprice} 원
					</td>
				</tr>
				<tr>
					<td>공연 날짜</td>
					<td><fmt:formatDate value="${bookingVO.dday}"
							pattern="yyyy-MM-dd" var="day" />${day}</td>
				</tr>
			</table>
			<button type="button" onclick="bookingdetail()">결제하기</button>

			<input type="hidden" name="tseq" value="${total_entVO.tseq}">
			<input type="hidden" name="seat" value="${seat}"> 
			<input type="hidden" name="id" value="${membervo.id}"> 
			<input type="hidden" name="head" value="${bookingVO.head}"> 
			<input type="hidden" name="dday" value="${day}">
		</form>
	</div>

	<script>
		function bookingdetail() {
			var BookingMain = document.getElementById("BookingMain");
			BookingMain.submit();
		}
	</script>
</body>
</html>