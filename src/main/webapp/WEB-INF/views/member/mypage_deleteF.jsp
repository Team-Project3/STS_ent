<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/member/mypage.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<script type="text/javascript" src="js/member/mypage.js"></script>
<input type="hidden" value="${membervo.password}" id="pw">

<body>
	<p>비밀번호를 입력하세요:</p>
	<input type="password" id="password" name="password" required>
	<br>
	<br>
	<button type="button" onclick="return submitForm()">탈퇴</button>
</body>
</html>
