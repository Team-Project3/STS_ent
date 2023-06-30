<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>공지사항</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="css/notice/notice_main.css" rel="stylesheet" />
</head>
<body>
	
	<div class="notice_main">

	<div class="container-fluid px-4">
		<h1 class="mt-4">공지사항</h1>

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> Notice
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
							<th>글쓴이</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="notice" items="${noticeList}" varStatus="loop">
						<tr>
							<td><a href="notice_detail?nseq=${notice.nseq}" id="detail">${notice.nseq}</a></td>
                            <td><a href="notice_detail?nseq=${notice.nseq}" id="detail">${notice.title}</a></td>
                            <td>
	                            <fmt:formatDate value="${notice.ndate}" pattern="yyyy-MM-dd" var="ndate" />
								${ndate}
                            </td>
                            <td>${notice.a_id}</td>
						</tr>
						</c:forEach>   
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>

	<div class="footer">
		<%@ include file="../footer.jsp"%>
	</div>
</body>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
	<script src="js/datatables-simple-demo.js"></script>
</html>