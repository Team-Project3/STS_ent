<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>회원 정보</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
	<link rel="shortcut icon" href="img/favicon.png">
<link href="css/a_performance.css" rel="stylesheet" />
<link href="css/admin/member/a_member_detail.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
</head>
<body class="sb-nav-fixed">
	<%@ include file="../a_header.jsp"%>
	<div id="layoutSidenav_content">
	
		<div class="container-fluid px-4">
			<h1 class="mt-4">회원 정보</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Member Information</li>
			</ol>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 
						<a href="a_member_main" id="detail">회원 정보</a><br>
				</div>
				<div class="card-body">
					<table>
						<tr>
							<th>항목</th>
							<th>내용</th>
						</tr>
						<tr>
							<td>아이디</td>
							<td>${membervo.id}</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>${membervo.password}</td>
						</tr>
						<tr>
							<td>이름</td>
							<td>${membervo.name}</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>${membervo.phone}</td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><fmt:formatDate value="${membervo.birth}"
									pattern="yyyy-MM-dd" var="birth" />${birth}</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>${membervo.email}</td>
						</tr>
					</table>
				</div>
			</div>
			<div align="right">
				<button class="btn btn-primary" onclick="location.href='a_member_updateF?id=${membervo.id}'">수정</button>
				&emsp;&emsp;
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