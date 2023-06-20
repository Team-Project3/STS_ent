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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
</head>
<script type="text/javascript">
//공지사항 수정
function editform() {
	var theform = document.getElementById("updateform");
	alert("공지사항이 수정되었습니다.");
	theform.action = "a_notice_update";
	theform.submit();
}

//공지사항 삭제 페이지 이동
function deleteform() {
	if (confirm("공지사항을 삭제하시겠습니까?")) {
		var form = document.getElementById("updateform");
		alert("삭제되었습니다.");
        form.action = "a_notice_delete";
        form.submit(); 
    }
}

</script>
<body class="sb-nav-fixed">
	<%@ include file="a_notice_header.jsp"%>
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
					<input type="hidden" name="ndate"
						value="<fmt:formatDate value='${noticevo.ndate}'
							pattern='yyyy-MM-dd'/>">


					<div class="card-body">
						<br>
						<table>
							<tr>
								<td>제목</td>
								<td><input type="text" id="title" name="title"
									value="${noticevo.title}"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><input type="text" id="ncontent" name="ncontent"
									value="${noticevo.ncontent}"></td>
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