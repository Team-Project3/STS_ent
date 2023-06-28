<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.2.min.js"
	integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/member/member.js"></script>
<link rel="stylesheet" type="text/css" href="css/member/popup.css" />
<script type="text/javascript">
function idok(){
  self.close();
}
</script>
</head>
<body class="findpwd">
	<div class="changepwd">

		<form method="post" name="formm" action="change_pwd" id="pwd_form"
			style="margin-right: 0">
			<h1>비밀번호 찾기 결과</h1>
			
			<c:if test="${message == 1}">
			<table>
				<tr>
					<td>User ID</td>
					<td><input type=text name="id" value="${id}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>새 비밀번호</td>
					<td><input type="password" name="password" id="password"></td>
				</tr>
				<tr>
					<td>새 비밀번호 확인</td>
					<td><input type="password" name="pwdCheck" id="pwdcheck"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" value="확인" onclick="changePassword()"></td>
				</tr>
			</table>
			</c:if>
			
			<c:if test="${message == -1 }">
    			<div id="text">
    				가입하지 않은 ID입니다.<br>
    				<input type="button" value="확인" onclick="idok()">
    			</div>
	   		</c:if>
		</form>
	</div>
</body>
</html>