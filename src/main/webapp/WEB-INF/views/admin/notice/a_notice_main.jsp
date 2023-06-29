<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>공지사항 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
	<link rel="shortcut icon" href="img/favicon.png">
<link href="css/a_performance.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<%@ include file="../a_header.jsp" %>
	<div id="layoutSidenav_content">
		<div class="container-fluid px-4">
			<h1 class="mt-4">공지사항 목록</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Notice List</li>
			</ol>
			
			<div align="right">
				<a class="btn btn-primary" href="a_notice_insertF" id="noticeInsert" style="margin-bottom:10px;">공지글 등록</a>
			</div>
			
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 공지사항 목록
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>내용</th>
								<th>날짜</th>
								<th>글쓴이</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="notice" items="${noticeList}" varStatus="loop">
								<tr>
									<td><a href="a_notice_detail?nseq=${notice.nseq}"
										id="detail">${notice.nseq}</a></td>
									<td><a href="a_notice_detail?nseq=${notice.nseq}"
										id="detail">${notice.title}</a></td>
									<td><a href="a_notice_detail?nseq=${notice.nseq}"
										id="detail">${notice.ncontent}</a></td>
									<td><fmt:formatDate value="${notice.ndate}"
											pattern="yyyy-MM-dd" var="ndate" /> ${ndate}</td>
									<td>${notice.a_id}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>