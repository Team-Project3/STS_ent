<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function calculateTotal() {
	    var ticketPrice = parseInt("${museum.price}");
	    var ticketQuantity = parseInt(document.getElementById("head").value);
	    var totalPrice = ticketPrice * ticketQuantity;
	    document.getElementById("totalPrice").textContent = totalPrice;
	}
</script>
<body>
	<form action="mbooking_detail" method="post" id="museum_booking">
	
		<input type="hidden" name="tseq" value="${museum.tseq}">
		전시회 제목: ${museum.tname}<br>
	
		<img id="img" src="img/museum/${museum.pimg}.jpg" style="width:400px; height:450px;"><br>
		선택 날짜 : ${dday}<br>
		선택 시간 : ${time}<br>
		
		<label for="seat">시간 선택&nbsp;:&nbsp;</label>
				<select id="seat" name="seat">
					<option value="" selected disabled hidden>시간 선택</option>
					<option value="오전">오전</option>
					<option value="오후">오후</option>
				</select>
		<br>
		인원 수 : <input type="number" id="head" min="1" max="10" value="1" oninput="calculateTotal()">매<br>
	
		결제금액 : <span id="totalPrice">${museum.price}</span>원<br>
	
		<input type="hidden" value="${dday}" name="dday">
		<input type="hidden" value="${seat}" name="seat">
		<input type="hidden" value="" name="totalPrice">
		<input type="hidden" value="" name="head">
		
		<button onclick="history.back()">이전</button>&emsp;&emsp;
		<button onclick="submitForm()">다음</button>
	</form>
	
	<script>
		function submitForm() {
			var form = document.getElementById("museum_booking");
			var totalPriceInput = document.querySelector('input[name="totalPrice"]');
			var headInput = document.querySelector('input[name="head"]');
			var totalPrice = parseInt(document.getElementById("totalPrice").textContent);
			var head = parseInt(document.getElementById("head").value);
			
			totalPriceInput.value = totalPrice;
			headInput.value = head;
			
			form.submit();
		}
	</script>

</body>
</html>