<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/museum_detail.css" />
<script type="text/javascript">
function museum_booking() {
	var tseq = ${museum.tseq};
	var membervo = document.getElementById("id").value;
	var dday = document.getElementById("dday").value;
	
	if(membervo == null || membervo == ""){
		alert("로그인 후 이용해주세요.")
		 location.href = 'login_form';
	} else if(dday == "") {
		alert("날짜를 선택해주세요.");
	} else {
		var url = "museum_booking?tseq=" + tseq + "&dday=" + dday;
		window.open(url, "_blank_",
		"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=700")
	}
	
}

</script>
</head>
<body>
	<input type="hidden" value="${membervo.id}" id="id">
	
	<div class="museum_detail">
		<div class="museumTitle">
			<div id="title">${museum.tname}<br></div>
			<div id="subtitle">${formattedSDate} ~ ${formattedEDate}&emsp;&emsp;|&emsp;&emsp;${museum.place}<br></div>
		</div>	
		<hr>
		<div class="museum_info">
			<div id="infoimg">
				<img id="img" src="img/museum/${museum.pimg}.jpg">
			</div>
			
			<div class="infoall">
				<dl>
					<dt>등급</dt><dd>&nbsp;전체관람가</dd>
					<dt>관람시간</dt><dd>&nbsp;--</dd>
					<dt>출연</dt><dd>&nbsp;--</dd>
					<dt>가격</dt><dd>&nbsp;${museum.price}</dd>
					<dt>최대관객</dt><dd>&nbsp;오전: ${am} 명 , 오후: ${pm} 명</dd>
				</dl> 
			</div>
		</div>
		<hr>
		
		
		<div class="selection">
			<label for="date">날짜 선택&nbsp;:&nbsp;</label>
				<input type="date" id="dday" min="${formattedSDate}" max="${formattedEDate}" name="dday">
			<button onclick="museum_booking()">예약</button>
		</div>
	
		<div class="content">
			<img id="cimg" src="img/museum/${museum.cimg}.jpg">
		</div>
	
	
	</div>
	
	<div class="footer">
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>