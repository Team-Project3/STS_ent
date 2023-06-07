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
	var url = "thboard?tseq=" + tseq;
	window.open(url, "_blank_",
			"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=500")
	
}
</script>
</head>
<body>
${theater}<br>
${theater.tname}<br>
${formattedDate}<br>
<button onclick="board()">예약</button>
<img alt="" src="img/theater/${theater.pimg}.jpg">
</body>
</html>