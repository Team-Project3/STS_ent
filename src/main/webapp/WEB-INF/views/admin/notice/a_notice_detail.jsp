<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>공지사항 정보</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/admin/notice/a_notice_detail.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
</head>
<body class="sb-nav-fixed">
	<%@ include file="../a_header.jsp"%>
	<div id="layoutSidenav_content">
		<div class="container-fluid px-4">
			<h1 class="mt-4">공지사항 정보</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Notice Information</li>
			</ol>
			<form id="update" name="formm" method="post">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> <a href="a_notice_main"
							id="detail"><b>공지사항</b></a>&nbsp;/&nbsp;No.${noticevo.nseq}<br>

					</div>
					<input type="hidden" value="${noticevo.nseq}" id="nseq"> <input
						type="hidden" value="${noticevo.a_id}" id="a_id"> <input
						type="hidden" value="${noticevo.ndate}" id="ndate">
					<div class="card-body">
						<h2 id="title">${noticevo.title}</h2>
						<span id="a_id">${noticevo.a_id}</span>&emsp;|&emsp; 
						<span id="ndate"><fmt:formatDate value="${noticevo.ndate}"
								pattern="yyyy-MM-dd" var="ndate" />${ndate}</span><br><br> 
						<div id="datatablesSimple">
							<span id="ncontent">${noticevo.ncontent}</span>
						</div>
					</div>
				</div>
				<div align="right">
					<button type="button" class="btn btn-primary"
						onclick="location.href='a_notice_updateF?nseq=${noticevo.nseq}'">공지 수정</button>
				</div>
			</form>
		</div>
	</div>
	<script src="js/scripts.js"></script>
</body>
</html>