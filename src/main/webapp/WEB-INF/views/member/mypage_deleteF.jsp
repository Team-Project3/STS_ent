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
	if (document.getElementById("password").value == "") {
		alert("비밀번호를 입력하세요.");
		document.getElementById("password").focus();
		return false;
	} else {
		var theform = document.getElementById("delete");
		
		theform.action = "mypage_delete";
		theform.submit();
	}
}

</script>


<body>
<form name="deleteForm" id="delete" method="post">
		<p>비밀번호를 입력하세요:</p>
		<input type="password" id="password" name="password" required>
		<br><br>
		<button type="button" onclick="submitForm()">탈퇴</button>
	</form>


</body>
</html>
