<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>공연 정보 상세</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/a_performance.css" rel="stylesheet" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</head>
<script type="text/javascript">
	function a_insertperformance() {
		document.getElementById("formm").submit();
	}
</script>
<body class="sb-nav-fixed">
	<%@ include file="../a_header.jsp"%>
	<div id="layoutSidenav_content">
		<div class="container-fluid px-4">
			<h1 class="mt-4">공연 등록</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Performance Information</li>
			</ol>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 공연 등록<br>
				</div>
				<div class="card-body">

					<div class="detailtable">
					<form action="a_performance_ent_insert" method="post" id="formm" name="formm" enctype="multipart/form-data">
						<table class="detailtable1">
							<tr>
								<td>공연 종류</td>
								<td><select id="category" name="category">
										<option value="1">콘서트</option>
										<option value="2">연극</option>
										<option value="3">전시회</option>
								</select></td>
							</tr>
							<tr>
								<td>공연 이름</td>
								<td><input type="text" id="tname" name="tname"></td>
							</tr>
							<tr>
								<td>공연 장소</td>
								<td><input type="text" id="place" name="place"></td>
							</tr>
							<tr>
								<td>공연 시간</td>
								<td><input type="text" name="time" id="time" class="timepicker" readonly="readonly" value=""></td>
							</tr>
							<tr>
								<td>공연 시작 날짜</td>
								<td><input type="date" id="sdate" name="sdate"></td>
							</tr>
							<tr>
								<td>공연 종료 날짜</td>
								<td><input type="date" id="edate" name="edate"></td>
							</tr>
							<tr>
								<td>공연 가격</td>
								<td><input type="text" id="price" name="price"></td>
							</tr>
							<tr>
								<td>공연 포스터 이미지</td>
								<td><input type="file" id="pimg" name="pimg" accept=".gif, .jpg, .png"></td>
							</tr>
							<tr>
								<td>공연 내용 이미지</td>
								<td><input type="file" id="cimg" name="cimg" accept=".gif, .jpg, .png"></td>
							</tr>
						</table>
						</form>
					</div>
					<div>
						<button type="button" onclick="a_insertperformance()">등록</button>
						&emsp;&emsp;
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#time').timepicker({
				timeFormat : 'HH:mm',
				interval : 30,
				startTime : '00:00',
				dynamic : false,
				dropdown : true,
				scrollbar : true
			});
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>