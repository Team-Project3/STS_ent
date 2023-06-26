<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>공지사항 작성</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/admin/notice/a_notice_insertF.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
<script src="js/admin/notice/a_notice_insertF.js"></script>
</head>
<body class="sb-nav-fixed">
	<%@ include file="../a_header.jsp" %>
	<div id="layoutSidenav_content">
		<div class="container-fluid px-4">
			<h1 class="mt-4">공지사항 작성</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Notice Information</li>
			</ol>
			<form id="insertform" method="post" onsubmit="return false;">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 
						<a href="a_notice_main" id="detail"><b>공지사항 </b></a><br>
				</div>
				<div class="card-body">
					<input type="hidden" id="a_id" name="a_id" value="${a_id}">
					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" id="title" name="title" placeholder="공지글 제목"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
							<textarea id="ncontent" name="ncontent" placeholder="공지글 내용"></textarea></td>
						</tr>
					</table>
				</div>
			</div>
			</form>
			<div align="right">
				<input class="btn btn-primary" type="button" onClick="insertform()" value="등록">
			</div>
		</div>
	</div>



</body>
</html>