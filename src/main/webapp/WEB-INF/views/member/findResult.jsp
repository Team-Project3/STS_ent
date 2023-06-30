<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="css/member/popup.css" />
<link rel="shortcut icon" href="img/favicon.png">
<script type="text/javascript">
	function idok() {
		self.close();
	}
</script>
</head>
<body class="findIdResult">
	<div id="idResult">
		<h1>ID 찾기 결과</h1>
		<form method="post" name="formm" action="id_check_form" id="id_check_form">
			<div id="text2">
				<c:if test="${message == 1}">
					<script type="text/javascript">
						opener.document.formm.id.value = "";
					</script>
					요청하신 ID는 <i>${id}</i>입니다.
				</c:if>
				
				<c:if test="${message == -1}">
					가입하지 않은 ID입니다.
				</c:if>
			</div>
			<input type="button" value="확인" onclick="idok()">
		</form>
	</div>
</body>
</html>