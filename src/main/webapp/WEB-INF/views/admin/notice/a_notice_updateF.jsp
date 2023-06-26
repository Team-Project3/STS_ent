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
<link href="css/a_performance.css" rel="stylesheet" />
<link href="css/admin/notice/a_notice_updateF.css" rel="stylesheet" />
<script src="js/admin/notice/a_notice_updateF.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
</head>
<body class="sb-nav-fixed">
	<%@ include file="../a_header.jsp"%>
	<div id="layoutSidenav_content">
		<form id="updateform" method="post">
			<div class="container-fluid px-4">
				<h1 class="mt-4">공지사항 수정</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">Notice Information</li>
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> <a href="a_notice_main"
							id="detail"><b>공지사항</b></a>&nbsp;/&nbsp;No.${noticevo.nseq}<br>
					</div>
					<input type="hidden" name="nseq" id="nseq" value="${noticevo.nseq}">
					<input type="hidden" name="a_id" id="a_id" value="${noticevo.a_id}">
					<input type="hidden" name="ndate" value="<fmt:formatDate value='${noticevo.ndate}' pattern='yyyy-MM-dd'/>">
					<div class="card-body">
						<table>
							<tr>
								<th>제목</th>
								<td colspan="3"><input type="text" id="title" name="title"
									value="${noticevo.title}"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><input type="text" id="a_id" name="a_id" readonly="readonly"
									value="${noticevo.a_id}"></td>
								<th>작성일</th>
								<td><input type="text" id="ndate" name="ndate" readonly="readonly"
											value="<fmt:formatDate value='${noticevo.ndate}' pattern='yyyy-MM-dd'/>">
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3"><textarea id="ncontent" name="ncontent" style="height:450px;">${noticevo.ncontent}</textarea></td>
							</tr>
						</table>
					</div>
				</div>
				<div align="right">
					<input class="btn btn-primary" type="button" onClick="editform()"
						id="editButton" value="수정">
					<input class="btn btn-primary" type="button" onClick="deleteform()"
						id="editButton" value="삭제">
				</div>
			</div>
		</form>
	</div>
	<script src="js/scripts.js"></script>
</body>
</html>