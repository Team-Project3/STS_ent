<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
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

							<button class="listbtn_wr" type="button" onclick="editMember()">수정</button>&nbsp;&nbsp; 
							<input type="button" class="listbtn_wr" onclick="deleteMember()" value="탈퇴">

						</div>
					</div>

				</div>
			
		</div>


		<%-- 리뷰 목록 출력 부분 --%>
		<div class="reviewlist">
			<h2>리뷰 목록</h2>
			<hr>
			<c:choose>
				<c:when test="${not empty noReviewMessage}">
					<p>${noReviewMessage}</p>
				</c:when>
				<c:otherwise>
					<table>
						<thead>
							<tr>
								<th>회원 ID</th>
								<th>공연 제목</th>
								<th>리뷰 별점</th>
								<th>리뷰 내용</th>
								<th>작성 일자</th>
								<th>삭제</th>
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
									<td>
                                		<button class="delete-btn" onclick="deleteReview(${review.id})">삭제</button>
                            		</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>


		<%-- 콘서트 예약 정보 --%>
		<div class="concertList">
			<h2>콘서트 예약 정보</h2>
			<hr>
			<c:choose>
				<%-- 예약된 내역이 없는 경우 --%>
				<c:when test="${empty concertList}">
					<p>예약된 내역이 없습니다.</p>
				</c:when>
				<%-- 예약된 내역이 있는 경우 --%>
				<c:otherwise>
					<table>
						<thead>
							<tr>
								<th>예약 ID</th>
								<th>날짜</th>
								<th>시간</th>
								<th>좌석</th>
								<th>인원</th>
								<th>상태</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${concertList}" var="booking">
								<tr id="concert">
									<td>${booking.id}</td>
									<td>${booking.dday}</td>
									<td>${booking.time}</td>
									<td>${booking.seat}</td>
									<td>${booking.head}</td>
									<td>${booking.bstatus}</td>
									<td>
                                		<button class="delete-btn" onclick="deleteReservation(${booking.id})">삭제</button>
                            		</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>

		<%-- 연극 예약 정보 --%>
		<div class="theaterList">
			<h2>연극 예약 정보</h2>
			<hr>
			<c:choose>
				<c:when test="${empty theaterList}">
					<p>예약된 내역이 없습니다.</p>
				</c:when>
				<c:otherwise>
					<table>
						<thead>
							<tr>
								<th>예약 ID</th>
								<th>날짜</th>
								<th>시간</th>
								<th>좌석</th>
								<th>인원</th>
								<th>상태</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${theaterList}" var="booking">
								<tr id="theater">
									<td>${booking.id}</td>
									<td>${booking.dday}</td>
									<td>${booking.time}</td>
									<td>${booking.seat}</td>
									<td>${booking.head}</td>
									<td>${booking.bstatus}</td>
									<td>
                                		<button class="delete-btn" onclick="deleteReservation(${booking.id})">삭제</button>
                            		</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>

		<%-- 전시회 예약 정보 --%>
		<div class="exhibitionList">
			<h2>전시회 예약 정보</h2>
			<hr>
			<c:choose>
				<c:when test="${empty exhibitionList}">
					<p>예약된 내역이 없습니다.</p>
				</c:when>
				<c:otherwise>
					<table>
						<thead>
							<tr>
								<th>예약 ID</th>
								<th>날짜</th>
								<th>시간</th>
								<th>좌석</th>
								<th>인원</th>
								<th>상태</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${exhibitionList}" var="booking">
								<tr id="exhibition">
									<td>${booking.id}</td>
									<td>${booking.dday}</td>
									<td>${booking.time}</td>
									<td>${booking.seat}</td>
									<td>${booking.head}</td>
									<td>${booking.bstatus}</td>
									<td>
                                		<button class="delete-btn" onclick="deleteReservation(${booking.id})">삭제</button>
                            		</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>

	</div>



	<div class="footer">
		<%@ include file="../footer.jsp"%>
	</div>
<script type="text/javascript">
//회원 수정 페이지 이동
function editMember() {
	window.location.href = "mypage_updateF";
}

//회원 탈퇴 페이지 이동
function deleteMember() {
    var membervo = document.getElementById("id").value;
    var concertElement = document.getElementById("concert");
    var theaterElement = document.getElementById("theater");
    var exhibitionElement = document.getElementById("exhibition");
    var concertlist = concertElement ? concertElement.value : "";
    var theaterlist = theaterElement ? theaterElement.value : "";
    var exhibitionlist = exhibitionElement ? exhibitionElement.value : "";

    if (concertlist !== "" || theaterlist !== "" || exhibitionlist !== "") {
        if (confirm("회원님의 예약 내역이 존재합니다.\n환불 처리가 안되오니 신중하게 생각해")) {
            var url = "mypage_deleteF?membervo=" + membervo;
            window.open(url, "_blank_",
                "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=700");
        }
    } else {
        if (confirm("정말로 탈퇴하시겠습니까?")) {
            var url = "mypage_deleteF?membervo=" + membervo;
            window.open(url, "_blank_",
                "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=700");
        }
    }
}
	
// 리뷰 삭제	
function deleteReview(reviewId) {
	if (confirm("정말로 리뷰를 삭제하시겠습니까?")) {
	
		// AJAX 요청을 통해 리뷰 삭제 처리
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "/deleteReview", true); // 리뷰 삭제를 처리하는 서버 엔드포인트로 변경해야 합니다.
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === XMLHttpRequest.DONE) {
				if (xhr.status === 200) {
					// 리뷰 삭제가 성공한 경우
					alert("리뷰가 삭제되었습니다.");
					// 삭제된 리뷰 행을 화면에서 제거
                    var row = document.getElementById("review-row-" + reviewId);
                    row.parentNode.removeChild(row);
                } else {
                    // 리뷰 삭제가 실패한 경우
                    alert("리뷰 삭제에 실패했습니다. 다시 시도해주세요.");
                }
            }
        };
        xhr.send("reviewId=" + reviewId); // 삭제할 리뷰 ID를 서버에 전달
    }
}
</script>
</body>
</html>