<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>total_ent_main</title>
<link rel="stylesheet" type="text/css" href="css/total_ent/total_ent_main.css" />
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="js/total_ent/total_ent_main.js"></script>
</head>

<body oncontextmenu="return false">
	<div class="slider">
		<div class="slide-viewer">
			<div class="slide-group">
			</div>
		</div>
		<div class="slide-nav">
			<div class="prev"></div>
			<div class="next"></div>
		</div>
		<div class="slide-buttons"></div>
	</div>
	
	<section style="width: 100%;">
		<div class="pick">
			<h1>STS's PICK</h1>
		</div>
		<c:forEach var="total_ent" items="${total_entList}" varStatus="loop">
			<c:if test="${loop.index % 3 == 0}">
				<div class="contentmain">
			</c:if>
			<a href="total_ent_detail?tseq=${total_ent.tseq}&category=${total_ent.category}" class="contenta">
				<c:if test="${total_ent.category ==1}">
					<img class="contentimg" src="img/concert/${total_ent.pimg}.jpg">
				</c:if> 
				<c:if test="${total_ent.category ==2}">
					<img class="contentimg" src="img/theater/${total_ent.pimg}.jpg">
				</c:if> 
				<c:if test="${total_ent.category ==3}">
					<img class="contentimg" src="img/museum/${total_ent.pimg}.jpg">
				</c:if>
				<div class="contentel">
					<p class="contentp">${total_ent.tname}</p>
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