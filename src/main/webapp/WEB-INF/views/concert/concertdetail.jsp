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
	var url = "board?tseq=" + tseq;
	window.open(url, "_blank_",
			"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=500")
	
}
</script>
</head>
<body>
${concert}<br>
${concert.tname}<br>
${formattedSDate}<br>
${formattedEDate}<br>
<button onclick="board()">예약</button>
<img alt="" src="img/concert/${concert.pimg}.jpg">
</body>
</html>