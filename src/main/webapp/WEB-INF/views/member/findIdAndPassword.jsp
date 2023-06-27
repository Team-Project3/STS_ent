<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.2.min.js"
	integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/member/member.js"></script>
<link rel="stylesheet" type="text/css" href="css/member/popup.css" />
</head>
<body class="findidpw">
	<div id="find" class="form-container">
		<form name="findId" id="findId" action="find_id" method="post">
			<h1>아이디 찾기</h1>
			<table>
				<tr>
					<td align="right"><label> 이름</label></td>
					<td><input type="text" name="name" id="name" value=""></td>
				</tr>
				<tr>
					<td align="right"><label> 이메일</label></td>
					<td><input type="text" name="email" id="email" value=""></td>
				</tr>
				<tr>
					<td align="right" colspan="2"><input type="button"
						value="아이디 찾기" onclick="findMemberId()"></td>
				</tr>
			</table>
		</form>
		
		<form name="findPW" id="findPW" action="find_pwd" method="post">
			<h1>비밀번호 찾기</h1>
			<table>
				<tr>
					<td align="right"><label> 아이디</label></td>
					<td><input type="text" name="id" id="id2" value=""></td>
				</tr>
				<tr>
					<td align="right"><label> 이름</label></td>
					<td><input type="text" name="name" id="name2" value=""></td>
				</tr>
				<tr>
					<td align="right"><label> 이메일</label></td>
					<td><input type="text" name="email" id="email2" value=""></td>
				</tr>
				<tr>
					<td align="right" colspan="2"><input type="button"
						value="비밀번호 찾기" onclick="findPassword()"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>