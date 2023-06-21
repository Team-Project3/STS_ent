<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function bookingdetail() {
	var BookingMain = document.getElementById("BookingMain");
	BookingMain.submit();
}
</script>
<body>
	<form action="BookingMain" id="BookingMain" method="post">
		쨔잔<br><br>
		아 이 디 : ${loginUser.id}<br>
		공연명 : ${concert.tname}<br>
		공연날짜 : ${param.dday}<br>
		(구역/시간)정보 : ${seat}<br>
		인원정보 : ${param.head}명<br>
		총 결제금액 : ${param.totalPrice}원<br><br>
		
		<input type="hidden" name="tseq" value="${concertVO.tseq}">
		<input type="hidden" name="seat" value="${param.seat}">
		<input type="hidden" name="id" value="${loginUser.id}">
		<input type="hidden" name="head" value="${param.head}">
		<input type="hidden" name="dday" value="${param.dday}">
		
		<button type="button" onclick="bookingdetail()">결제하기</button>
	</form>
</body>
</html>