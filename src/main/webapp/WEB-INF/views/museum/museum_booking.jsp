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

function go_save() {
	const form = document.getElementById("mbooking_detail");
	
    form.submit();
}

</script>
<body>
<form action="mbooking_detail" method="post" id="museum_booking">

<input type="hidden" name="tseq" value="${museum.tseq}">

전시회 제목: ${museum.tname}<br>
<img id="img" src="img/museum/${museum.pimg}.jpg" style="width:400px; height:450px;"><br>
선택 날짜 : ${dday}<br>
선택 시간 : ${time}<br>

인원 수 : <input type="number" id="head" min="1" max="10" value="1" oninput="calculateTotal()">매<br>

결제금액 : <span id="totalPrice">${museum.price}</span>원<br>


<button onclick="">이전</button>&emsp;&emsp;
<button onclick="go_save()">다음</button>
</form>
</body>
</html>