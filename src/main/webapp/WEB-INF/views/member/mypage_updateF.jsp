<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mypage.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/member/mypage.js"></script>
</head>
<body>
<div class="mypage">
	<form name="formm" id="update" method="post">
	
		<div class="memberinfo" align="center">
			<div class="member">
				<span id="h">회원 정보</span>
				<hr>
				
				<div>
					<table>
						<tr>
							<td>이름</td>
							<td><input id="name" name="name" type="text" value="${membervo.name}"></td>
							<td>생일</td>
							<td id="birth"><input type="text" value="${membervo.birth}" name="birth" readonly="readonly"></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input id="id" name="id" type="text" value="${membervo.id}" readonly="readonly"></td>
							<td>전화번호</td>
							<td><input id="phone" name="phone" type="text" value="${membervo.phone}"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td colspan="3"><input id="email" name="email" type="text" value="${membervo.email}"></td>
						</tr>
					</table>
			 		<input class="listbtn_wr" type="button" value="수정" onClick="submitUpdate()">		 		     
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
