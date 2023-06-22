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
<style>
/* 테이블 컨테이너 스타일 */
.table-container {
  width: 1400px;
  overflow-x: auto;
  border-radius: 4px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

/* 테이블 스타일 */
table {
  width: 1400px;
  border-collapse: collapse;
  background-color: #fff;
}

/* 테이블 헤더 스타일 */
thead th {
  padding: 16px;
  font-weight: bold;
  color: #fff;
  background-color: #333;
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
}

/* 테이블 셀 스타일 */
td {
  padding: 16px;
  border-bottom: 1px solid #ddd;
}

/* 짝수 행 배경색 */
tbody tr:nth-child(even) {
  background-color: #f9f9f9;
}

/* 호버 효과 */
tbody tr:hover {
  background-color: #f2f2f2;
}

/* 액티브 효과 */
tbody tr:active {
  background-color: #e6e6e6;
}

/* 입력 필드 스타일 */
input[type="text"], textarea {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  background-color: #fff;
  transition: border-color 0.3s ease-in-out;
}

/* 입력 필드 호버 및 포커스 효과 */
input[type="text"]:hover,
input[type="text"]:focus {
  border-color: #999;
}

table th:first-child {
	width: 100px;
}

#a_id, #ndate {
	width: 500px;
}

</style>
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