<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
	  <script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
	  <script type="text/javascript" src="js/member.js"></script>
  </head>
  <body>
  <div id="wrap">
  	<h1>비밀번호 찾기</h1>
  	<br>
	<div style="color: #ac2925">
    	<p style="margin-left: 50px;">입력된 정보로 임시 비밀번호가 전송됩니다.</p>
    </div>
	<form name="findPW" id="findPW" action="pwd_auth" method="post">
	<table>
	<tr>
		<td align="right"><label> 이메일</label></td>
		<td><input type="email" id="email" name="email" id="email" value="" required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i" placeholder="가입시 등록한 이메일을 입력하세요."></td>
	</tr>
	<tr>
		<td align="right"><label> 이름</label></td>
		<td><input type="text" name="name" id="name" value="" placeholder="가입 시 등록한 이름을 입력하세요."></td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="button" value="비밀번호 찾기" onclick="findPassword()"></td>
	</tr>
	</table>
	</form>
	</div>
</body>
</html>