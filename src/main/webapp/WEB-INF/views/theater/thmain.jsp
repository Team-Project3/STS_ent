<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>연극 예약 페이지</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="img/favicon.png">
	<link rel="stylesheet" type="text/css" href="css/thmain.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
	
	<script type="text/javascript">
	function board() {
		var url = "board";
		window.open(url, "_blank_",
				"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=500")
	}
	</script>
</head>
<body>

<div class="thmain">
	<h1>연극 예약하기</h1>
	<button onclick="board()">예약</button>
</div>

<div class="footer">
	<%@ include file="../footer.jsp" %>
</div>

>>>>>>> develop
</body>
</html>