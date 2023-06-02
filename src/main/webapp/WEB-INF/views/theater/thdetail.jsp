<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>연극에 대한 상세 정보</h1>
<c:forEach items="${thboardList}"  var="Thboard">
 &nbsp;&nbsp;&nbsp;예약번호 :${Thboard.thseq} <br>
 &nbsp;&nbsp;&nbsp;좌석 번호 : ${Thboard.seatlist} <br>
  &nbsp;&nbsp;&nbsp;영화 번호 : ${Thboard.thnum_seq} <br>
 </c:forEach>
</body>
</html>