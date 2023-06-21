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

	<!-- <div class="theater">
		<div class="slider-container">

			<div class="image-video-slider">
				<div class="image-video-slide image-slide" align="center">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드1.jpg); height: 750px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드2.jpg); height: 750px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드3.jpg); height: 750px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드4.jpg); height: 750px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드5.jpg); height: 750px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드6.jpg); height: 750px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드7.jpg); height: 750px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드8.jpg); height: 750px;"></div>
				</div>
				<div class="image-video-slide image-slide">
					<div class="inner"
						style="background-image: url(img/theater/th슬라이드9.jpg); height: 750px;"></div>
				</div>
				
			</div>
		</div> -->

		<div class="slider">
        <div class="slide-viewer">
            <div class="slide-group">
                <div class="slide slide-1"><img src="img/theater/th슬라이드1.jpg" alt=""></div>
                <div class="slide slide-2"><img src="img/theater/th슬라이드2.jpg" alt=""></div>
                <div class="slide slide-3"><img src="img/theater/th슬라이드3.jpg" alt=""></div>
                <div class="slide slide-4"><img src="img/theater/th슬라이드4.jpg" alt=""></div>
            </div>
        </div>
        <div class="slide-nav">
            <div class="prev"></div>
            <div class="next"></div>
        </div>
        <div class="slide-buttons"></div>
    </div>









		<section style="width: 100%; margin-top: 50px;">
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
    
    
    
    <script type="text/javascript">
    $(document).ready(function () {
        $('.slider').each(function(){
            var $this = $(this);
            var $group = $this.find('.slide-group');
            var $slides = $this.find('.slide');
            var buttonArray = [];
            var currentIndex = 0;
            var timeout;

            var $nav = $('.slide-nav').find('div');
        
             $nav.on('click', function (event) {
                event.preventDefault();
                console.log($(this));
                if ($(this).hasClass('next')) {
                    if (currentIndex === $slides.length -1) {
                        move(0);
                    }
                    move(currentIndex + 1);
                } else {
                    if (currentIndex === 0) {
                        move($slides.length -1);
                    }
                    move(currentIndex - 1);
                }
            });

        function move(newIndex) {
            var animateLeft, slideLeft;

            advance();

            if ($group.is(':animated') || currentIndex === newIndex) {
                return;
            }

            buttonArray[currentIndex].removeClass('active');
            buttonArray[newIndex].addClass('active');

            if (newIndex > currentIndex) {
                slideLeft = '100%';
                animateLeft = '-100%';
            } else {
                slideLeft = '-100%';
                animateLeft = '100%';
            }

            $slides.eq(newIndex).css({
                left: slideLeft,
                display: 'block'
            });

            $group.animate({left: animateLeft}, function() {
                $slides.eq(currentIndex).css({display: 'none'});
                $slides.eq(newIndex).css({left: 0});
                $group.css({left: 0});
                currentIndex = newIndex;
            });
        }

        function advance() {
            clearTimeout(timeout);
            timeout = setTimeout(function() {                    
                if (currentIndex < ($slides.length - 1)) {
                    move(currentIndex + 1);
                } else {
                    move(0);
                }
            }, 4000);
        }

        $.each($slides, function(index) {
            var $button = $('<button type="button" class="slide-btn">&bull;</button>');
            if (index === currentIndex) {
                $button.addClass('active');
            }
            $button.on('click', function(){
                move(index);
            }).appendTo('.slide-buttons');
            buttonArray.push($button);
        });

        advance();
        })

    });
    </script>
    
</body>
</html>