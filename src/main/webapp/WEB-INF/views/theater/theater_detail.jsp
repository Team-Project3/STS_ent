<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/theater.css" />
<!-- 추가2줄 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
<script type="text/javascript">
	function board() {
		var tseq = ${theater.tseq};
		var membervo = document.getElementById("id").value;
		var dday = document.getElementById("dday").value;
		if (membervo == null || membervo == "") {
			alert("로그인 후 이용해주세요.")
			location.href = 'login_form';
		} else if (dday == "") {
			alert("날짜를 선택해주세요.");
		} else {
			var url = "thboard?tseq=" + tseq + "&dday=" + dday;
			window.open(url, "_blank_","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=500")
		}
	}
	function validateDate(input) {
		if (input.value === "") {
			alert("Please select a date.");
		}
	}
	$(document).ready(function(){
		$('body').removeClass('jsOff');
		$('body').addClass('jsOn');
		$('#tabs a').on ('click', function(e){
		$('#tabs a.current').removeClass('current');
		$('.tab-section:visible').hide();
		$(this.hash).show();
		$(this).addClass('current');
		e.preventDefault;
		}).filter(':first').click();
	});
</script>
</head>
<body>
	<div class="thdetail">
		<div class="thdetail_header">
			<h1>&ensp;연극&emsp;<${theater.tname}></h1><br>
			<h3>&emsp;${formattedSDate} ~ ${formattedEDate}&emsp;|&emsp;${theater.place}</h3><br>
			<hr>
		</div>
		
		<div class="thdetail_info">
		
			<div>
				<img id="pimg" src="img/theater/${theater.pimg}.jpg">
			</div>
		
			<div id="info">
				<table>
					<tr>
						<td colspan="2" style="border-bottom: 1px solid white;">
						<h3>공연 정보</h3></td>
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
						<td>가격</td>
						<td>${theater.price}</td>
					</tr>
					<tr>
						<td colspan="2"><br></td>
					</tr>
					<tr>
						<td colspan="2" style="border-bottom: 1px solid white;">
						<h3>공연 시간 안내</h3></td>
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
						<td>공연시간</td>
						<td>${theater.time}</td>
					</tr>	
				</table>

			</div>
			
		</div>
		
		<input type="hidden" value="${membervo.id}" id="id">
		<div class="booking">
			<input type="date" id="dday" min="${formattedSDate}"
				max="${formattedEDate}" value="Please select a date"
				onfocus="this.value=''" onchange="validateDate(this)" name="dday">
			<button onclick="board()">예약</button>
			
			<div>
				총 좌석 : ${seat}
			</div>
		</div>
		
		<ul id="tabs">
			<li><a href="#cimg">공연정보</a></li>
			<li><a href="#review" onClick="reviewList()">후기</a></li>
		</ul>
	
	<div class="tab-section" id="cimg">
		<img id="cimg" src="img/theater/${theater.cimg}.jpg">
	</div>
		
	<div class="tab-section" id="review">
		<h1>후기글</h1>
		<%@ include file="../member/review.jsp" %>
	</div>
	
	</div>
	<div class="footer">
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>