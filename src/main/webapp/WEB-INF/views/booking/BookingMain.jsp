<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html oncontextmenu="return false">
<head>
<link rel="stylesheet" type="text/css"
	href="css/booking/bookingmain.css" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body oncontextmenu="return false">
	<div class="container">
		<div class="payment-buttons">
			<button onclick="kakaoPay()" class="payment-button">
				<img alt="" src="img/booking/kakaopay.png">
			</button>
			<button onclick="nicepay()" class="payment-button">
				<img alt="" src="img/booking/nicepay.png">
			</button>
			<button onclick="kicc()" class="payment-button">
				<img alt="" src="img/booking/kicc.webp">
			</button>
			<button onclick="tosspayments()" class="payment-button">
				<img alt="" src="img/booking/toss.png">
			</button>
		</div>
	</div>
	<form action="BookingSuccess" id="submit" method="get">
		<input type="hidden" name="oseq" value="${orderVO.oseq}" id="oseq">
		<input type="hidden" name="head" value="${orderVO.head}" id="head">
		<input type="hidden" name="tname" value="${totalVO.tname}" id="tname">
		<input type="hidden" name="totalprice" value="${totalprice}"
			id="totalprice"> <input type="hidden" name="email"
			value="${memberVO.email}" id="email"> <input type="hidden"
			name="name" value="${memberVO.name}" id="name"> <input
			type="hidden" name="phone" value="${memberVO.phone}" id="phone">
	</form>
</body>
<script src="js/booking/bookingmain.js"></script>
</html>