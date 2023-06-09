<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function bookingdetail() {
	var mbooking_success = document.getElementById("mbooking_success");
	mbooking_success.submit();
}

</script>
<body>
	<form action="mbooking_success" id="mbooking_success" method="post">
		쨔잔<br><br>
		아 이 디 : ${loginUser.id}<br>
		전시회명 : ${museum.tname}<br>
		전시날짜 : ${param.dday}<br>
		시간정보 : ${param.seat}<br>
		인원정보 : ${param.head}<br>
		총 결제금액 : ${param.totalPrice}<br><br>
		
		<input type="hidden" name="tseq" value="${museumVO.tseq }">
		<input type="hidden" name="seat" value="${param.seat}">
		<input type="hidden" name="id" value="${loginUser.id}">
		<input type="hidden" name="head" value="${param.head}">
		<input type="hidden" name="dday" value="${param.dday}">
		
		<button type="button" onclick="bookingdetail()">결제하기</button>
	</form>
</body>
</html>