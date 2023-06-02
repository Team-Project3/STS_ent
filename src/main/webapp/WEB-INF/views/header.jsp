<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>STS ENTERTAINMENT</title>

<meta name="keywords"
	content="clip-path, animation, scale, effect, background, hover" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="img/favicon.png">
<link rel="stylesheet" href="https://use.typekit.net/cze1cgq.css">
<link rel="stylesheet" type="text/css" href="css/base.css" />
<script type="text/javascript" src="member/member.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
<script src="https://cdn.jsdelivr.net/npm/gsap@3.11/dist/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.7.1/gsap.min.js"></script>
<script src="https://unpkg.com/imagesloaded@5/imagesloaded.pkgd.min.js"></script>
<script>document.documentElement.className="js";var supportsCssVars=function(){var e,t=document.createElement("style");return t.innerHTML="root: { --tmp-var: bold; }",document.head.appendChild(t),e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)")),t.parentNode.removeChild(t),e};supportsCssVars()||alert("Please view this demo in a modern browser that supports CSS Variables.");</script>
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</head>
<body>

<header>
	
	<nav role="navigation">
		<div id="menuToggle">
			<input type="checkbox" /> 
				<span></span> 
				<span></span> 
				<span></span>
			<ul id="menu">
				<div class="frame__menu" style="text-align: center;">
					<c:choose>
						<c:when test="">
							<a href="login">Login</a>&emsp;&emsp;&emsp; 
							<a href="signup">Sign Up</a>		
						</c:when>
						<c:otherwise>
							<a href="">My Page</a>
						</c:otherwise>
					</c:choose>
					
				</div>
				<hr>
				<a href="index"><li>Home</li></a>
				<a href="#"><li>About</li></a>
				<a href="#"><li>Info</li></a>
				<a href="#"><li>Contact</li></a>
				<a href="" target="_blank"><li>Show me more</li></a>
			</ul>
		</div>
	</nav>
	
	<nav class="headerlogo" style="text-align:center; margin-top:10px;">
		<a>
			<div><img alt="" src="img/HEADER_LOGO_sts.png" onclick="location='index'"></div>
		</a>
	</nav>

	
</header>
</body>
</html>