<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function board() {
	var url = "board";
	window.open(url, "_blank_",
			"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=500")
}
</script>
</head>
<body>
<h1>연극 예약하기</h1>
<button onclick="board()">예약</button>
</body>
</html>