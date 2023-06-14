<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/concert.css" />

<!-- 추가2줄 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>

<script type="text/javascript">
function concert_booking() {
	var tseq = ${concert.tseq};
	var membervo = document.getElementById("id").value;
	var dday = document.getElementById("dday").value;
	
	if(membervo == null || membervo == ""){
		alert("로그인 후 이용해주세요.");
		location.href = 'login_form';
	} else if(dday == "") {
		alert("날짜를 선택해주세요.");
	} else {
		var url = "concert_booking?tseq=" + tseq + "&dday=" + dday;
		window.open(url, "_blank_",
		"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=800, height=500")
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
<body class="jsoff">
<input type="hidden" value="${membervo.id}" id="id">

<div class="concert_detail">
	<div class="concertTitle">
		<div id="title">
			${concert.tname}<br>
		</div>
		<div id="subtitle">
			${formattedSDate} ~ ${formattedEDate}&emsp;&emsp;|&emsp;&emsp;${concert.place }
		</div>
		<hr>
		<div class="concert_info">
			<div id="infoimg">
				<img alt="" src="img/concert/${concert.pimg}.jpg">
			</div>
			<div class="infoall">
				<dl>
					<dt>등급</dt><dd>&nbsp;전체관람가</dd>
					<dt>관람시간</dt><dd>&nbsp;--</dd>
					<dt>출연</dt><dd>&nbsp;--</dd>
					<dt>가격</dt><dd>&nbsp;${concert.price}</dd>
					<dt>좌석</dt><dd>&nbsp;r석 = ${r} a석 = ${a} b석 = ${b}</dd>
				</dl>
			</div>
		</div>
		
		<div class="selection">
			<label for="date">날짜 선택&nbsp;:&nbsp;</label>
				<input type="date" id="dday" min="${formattedSDate}" max="${formattedEDate}" name="dday">
			<button onclick="concert_booking()">예약</button>
		</div>
		<hr>
		<ul id="tabs">
			<li><a href="#cimg">공연정보</a></li>
			<li><a href="#review" onClick="reviewList()">후기</a></li>
		</ul>
	
		<div class="tab-section" id="cimg">
			<img id="cimg" src="img/concert/${concert.cimg}.jpg">
		</div>
		
		<div class="tab-section" id="review">
			후기글<br>
			<%@ include file="../member/review.jsp" %>
		</div>
	</div>
</div>

<div class="footer">
	<%@ include file="../footer.jsp"%>
</div>
</body>
</html>