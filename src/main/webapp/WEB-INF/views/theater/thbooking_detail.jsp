<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 1px solid #444444;
	margin-left: 300px;
	margin-top: -300px;
	height: 300px;
}

tr, td {
	border: 1px solid #444444;
}
</style>
<script type="text/javascript">
function bookingdetail() {
	var BookingMain = document.getElementById("BookingMain");
	BookingMain.submit();
}

</script>
</head>
<body>
<form action="BookingMain" id="BookingMain" method="post">
	<img alt="" src="img/theater/${theaterVO.pimg}.jpg"
		style="width: 200px; height: 300px;">
<div class="table">
	<table>
		<tr>
			<td></td>
			<td>예약 정보</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${membervo.id}</td>
		</tr>
		<tr>
			<td>연극 정보</td>
			<td>${theaterVO.tname}</td>
		</tr>
		<tr>
			<td>좌석 정보</td>
			<td>${selectedSeats}</td>
		</tr>
		<tr>
			<td>인원 정보</td>
			<td>${selectedSeatsCount} 명</td>
		</tr>
		<tr>
			<td>총 금액</td>
			<td>${totalprice} 원</td>
		</tr>
		<tr>
			<td>공연 날짜</td>
			<td>${dday}</td>
		</tr>
	</table>
	
	<button type="button" onclick="bookingdetail()">결제하기</button>
</div>
<input type="hidden" name="tseq" value="${theaterVO.tseq}">
<input type="hidden" name="seat" value="${selectedSeats}">
<input type="hidden" name="id" value="${membervo.id}">
<input type="hidden" name="head" value="${selectedSeatsCount}">
<input type="hidden" name="dday" value="${dday}">
</form>
</body>
</html>