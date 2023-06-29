<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/booking/bookingsuccess.css" />
<script src="js/booking/bookingsuccess.js"></script>
<fmt:formatDate value="${bookingVO.today}" pattern="yyyy-MM-dd" var="today" />
<fmt:formatDate value="${bookingVO.dday}" pattern="yyyy-MM-dd" var="dday" />
</head>
<body oncontextmenu="return false">
<div class="container">
  <div class="image">
    <img alt="" src="${img}">
  </div>
  <div class="details">
<h1>${id} 님</h1>
<h1> 예약이 완료되었습니다.</h1>

<table>
<tr>
<td>
예약 번호
</td>
<td>
${bookingVO.bseq}
</td>
</tr>
<tr>
<td>
예약 일자
</td>
<td>
${today}
</td>
</tr>
<tr>
<td>
공연 명
</td>
<td>
${total_entVO.tname}
</td>
</tr>
<tr>
<td>
좌석 정보
</td>
<td>
${bookingVO.seat}
</td>
</tr>
<tr>
<td>
인원 정보
</td>
<td>
${bookingVO.head} 명
</td>
</tr>
<tr>
<td>
공연 일자
</td>
<td>
${dday}
</td>
</tr>
</table>
    <div class="button-container">
      <button type="button" onclick="goindex()">메인 페이지로 가기</button>
      <button type="button" onclick="gomypage()">마이 페이지로 가기</button>
    </div>
  </div>
</div>
</body>
</html>