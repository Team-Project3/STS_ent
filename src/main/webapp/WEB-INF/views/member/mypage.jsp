<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/mypage.css" />
</head>

<body>
	<div class="mypage">
		<input type="hidden" value="${membervo.id}" id="id">
		<div>

			<div class="memberinfo">
				<div class="member">
					<div>
						<div id="vcard">
							<div id="card-content">
								<div id="profile">
									<span class="avatar"><span class="typicons-user icon"></span>
										<span class="info">${membervo.name }<br />
									</span>
									</span>
								</div>
								<div id="options">
									<ul>
										<li><br>ID<br><br>${membervo.id }</li>
										<li><br>BIRTH<br><br><fmt:formatDate value="${membervo.birth}" pattern="yyyy-MM-dd"/></li>
										<li><br>PHONE<br><br>${membervo.phone }</li>
										<li><br>E-MAIL<br><br>${membervo.email }</li>
									</ul>
									
								</div>
							</div>
							<div id="side-bar">
								<ul>
									<li><a type="button" onclick="editMember()">수정</a></li>
									<li><a type="button" onclick="deleteMember()">탈퇴</a></li>
								</ul>
							</div>
						</div>






						<%-- <table id="membertable">
							<tr>
								<td>이름</td>
								<td id="name">${membervo.name }</td>
							</tr>
							<tr>
								<td>생일</td>
								<fmt:formatDate value="${membervo.birth}" pattern="yyyy-MM-dd" var="birth" />
								<td id="birth">${birth}</td>
							</tr>
							<tr>
								<td>아이디</td>
								<td id="id">${membervo.id }</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td id="phone">${membervo.phone }</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td id="email">${membervo.email }</td>
							</tr>
						</table> --%>
						
						
						<%-- <table>
								<tr>
									<td>이름</td>
									<td id="name">${membervo.name }</td>
									<td>생일</td><fmt:formatDate value="${membervo.birth}" pattern="yyyy-MM-dd" var="birth" />
									<td id="birth">${birth}</td>
								</tr>
								<tr>
									<td>아이디</td>
									<td id="id">${membervo.id }</td>
									<td>전화번호</td>
									<td id="phone">${membervo.phone }</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td id="email">${membervo.email }</td>
								</tr>
							</table> 

						<div class="memberbtn">
							<button class="listbtn_wr" type="button" onclick="editMember()">수정</button>	&nbsp;&nbsp; 
							<input type="button" class="listbtn_wr" onclick="deleteMember()" value="탈퇴">
						</div>--%>
					</div>
				</div>

			</div>

		</div>


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
							<tr style="background-color: #c8c8c8; color: black;">
								<th>회원 ID</th>
								<th>공연 제목</th>
								<th>리뷰 평점</th>
								<th>리뷰 내용</th>
								<th>작성 일자</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${reviewmemberlist}" var="review">
								<tr>
									<td>${review.id}</td>
									<td>${review.tname}</td>
									<td><c:choose>
											<c:when test="${review.rpoint == 1}">
												💗🖤🖤🖤🖤
											</c:when>
											<c:when test="${review.rpoint == 2}">
                            					💗💗🖤🖤🖤
                        					</c:when>
											<c:when test="${review.rpoint == 3}">
                            					💗💗💗🖤🖤
                        					</c:when>
											<c:when test="${review.rpoint == 4}">
                            					💗💗💗💗🖤
                        					</c:when>
											<c:when test="${review.rpoint == 5}">
												💗💗💗💗💗
					                        </c:when>
											<c:otherwise>
												작성한 평점이 없습니다.
					                        </c:otherwise>
										</c:choose></td>
									<td>${review.rcontent}</td>
									<td><fmt:formatDate value="${review.regdate}"
											pattern="yyyy-MM-dd" var="regdate" />${regdate}</td>
									<td>
										<button class="delete-btn"
											onclick="deleteReview(${review.rseq})">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>


		<div class="concertList">
			<h2>콘서트 예약 정보</h2>
			<hr>
			<c:choose>

				<c:when test="${empty concertList}">
					<p>예약된 내역이 없습니다.</p>
				</c:when>

				<c:otherwise>
					<table>
						<thead>
							<tr style="background-color: #c8c8c8; color: black;">
								<th>예약 ID</th>
								<th>공연명</th>
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
									<td>${booking.tname}</td>
									<td><fmt:formatDate value="${booking.dday}"
											pattern="yyyy-MM-dd" var="dday" />${dday}</td>
									<td>${booking.time}</td>
									<td>${booking.seat}</td>
									<td>${booking.head}</td>
									<td>${booking.bstatus}</td>
									<td>
										<button class="delete-btn"
											onclick="deleteReservation(${booking.bseq})">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>

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
							<tr style="background-color: #c8c8c8; color: black;">
								<th>예약 ID</th>
								<th>연극명</th>
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
									<td>${booking.tname}</td>
									<td><fmt:formatDate value="${booking.dday}"
											pattern="yyyy-MM-dd" var="dday" />${dday}</td>
									<td>${booking.time}</td>
									<td>${booking.seat}</td>
									<td>${booking.head}</td>
									<td>${booking.bstatus}</td>
									<td>
										<button class="delete-btn"
											onclick="deleteReservation(${booking.bseq})">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>

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
							<tr style="background-color: #c8c8c8; color: black;">
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
									<td><fmt:formatDate value="${booking.dday}"
											pattern="yyyy-MM-dd" var="dday" />${dday}</td>
									<td>${booking.time}</td>
									<td>${booking.seat}</td>
									<td>${booking.head}</td>
									<td>${booking.bstatus}</td>
									<td>
										<button class="delete-btn"
											onclick="deleteReservation(${booking.bseq})">삭제</button>
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

//리뷰 삭제
function deleteReview(rseq) {
	if(confirm("리뷰를 삭제하시겠습니까?")) {
		location.href="reviewDelete?rseq="+rseq;
	}
}

//예약 삭제
function deleteReservation(bseq) {
	if(confirm("환불 서비스를 지원하지 않습니다.\n해당 예매 내역을 삭제하시겠습니까?")) {
		location.href="reservationDelete?bseq="+bseq;
	}
}

</script>
</body>
</html>