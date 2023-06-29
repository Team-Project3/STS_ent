<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/member/mypage_updateF.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/member/mypage.js"></script>
</head>
<body>
<div class="mypageUpdate">
	<form name="formm" id="update" method="post">
	
		<div class="memberinfo">
			<div class="member">
				<h1>회원 정보 수정</h1>
				
				<fmt:formatDate value='${membervo.birth}' pattern='yyyy-MM-dd' var="birth"/>
				<div>
					<table>
						<tr>
							<td>아이디</td>
							<td><input maxlength="30" id="id" name="id" type="text" value="${membervo.id}" readonly="readonly"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input maxlength="30" id="name" name="name" type="text" value="${membervo.name}"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input maxlength="30" id="password" type="password" value="${membervo.password}" name="password"></td>
						</tr>
						<tr>
							<td>생일</td>
							<td id="birth"><input maxlength="30" type="text" value="${birth}" name="birth" readonly="readonly"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input maxlength="30" id="phone" name="phone" type="text" value="${membervo.phone}" oninput="hypenTel(this)"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td colspan="3"><input maxlength="50" id="email" name="email" type="text" value="${membervo.email}"></td>
						</tr>
						<tr>
							<td colspan="2"><input class="listbtn_wr" type="button" value="수정" onClick="submitUpdate()"></td>
						</tr>
					</table>
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
