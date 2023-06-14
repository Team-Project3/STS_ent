<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지 메인</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/modernizr.custom.js"></script>
</head>
<body>
	<div class="container demo-1">
		<header>
			<h1>Admin Page</h1>
		</header>
		<ul class="grid cs-style-1">
			<li>
				<figure>
					<img src="img/admin/공연.png" alt="img01">
					<figcaption>
						<h3>PERFORMANCE</h3>
						<span>공연 목록</span> <a href="a_performance_main">바로 이동</a>
					</figcaption>
				</figure>
			</li>
			<li>
				<figure>
					<img src="img/admin/회원.png" alt="img02">
					<figcaption>
						<h3>MEMBER</h3>
						<span>회원 목록</span> <a href="a_member_main">바로 이동</a>
					</figcaption>
				</figure>
			</li>
			<li>
				<figure>
					<img src="img/admin/공지.png" alt="img04">
					<figcaption>
						<h3>NOTICE</h3>
						<span>공지사항 목록</span> <a href="a_notice_main">바로 이동</a>
					</figcaption>
				</figure>
			</li>
			<li>
				<figure>
					<img src="img/admin/후기.png" alt="img05">
					<figcaption>
						<h3>REVIEW</h3>
						<span>후기 목록</span> <a href="a_review_main">바로 이동</a>
					</figcaption>
				</figure>
			</li>
		</ul>
	</div>
	<!-- /container -->
	<script src="js/toucheffects.js"></script>
	<%
	//양식 다시제출 확인 페이지 없애기위한 코드
	
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		if (request.getProtocol().equals("HTTP/1.1"))
			response.setHeader("Cache-Control", "no-cache");
	%>
</body>
</html>