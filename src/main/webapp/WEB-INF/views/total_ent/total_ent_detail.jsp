<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>total_ent_detail</title>
<link rel="stylesheet" type="text/css" href="css/total_ent/total_ent_detail.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
<script src="js/total_ent/total_ent_detail.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
#datePicker {
	width: 300px;
	height: 100px;
}

#datePicker td{
	width: 20px;
}

#datePicker tbody {
	height: 200px;
}

#datePicker td a{
	text-align: center;
}

.ui-datepicker-calendar>tbody td:first-child a, .ui-datepicker-calendar>thead th:first-child
	{
	color: #f00;
}

.ui-datepicker-calendar>tbody td:last-child a, .ui-datepicker-calendar>thead th:last-child
	{
	color: blue;
}

.ui-datepicker-calendar>tbody{
	width: 799px;
	height: 500px;
}

.ui-widget-content .ui-state-default {
	border: 0px solid #c5c5c5;
	font-weight: lighter;
	text-align: center;
	border-radius: 20px;
}
.ui-datepicker-calendar{
height: 100px;
}

   /* Customize the datepicker appearance */
  .ui-datepicker {
    font-family: Arial, sans-serif;
    font-size: 14px;
    background-color: #333333;
    color: #ffffff;
    border: none;
    border-radius: 5px;
    width: 300px;
    height: 300px;
    margin-top: -380px;
    margin-left: 250px;
  }

  .ui-datepicker-header {
    background-color: #222222;
    color: #ffffff;
    border-radius: 5px 5px 5px 5px;
    padding: 10px;
    height: 30px;
  }

  .ui-datepicker-title {
    text-align: center;
    font-weight: bold;
  }

  .ui-datepicker-prev,
  .ui-datepicker-next {
    background-color: #222222;
    color: #ffffff;
  }

  .ui-datepicker-prev:hover,
  .ui-datepicker-next:hover {
    background-color: #444444;
  }

  .ui-datepicker-calendar td {
    text-align: center;
    padding: 5px;
  }

  .ui-datepicker-calendar .ui-state-default {
    background-color: #444444;
    border-radius: 50%;
    color: #ffffff;
  }

  .ui-datepicker-calendar .ui-state-default:hover {
    background-color: #666666;
  }

  .ui-datepicker-calendar .ui-state-active {
    background-color: #96C7ED;
  }
  .bookingbutton{
  margin-left: 900px;
  }
  .ui-datepicker table{
  	height: 263px;
  }
  .date{
  	margin-top: -300px;
  	margin-left: 600px;
  	margin-right: 200px;
  	margin-bottom: -214px;
  	height: 323px;
  }
</style>
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
						<td colspan="2" style="border-bottom: 1px solid white;">
						<h3>공연 정보</h3></td>
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
						<td colspan="2" style="border-bottom: 1px solid white;">
						<h3>공연 시간 안내</h3></td>
					</tr>
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
				</table>
			</div>
		</div>
		<div class="date">
		<div id="datePicker"></div>
		<div class = "bookingbutton">
				총 좌석 : ${seat}    <button onclick="booking()">예약</button>
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
<script type="text/javascript">
$(function() {
	var sdate = document.getElementById("sdate").value;
	var edate = document.getElementById("edate").value;
	var today = new Date();
	
	if (new Date(sdate) < today) {
		sdate = today;
	    }
	
	$("#datePicker").datepicker({
	      dateFormat: 'yy-mm-dd'
	      ,minDate: sdate
	      ,maxDate: edate
	      ,showOn: "focus"
	      ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	    });
});
</script>
</html>