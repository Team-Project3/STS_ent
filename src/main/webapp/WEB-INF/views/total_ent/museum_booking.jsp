<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="js/total_ent/museum_booking.js"></script>
<body>
	<form action="total_ent_booking_detail" method="post" id="museum_booking" onsubmit="return false;">
		<input type="hidden" name="tseq" value="${museum.tseq}">
		전시회 제목: ${museum.tname}<br>
	
		<img id="img" src="img/museum/${museum.pimg}.jpg" style="width:400px; height:450px;"><br>
		선택 날짜 : ${dday}<br>
		
		<label for="seat">시간 선택&nbsp;:&nbsp;</label>
				<select id="seat" name="seat">
					<option value="">시간 선택</option>
					<option value="오전">오전</option>
					<option value="오후">오후</option>
				</select>
		<br>
		인원 수 : <input type="number" id="headvalue" min="1" value="1" oninput="calculateTotal()" name="headvalue">매<br>
		결제금액 : <span id="totalPrice">${museum.price}</span>원<br>
		
		오전 예약인원 : ${head}<br>
		오후 예약인원 : ${head2}<br>
	
		<input type="hidden" value="${dday}" name="dday">
		<input type="hidden" value="" name="totalPrice">
		<input type="hidden" value="${am}" id ="am">
		<input type="hidden" value="${pm}" id ="pm">
		<input type="hidden" value="${head}" id ="head1">
		<input type="hidden" value="${head2}" id ="head2">
		<button onclick="history.back()">이전</button>&emsp;&emsp;
		<button onclick="return submitForm()">다음</button>	
	</form>
</body>
</html>