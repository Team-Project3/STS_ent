<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>STS Entertainment</title>
		<meta name="description" content="Background scale animation as seen on DDD Hotel." />
		<meta name="keywords" content="clip-path, animation, scale, effect, background, hover" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="img/favicon.png">
		<link rel="stylesheet" href="https://use.typekit.net/cze1cgq.css">
		<link rel="stylesheet" type="text/css" href="css/base.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/gsap@3.11/dist/gsap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.7.1/gsap.min.js"></script>
		<script src="https://unpkg.com/imagesloaded@5/imagesloaded.pkgd.min.js"></script>
		<script>document.documentElement.className="js";var supportsCssVars=function(){var e,t=document.createElement("style");return t.innerHTML="root: { --tmp-var: bold; }",document.head.appendChild(t),e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)")),t.parentNode.removeChild(t),e};supportsCssVars()||alert("Please view this demo in a modern browser that supports CSS Variables.");</script>
		<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
		<script src="js/index.js" type="module"></script>
</head>
<body class="demo-1 loading">
	<main>
	<nav role="navigation">
		<div id="menuToggle">
			<input type="checkbox" /> <span></span> <span></span> <span></span>
			<ul id="menu">
			
			<c:choose>
				<c:when test="${empty sessionScope.loginUser}">
					<div class="frame__menu" style="text-align: center;">
						<a href="login_form">Login</a>&emsp;&emsp;&emsp; 
						<a href="signup_form">Sign Up</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="frame__menu" style="text-align: center;">
						<a class="username" href="mypage">${sessionScope.loginUser.name}(${sessionScope.loginUser.id})</a>&emsp;&emsp;
						<a href="logout">LOGOUT</a>
					</div>
				</c:otherwise>
			</c:choose>
			<hr>
			<li><a href="index">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="notice">Notice</a></li>
			<li><a href="concert_main">Concert</a></li>
			<li><a href="theater">Theater</a></li>
			<li><a href="museum_main">Museum</a></li>
			
			<hr style="margin-top:300px;">
			<div class="admin">
				<a href="adminlogin_form">@ Admin</a>
			</div>
			</ul>
		</div>
	</nav>

	<!-- <nav class="mainlogo"><div class><img src="img/MAIN_LOGO.png"></div></nav> -->
	<div class="screens" aria-hidden="true">

		<div class="screen__item" style="--bg-img: url(../img/main_concert.jpg);">
			<div class="screen screen--full"></div>
			<div class="screen screen--clip screen--clip-1"></div>
		</div>
		<div class="screen__item" style="--bg-img: url(../img/main_theater.jpg);">
			<div class="screen screen--full"></div>
			<div class="screen screen--clip screen--clip-1"></div>
		</div>
		<div class="screen__item" style="--bg-img: url(../img/main_museum.jpg);">
			<div class="screen screen--full"></div>
			<div class="screen screen--clip screen--clip-1"></div>
		</div>
		<div class="screen__item" style="--bg-img: url(../img/main_notice.jpg);">
			<div class="screen screen--full"></div>
			<div class="screen screen--clip screen--clip-1"></div>
		</div>
	</div>
	<div class="content">

		<nav class="mainlogo">
			<img alt="" src="img/MAIN_LOGO_sts.png" onclick="location='index'">
		</nav>

		<nav class="menu">
			<span class="menu__item"> 
				<span class="menu__item-tag">콘서트</span>
				<a class="menu__item-link" href="total_ent_main?category=1">Concert</a>
			</span>
			<span class="menu__item"> 
				<span class="menu__item-tag">연극</span>
				<a class="menu__item-link" href="total_ent_main?category=2">Theater</a>
			</span><br/>
			<span class="menu__item"> 
				<span class="menu__item-tag">전시</span>
				<a class="menu__item-link" href="total_ent_main?category=3">Museum</a>
			</span>
			<span class="menu__item">
				<span class="menu__item-tag">공지사항</span>
				<a class="menu__item-link" href="notice">NoticeInfo</a>
			</span>
		</nav>
	</div>
	</main>
	<script>
	function checkLogin() {
		if (<%= session.getAttribute("loginUser") %> == null) {
			alert("로그인 후에 이용 가능합니다.");
			window.location.href = "login_form";
		} else {
			window.location.href = "mypage";
		}
	}
	</script>
	
	
</body>
</html>