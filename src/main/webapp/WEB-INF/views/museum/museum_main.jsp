<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회</title>
<link rel="stylesheet" type="text/css" href="css/museum.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="js/theater.js"></script>
</head>

<body>
	<div class="museum">
		<div class="slider-container">

			<div class="image-video-slider">
				<div class="image-video-slide image-slide" align="center">
					<div class="inner"
						style="background-image: url(img/museum/그림1.png); width: 800px; height: 475px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/museum/그림2.png); width: 850px; height: 475px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/museum/그림3.png); width: 850px; height: 475px;"></div>
				</div>
				<div class="image-video-slide video-slide">
					<div class="inner">
						<div class='youtube-player' data-id='4Z9mUjtFJYY'></div>
					</div>
				</div>
			</div>
			<!-- .slider-container -->
		</div>

		<section style="width: 100%;">
			<c:forEach var="museum" items="${museumList}" varStatus="loop">
				<c:if test="${loop.index % 3 == 0}">
					<div class="contentmain">
				</c:if>

				<a href="museum_detail?tseq=${museum.tseq}" class="contenta"><img src="img/museum/${museum.pimg}.jpg" class="contentimg">
					<div class="contentel">
						<p class="contentp">${museum.tname}</p>
					</div>
				</a>

				<c:if test="${loop.index % 3 == 2 || loop.last}">
	</div>
	</c:if>
	</c:forEach>
	</section>
	
	<div class="footer">
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>