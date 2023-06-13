<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mypage.css" />
</head>
<%
	// 세션 체크
	if (session == null || session.getAttribute("loginUser") == null) {
		out.println("<script>alert('로그인 후에 이용해주세요.'); location.href='login_form';</script>");
	}
%>
<body>
<div class="mypage">
	<input type="hidden" value="${membervo.id}" id="id">

	<div>
	<form action="mypage_updateF" method="post">
	
	
	
	<div class="memberinfo" align="center">
		<div class="member">
			<span id="h">회원 정보</span>
			<hr>
			
			<div>
			<table>
				<tr>
					<td>이름</td>
					<td id="name">${membervo.name }</td>
					<td>생일</td>
					<td id="birth">${membervo.birth }</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td id="id">${membervo.id }</td>
					<td>전화번호</td>
					<td id="phone">${membervo.phone }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="3" id="email">${membervo.email }</td>
				</tr>
			</table>
		 	
		 	<button class="listbtn_wr" type="submit">수정</button>&nbsp;&nbsp;
			<button class="listbtn_wr" onclick="deleteMember()">탈퇴</button>
			
			</div>
		</div>
	
	</div>
	</form>
	</div>
	
	
	<div>
		
	
	</div>
	
	
</div>	
	
<div class="footer">
	<%@ include file="../footer.jsp"%>
</div>
<script>
	// 탈퇴 확인
	function deleteMember() {
		var password = prompt("비밀번호를 입력하세요.");
		if (password !== null) {
			document.getElementById("passwordInput").value = password;
			document.getElementById("deleteForm").submit();
		}
	}
</script>
</body>
</html>