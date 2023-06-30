<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<title>total_ent_detail</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
<script src="js/total_ent/total_ent_detail.js"></script>
<link rel="stylesheet" type="text/css" href="css/total_ent/total_ent_detail.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div class="thdetail">
		<div class="thdetail_header">
			<h1 onclick="location.href='total_ent_main?category=${total_ent.category}'">&ensp;공연&emsp;<${total_ent.tname}></h1><br>
			<h3>&emsp;${formattedSDate} ~ ${formattedEDate}&emsp;|&emsp;${total_ent.place}</h3><br>
			<hr>
		</div>
		<div class="thdetail_info">
			<div>
				<c:if test="${total_ent.category ==1}"><img id="pimg" src="img/concert/${total_ent.pimg}.jpg"></c:if>
				<c:if test="${total_ent.category ==2}"><img id="pimg" src="img/theater/${total_ent.pimg}.jpg"></c:if>
				<c:if test="${total_ent.category ==3}"><img id="pimg" src="img/museum/${total_ent.pimg}.jpg"></c:if>
			</div>
			<div id="info">
				<table>
					<tr>
						<td colspan="2" style="border-bottom: 1px solid white; padding: 0;">
						<h3><i>공연 정보</i></h3></td>
					</tr>
					<tr>
						<td>공연명</td>
						<td>${total_ent.tname}</td>
					</tr>
					<tr>
						<td>장소</td>
						<td>${total_ent.place}</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>${total_ent.price}</td>
					</tr>
					<tr>
						<td style="border-bottom: 1px solid white; padding: 40px 0 0 0; height:92px;">
						<h3><i>날짜/시간 선택</i></h3></td>
						<td style="border-bottom: 1px solid white; padding: 40px 0 0 0 ;">
						<h3 style="margin-left:120px;"><i>공연 시간 안내</i></h3></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="date">
			<div id="datePicker"></div>
			<div class = "bookingbutton">
				<table id="datetable">
					<tr>
						<td>시작날짜</td>
						<td>${formattedSDate}</td>
					</tr>
					<tr>
						<td>종료날짜</td>
						<td>${formattedEDate}</td>
					</tr>
					<tr>
						<td>공연시간</td>
						<td>${total_ent.time}</td>
					</tr>
					<tr>
						<td>
							총 좌석
						</td>
						<td>
							${seat}
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="outline" onclick="booking()">예약</button>
						</td>
					</tr>
				</table>
					
					
			</div>
		</div>
		<input type="hidden" value="${membervo.id}" id="id">
		<input type="hidden" value="${total_ent.tseq}" id="tseq">
		<input type="hidden" id="sdate" value="${formattedSDate}">
		<input type="hidden" id="edate" value="${formattedEDate}">
		<ul id="tabs">
			<li><a href="#cimg">공연정보</a></li>
			<li><a href="#review" onClick="reviewList()">후기</a></li>
		</ul>
	
	<div class="tab-section" id="cimg">
		<c:if test="${total_ent.category ==1}"><img id="cimg" src="img/concert/${total_ent.cimg}.jpg"></c:if>
		<c:if test="${total_ent.category ==2}"><img id="cimg" src="img/theater/${total_ent.cimg}.jpg"></c:if>
		<c:if test="${total_ent.category ==3}"><img id="cimg" src="img/museum/${total_ent.cimg}.jpg"></c:if>
	</div>
		
	<div class="tab-section" id="review">
		<%@ include file="../member/review.jsp" %>
	</div>
	</div>
	<div class="footer">
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>