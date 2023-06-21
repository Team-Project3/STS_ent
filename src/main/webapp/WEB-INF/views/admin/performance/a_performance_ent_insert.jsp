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
<link rel="stylesheet" href="css/a_performance.css">
<link rel="stylesheet" href="css/a_performance_ent_insert.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" />
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</head>

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
					<form action="a_performance_ent_insert" method="post" id="formm"
						name="formm" enctype="multipart/form-data">
						<table class="detailtable1">
							<tr>
								<td>공연 종류</td>
								<td colspan="4">
									<select id="category" name="category" onchange="changeselect()">
											<option value="0">공연을 선택해 주세요</option>
											<option value="1">콘서트</option>
											<option value="2">연극</option>
											<option value="3">전시회</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>공연 이름</td>
								<td colspan="4">
									<input type="text" id="tname" name="tname">
								</td>
							</tr>
							<tr>
								<td>공연 장소</td>
								<td colspan="4">
									<input type="text" id="place" name="place">
								</td>
							</tr>
							<tr>
								<td>공연 시간</td>
								<td colspan="4">
									<input type="text" name="time" id="time"
									class="timepicker" readonly="readonly" value="">
								</td>
							</tr>
							<tr>
								<td>공연 날짜</td>
								<td id="picker" colspan="2"><div id="sdatePicker"></div></td>
								<td id="picker" colspan="2"><div id="edatePicker"></div></td>
							</tr>
							<tr>
								<td>공연 금액</td>
								<td colspan="4">
									<input type="number" id="price" name="price" step="1000" min="0">
								</td>
							</tr>
							<tr>
								<td>좌석 배치</td>
								<td colspan="4">
									<div id="concertseat" style="display: none;">
										R 석 <input type="number" id="rseat" max="30" min="1"><br>
										<br> A 석 <input type="number" id="aseat" max="30" min="1"><br>
										<br> B 석 <input type="number" id="bseat" max="30" min="1">
									</div>
									<div id="theaterseat" style="display: none;">
										가로 <input type="number" id="width" max="9" min="1"><br>
										<br> 세로 <input type="number" id="length" max="9" min="1">
									</div>
									<div id="museumseat" style="display: none;">
										오전 최대 인원 <input type="number" id="am" max="30" min="1"><br>
										<br> 오후 최대 인원 <input type="number" id="pm" max="30"
											min="1">
									</div>
								</td>
							</tr>
							<tr>
								<td>공연 포스터 이미지</td>
								<td id="select"><input type="file" id="pimg" name="pimgfile"
									accept=".jpg" onchange="return setpimg(event)"></td>
								<td colspan="3"><div id="pimgcontainer"></div></td>
							</tr>
							<tr>
								<td>공연 정보 이미지</td>
								<td id="select"><input type="file" id="cimg" name="cimgfile"
									accept=".jpg" onchange="setcimg(event)"></td>
								<td colspan="3"><div id="cimgcontainer"></div></td>
							</tr>
							<tr>
								<td colspan="4" class="center-align">
									<button type="button" class="register-button"
										onclick="return a_insertperformance()">Register</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="js/a_performance_ent_insert.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>