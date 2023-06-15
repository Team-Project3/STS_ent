<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/thmain.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

<script type="text/javascript"
	src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="js/theater.js"></script>
</head>

<body>
	<div class="theater">
		<div class="slider-container">

			<div class="image-video-slider">
				<div class="image-video-slide image-slide" align="center">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드1.jpg); width: 800px; height: 475px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드2.jpg); width: 850px; height: 475px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드3.jpg); width: 850px; height: 475px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드4.jpg); width: 850px; height: 475px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드5.jpg); width: 850px; height: 475px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드6.jpg); width: 850px; height: 475px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드7.jpg); width: 850px; height: 475px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드8.jpg); width: 850px; height: 475px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드9.jpg); width: 850px; height: 475px;"></div>
				</div>
				
			</div>
			<!-- .slider-container -->
		</div>

		<section style="width: 100%;">
			<c:forEach var="theater" items="${theaterList}" varStatus="loop">
				<c:if test="${loop.index % 3 == 0}">
					<div class="contentmain">
				</c:if>

				<a href="thdetail?tseq=${theater.tseq}" class="contenta"><img src="img/theater/${theater.pimg}.jpg"
					class="contentimg">
					<div class="contentel">
						<p class="contentp">${theater.tname}</p>
					</div>
				</a>

				<c:if test="${loop.index % 3 == 2 || loop.last}">
	</div>
	</c:if>
	</c:forEach>
	</section>

	</div>
	<div class="footer">
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>