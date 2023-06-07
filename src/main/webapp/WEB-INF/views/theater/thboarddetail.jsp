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
</head>
<body>
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
	</table>
</div>
</body>
</html>