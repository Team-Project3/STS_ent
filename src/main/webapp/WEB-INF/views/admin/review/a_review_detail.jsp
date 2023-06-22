<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>리뷰 상세 정보</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/a_performance.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
</head>
<style>
table {
  margin-top: 25px;
  width: 100%;
  border-collapse: collapse;
}

td {
  padding: 10px;
  text-align: left;
  border: 1px solid #ccc;
}

tr:first-child {
  background-color: #f1f1f1;
  font-weight: bold;
}

tr:nth-child(even) {
  background-color: #f9f9f9;
}

td:nth-child(1) {
  width: 13%;
}

td:nth-child(2),
td:nth-child(3),
td:nth-child(4) {
  width: 10%;
}

td:nth-child(5) {
  width: 30%;
}

.rating {
  display: inline-block;
  font-size: 20px;
}

.rating span {
  color: #ff69b4;
}

.rating span:before {
  content: "💗";
}

.rating span.inactive:before {
  content: "🖤";
}
</style>
<script type="text/javascript">
function reviewdelete(rseq) {
	if (confirm("해당 후기글을 삭제하시겠습니까?")) {
		alert("삭제되었습니다.");
        location.href = "a_review_delete?rseq=" + rseq;
    }
}
</script>
<body class="sb-nav-fixed">
	<%@ include file="../a_header.jsp"%>
	<div id="layoutSidenav_content">
		<div class="container-fluid px-4">
			<h1 class="mt-4">리뷰 상세 정보</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Review Information</li>
			</ol>
			<form id="delete" name="formm" method="post">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> <a href="a_review_main"
							id="detail"><b>후기글</b></a>&nbsp;/&nbsp;No.${reviewvo.rseq}<br>
					</div>

					<div class="card-body" style="height:200px;">
					
						<table>
							<tr>
								<td>공연명</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>평점</td>
								<td>작성내용</td>
							</tr>
							<tr>
								<td>${reviewvo.tname}</td>
								<td>${reviewvo.id}</td>
								<td><fmt:formatDate value="${reviewvo.regdate}"
									pattern="yyyy-MM-dd" var="regdate" />${regdate}</td>
								<td>
									<c:choose>
										<c:when test="${reviewvo.rpoint == 1}">
											💗🖤🖤🖤🖤
										</c:when>
										<c:when test="${reviewvo.rpoint == 2}">
			                           		💗💗🖤🖤🖤
			                        	</c:when>
										<c:when test="${reviewvo.rpoint == 3}">
			                           		💗💗💗🖤🖤
			                        	</c:when>
										<c:when test="${reviewvo.rpoint == 4}">
			                           		💗💗💗💗🖤
			                        	</c:when>
										<c:when test="${reviewvo.rpoint == 5}">
											💗💗💗💗💗
								           </c:when>
										<c:otherwise>
											작성한 평점이 없습니다.
								        </c:otherwise>
									</c:choose> 
								</td>
								<td>${reviewvo.rcontent}</td>
							</tr>
						</table>
				
					</div>

				</div>
				<div align="right">
					<button type="button" class="btn btn-primary"
						onclick="reviewdelete(${reviewvo.rseq})">리뷰 삭제</button>
				</div>
			</form>
		</div>
	</div>

	<script src="js/scripts.js"></script>

</body>
</html>