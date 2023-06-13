<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
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
				<div class="memberinfo">
					<div class="member">
						<h2>회원 정보</h2>
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

							<button class="listbtn_wr" type="submit">수정</button>
							&nbsp;&nbsp; 
							<input type="button" class="listbtn_wr" onclick="deleteMember()" value="탈퇴">

						</div>
					</div>

				</div>
			</form>
		</div>


		<%-- 리뷰 목록 출력 부분 --%>
		<div class="reviewlist">
			<h2>예약 목록</h2>
			<hr>
			<table>
				<thead>
					<tr>
						<th>회원 ID</th>
						<th>공연 제목</th>
						<th>리뷰 별점</th>
						<th>리뷰 내용</th>
						<th>작성 일자</th>
					</tr>
				</thead>
				<tbody>
					<%-- 리뷰 목록을 반복하여 출력 --%>
					<c:forEach items="${reviewmemberlist}" var="review">
						<tr>
							<td>${review.id}</td>
							<td>${review.tname}</td>
							<td>${review.rpoint}</td>
							<td>${review.rcontent}</td>
							<td>${review.regdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


		<%-- 예약 목록 출력 부분 --%>
		<div class="bookinglist">
			<h2>예약 목록</h2>
			<hr>
			<table>
				<thead>
					<tr>
						<th>회원 ID</th>
						<th>공연 일자</th>
						<th>공연 시간</th>
						<th>공연 좌석</th>
						<th>예약 인원</th>
						<th>결제 상태</th>
					</tr>
				</thead>
				<tbody>
					<%-- 예약 목록을 반복하여 출력 --%>
					<c:forEach items="${bookingmemberlist}" var="review">
						<tr>
							<td>${review.id}</td>
							<td>${review.dday}</td>
							<td>${review.time}</td>
							<td>${review.seat}</td>
							<td>${review.head}</td>
							<td>${review.bstatus}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>








	</div>



	<div class="footer">
		<%@ include file="../footer.jsp"%>
	</div>
	
</body>
</html>