<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function board() {
	var url = "board";
	window.open(url, "_blank_",
			"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=500")
	
}
</script>
</head>
<body>

<h1>연극 예약하기</h1>
 <c:forEach items="${theaterList}"  var="Theater">
 <a href="thdetail?seq=${Theater.thnum_seq}">${Theater.thnum_seq}</a>
 영화 제목 : ${Theater.thname}
 </c:forEach>
   
<button onclick="board()">예약</button>
</body>
</html>