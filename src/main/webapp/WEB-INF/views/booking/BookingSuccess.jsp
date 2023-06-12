<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function goindex() {
	window.close();
	window.opener.location.href="index";
}
function gomypage() {
	window.close();
	window.opener.location.href="mypage";
}
</script>
</head>
<body>
<h1>${id} 님 예약이 완료되었습니다.</h1>
<button type="button" onclick="goindex()">메인으로 가기</button>
<button type="button" onclick="gomypage()">마이페이지 가기</button>
</body>
</html>