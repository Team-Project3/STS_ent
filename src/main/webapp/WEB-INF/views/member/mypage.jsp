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

<body>
<div class="mypage">
	<form action="mypage_updateF" method="post">
	
	<input type="hidden" value="${membervo.id}" id="id">
	
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
			<a class="listbtn_wr" href="deleteUser()">탈퇴</a>
			
			</div>
		</div>
	
	</div>
	</form>

	
	
</div>	
	
<div class="footer">
	<%@ include file="../footer.jsp"%>
</div>

</body>
</html>