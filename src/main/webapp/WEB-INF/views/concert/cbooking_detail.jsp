<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function bookingdetail() {
	var cbooking_success = document.getElementById("cbooking_success");
	cbooking_success.submit();
}
</script>
<body>
	<form action="cbooking_success" id="cbooking_success" method="post">
		쨔잔<br><br>
		아 이 디 : ${loginUser.id}<br>
		콘서트명 : ${concert.tname}<br>
		공연날짜 : ${param.dday}<br>
		구역정보 : ${seat}석<br>
		인원정보 : ${param.head}명<br>
		총 결제금액 : ${param.totalPrice}원<br><br>
		
		<input type="hidden" name="tseq" value="${concertVO.tseq }">
		<input type="hidden" name="seat" value="${param.seat}">
		<input type="hidden" name="id" value="${loginUser.id}">
		<input type="hidden" name="head" value="${param.head}">
		<input type="hidden" name="dday" value="${param.dday}">
		
		<button type="button" onclick="bookingdetail()">결제하기</button>
	</form>
</body>
</html>