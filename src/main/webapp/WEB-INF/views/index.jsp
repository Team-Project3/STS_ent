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
					${sessionScope.loginUser.name}(${sessionScope.loginUser.id})
					&emsp;&emsp;&emsp;<a href="logout">LOGOUT</a>
				</c:otherwise>
			</c:choose>
			
			<hr>
			<li><a href="index">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Info</a></li>
			<li><a href="#">Contact</a></li>
			<li><a href="" target="_blank">Show me more</a></li>
			</ul>
		</div>
	</nav>

	<!-- <nav class="mainlogo"><div class><img src="img/MAIN_LOGO.png"></div></nav> -->
	<div class="screens" aria-hidden="true">

		<div class="screen__item" style="--bg-img: url(../img/concert3.jpg);">
			<div class="screen screen--full"></div>
			<div class="screen screen--clip screen--clip-1"></div>
		</div>
		<div class="screen__item" style="--bg-img: url(../img/1.jpg);">
			<div class="screen screen--full"></div>
			<div class="screen screen--clip screen--clip-1"></div>
		</div>
		<div class="screen__item" style="--bg-img: url(../img/museum1.jpg);">
			<div class="screen screen--full"></div>
			<div class="screen screen--clip screen--clip-1"></div>
		</div>
		<div class="screen__item" style="--bg-img: url(../img/main_mypage.jpg);">
			<div class="screen screen--full"></div>
			<div class="screen screen--clip screen--clip-1"></div>
		</div>
	</div>
	<div class="content">

		<nav class="mainlogo">
			<img alt="" src="img/MAIN_LOGO_sts.png">
		</nav>

		<nav class="menu">
			<span class="menu__item"> <span class="menu__item-tag">콘서트</span>
				<a class="menu__item-link" href="concert_main">Concert</a>

			</span> <span class="menu__item"> <span class="menu__item-tag">연극</span>
				<a class="menu__item-link" href="thmain">theater</a>
			</span><br /> <span class="menu__item"> <span class="menu__item-tag">전시</span>
				<a class="menu__item-link" href="">Museum</a>
			</span> <span class="menu__item"> <span class="menu__item-tag">내정보</span>
				<a class="menu__item-link" href="">My Page</a>
			</span>
		</nav>
	</div>
	</main>
	<script src="js/index.js" type="module"></script>
</body>
</html>