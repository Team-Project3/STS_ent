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
	<div class="notice_detail">
		<div class="container-fluid px-4">
			
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i>
					<a href="notice" id="detail"><b>공지사항</b></a>&nbsp;/&nbsp;No.${notice.nseq}<br>
					<h1 id="title">&nbsp;${notice.title}</h1>
					<span id="a_id">&emsp;${notice.a_id}</span>&emsp;|&emsp;
					<span id="ndate"><fmt:formatDate value="${notice.ndate}" pattern="yyyy-MM-dd" var="ndate" />${ndate}</span><br>
					<br>
				</div>
				<div class="card-body">
					<div id="datatablesSimple">
						<div id="ncontent">&emsp;${notice.ncontent}</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>