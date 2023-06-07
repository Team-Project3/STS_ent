<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function board() {
	var tseq = ${theater.tseq};
	var membervo = document.getElementById("id").value;
	if(membervo == null || membervo ==""){
		alert("로그인 후 이용해주세요.")
		 location.href = 'index';
	}
	else {
		var url = "thboard?tseq=" + tseq;
		window.open(url, "_blank_",
				"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=500")
		
	}
}
</script>
</head>
<body>
${theater}<br>
${theater.tname}<br>
${formattedSDate}
${formattedEDate}
<img alt="" src="img/theater/${theater.pimg}.jpg">
<input type="hidden" value="${membervo.id}" id="id">
<input type="date" min="${formattedSDate}" max="${formattedEDate}" value="날짜를 선택해주세요.">
<button onclick="board()">예약</button>
</body>
</html>