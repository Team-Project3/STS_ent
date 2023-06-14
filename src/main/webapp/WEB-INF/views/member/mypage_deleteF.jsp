<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mypage.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<script type="text/javascript">
	function submitForm() {
		
		var pw = document.getElementById("pw").value;
		var password = document.getElementById("password").value;
		console.log(pw);
		console.log(password);
		
		if (password == "") {
			alert("비밀번호를 입력하세요.");
			document.getElementById("password").focus();
			return false;
		} else if (pw !== password) {
			alert("비밀번호가 일치하지 않습니다.");
			document.getElementById("password").focus();
			return false;
		} else {
			alert('탈퇴 처리가 완료되었습니다.\n감사합니다.');
			window.close();
			window.opener.location.href = 'mypage_delete';
		}
	}
</script>
<input type="hidden" value="${membervo.password}" id="pw">

<body>
	<p>비밀번호를 입력하세요:</p>
	<input type="password" id="password" name="password" required>
	<br>
	<br>
	<button type="button" onclick="return submitForm()">탈퇴</button>
</body>
</html>
