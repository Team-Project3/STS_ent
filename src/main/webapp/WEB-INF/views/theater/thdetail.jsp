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
	margin-left: 700px;
	width: 1000px;
	height: 500px;
	margin-top: -500px;
	
}

tr, td {
	border: 1px solid #444444;
}

.img {
	margin-left: 200px;
	margin-top: 100px;
}
.img_d{
	margin-left: 600px;
	
}
.booking{
	margin-left: 1500px;
}
</style>
<script type="text/javascript">
function board() {
	var tseq = ${theater.tseq};
	var membervo = document.getElementById("id").value;
	var dday = document.getElementById("dday").value;
	if(membervo == null || membervo ==""){
		alert("로그인 후 이용해주세요.")
		 location.href = 'login_form';
	}
	else if (dday == "") {
		alert("날짜를 선택해주세요.");
	}
	else {
		var url = "thboard?tseq=" + tseq +"&dday=" + dday;
		window.open(url, "_blank_",
				"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=500")
		
	}
}
function validateDate(input) {
	  if (input.value === "") {
	    alert("Please select a date.");
	  }
	}
</script>
</head>
<body>
<div class="img">
<img alt="" src="img/theater/${theater.pimg}.jpg">
</div>
<table>
	<tr>
		<td></td>
		<td>공연정보</td>
	</tr>
	<tr>
		<td>연극명</td>
		<td>${theater.tname}</td>
	</tr>
	<tr>
		<td>장소</td>
		<td>${theater.place}</td>
	</tr>
	<tr>
		<td>시간</td>
		<td>${theater.time}</td>
	</tr>
	<tr>
		<td>시작날짜</td>
		<td>${formattedSDate}</td>
	</tr>
	<tr>
		<td>종료날짜</td>
		<td>${formattedEDate}</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>${theater.price}</td>
	</tr>
	<tr>
		<td>총 좌석</td>
		<td>${theater.seat}</td>
	</tr>
</table>
<input type="hidden" value="${membervo.id}" id="id">
<div class="booking">
<input type="date" id="dday" min="${formattedSDate}" max="${formattedEDate}" 
	value="Please select a date" onfocus="this.value=''" onchange="validateDate(this)" name="dday">
<button onclick="board()">예약</button>
</div>
<div class="img_d">
<img alt="" src="img/theater/${theater.cimg}.jpg">
</div>
</body>
</html>