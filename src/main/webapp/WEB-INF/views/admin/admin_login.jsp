<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="img/favicon.png">
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<script type="text/javascript" src="js/admin.js"></script>
</head>
<body>
	<div class="admin_main">

	관리자 페이지

	<form method="post" action="adminlogin">
	<br><br>
	
	<input type="text" placeholder="아이디" name="a_id" value="${a_id}">
	<input type="password" placeholder="비밀번호" name="a_password">		
	<br>
	<button type="submit" class="submit">로그인</button>
	<br><br>
	
	<button onclick="location='index'">STS</button>
	</form>
	
	
	</div>
	
</body>
</html>