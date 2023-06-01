<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
</head>

<style>
footer {
	height:700px;
}
.footer_menu {
	height: 70px; 
	position: relative;
	text-align: center;
	margin-bottom: 50px;
}
.footer_menu > a {
	display: inline-block;
	line-height: 78px;
    font-size: 15px;
    padding: 0 16px;
    position: relative;
	color: white;
}
.footer_txt {
    display: inline-block;
    height: 165px;
    width: 800px;
	text-align: center;
	margin-left: 400px;
}
.footer_logo {
	width: 200px;
	height: 200px;
	display: inline-block;
	text-align: center;
}
.flogo {
	width: 160px;
	height: 160px;	
}
.footxt {
    margin-left: 50px;
    width: 500px;
    height:200px;
    display: inline-block;
  	text-align: left;
}




body{overflow:auto; background-color:#34333b;}
.concert{margin: 50px 0;}

.slider-container {
  margin-top: 100px;
  margin-right: auto;
  margin-left: auto;
  max-width: 1000px;
  height: 600px;
  padding-left: 20px;
  padding-right: 20px;
}

.image-video-slide .inner {
    position: relative;
    display: block;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    opacity: 1;
    transition: all 300ms ease;
    overflow: hidden;
}

.image-video-slide .inner {
  margin: 0px;
}

.image-video-slide .inner:after {
    display: block;
    content: '';
    padding-bottom: 56.23%;
}

.image-video-slide.video-slide iframe,
.image-video-slide.video-slide object,
.image-video-slide.video-slide embed,
.image-video-slide.video-slide .youtube-player {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.image-video-slide.video-slide .inner iframe:after,
.image-video-slide.video-slide .inner .youtube-player:after {
  content: '';
  display: block;
  padding-bottom: 56%;
}

.image-video-slider .slick-prev,
.image-video-slider .slick-next {
  z-index: 10000;
}

.image-video-slider .slick-prev:before,
.image-video-slider .slick-next:before {
    color: #50a9dd !important;
}

/* LazyLoad YouTube */

.image-video-slider .youtube-player iframe {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
  background: transparent;
}
    
.image-video-slider .youtube-player img {
  bottom: 0;
  display: block;
  left: 0;
  margin: auto;
  max-width: 100%;
  width: 100%;
  position: absolute;
  right: 0;
  top: 0;
  border: none;
  height: auto;
  cursor: pointer;
  -webkit-transition: .4s all;
  -o-transition: .4s all;
  -moz-transition: .4s all;
  transition: .4s all;
}

.image-video-slider .youtube-player img:hover {
  -webkit-filter: brightness(75%);
}

.image-video-slider .youtube-player .play {
  height: 72px;
  width: 72px;
  left: 50%;
  top: 50%;
  margin-left: -36px;
  margin-top: -36px;
  position: absolute;
  background: url("//i.imgur.com/TxzC70f.png") no-repeat;
  cursor: pointer;
}

@media( min-width: 500px ) {
  .image-video-slide .inner {
      opacity: 0.8;
  }
  .image-video-slide .inner {
    margin: 10px;
  }
  .image-video-slider .slick-prev {
    left: -46px;
  }
  .image-video-slider .slick-prev:before,
  .image-video-slider .slick-next:before {
      font-size: 40px !important;
  }
  .image-video-slide.slick-center .inner {
    opacity: 1;
  }  
}


</style>
<body>
<div class="concert">


  <div class="slider-container">

  <div class="image-video-slider">
    <div class="image-video-slide image-slide" align="center">
    	<div class="inner" style="background-image:url(img/그림1.png); width:800px; height:475px;"></div>
    </div>
    <div class="image-video-slide image-slide">
    	<div class="inner" style="background-image:url(img/그림2.png); width:850px; height:475px;"></div>
    </div>
    <div class="image-video-slide image-slide">
    	<div class="inner" style="background-image:url(img/그림3.png); width:850px; height:475px;"></div>
    </div>
    	<div class="image-video-slide video-slide">
    		<div class="inner">
    			<div class='youtube-player' data-id='4Z9mUjtFJYY'></div>
    		</div>
    	</div>
    </div><!-- .slider-container -->

    
    
  <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
    <script type="text/javascript">
      $(document).ready(function() {
        $('.image-video-slider').slick({
          centerMode: true,
          arrows: true,
          slidesToShow: 1,
          appendArrows: '.image-video-slider',
          responsive: [
            {
            breakpoint: 768,
            settings: {
              centerMode: false,
              centerPadding: '100px',            
            },
            }
          ]
        });
      });
    </script>

</div>


<section style="width: 100%;">
	<div style="width: 900px; margin: 0 auto; font-size: 0; padding-bottom: 100px; text-align: center;">
		<a href="" style="display: inline-block; width: 264px; height: 360px; margin: 15px 15px; border: 1px solid #ddd; vertical-align: top;">
			<img src="img/Cafe 유월.jpg"	style="display: inline-block; width: 264px; height: 360px; border: 1px solid #ddd; vertical-align: top;">
			<div style="width: 100%; height: 70px; background: #fff; text-align: center; border-top: 1px solid #ddd;">
				<p style="font-size: 16px; color: #333; line-height: 22px; margin: 18px 20px 12px 20px;">노을 콘서트 Cafe 유월</p>
			</div>
		</a> 
		<a href="" style="display: inline-block; width: 264px; height: 360px; margin: 15px 15px; border: 1px solid #ddd; vertical-align: top;">
			<img src="img/BRUNO MAJOR.jpg"	style="display: inline-block; width: 264px; height: 360px; border: 1px solid #ddd; vertical-align: top;">
			<div style=" overflow:auto; width: 100%; height: 70px; background: #fff; text-align: center; border-top: 1px solid #ddd;">
				<p style="font-size: 16px; color: #333; line-height: 22px; margin: 18px 20px 12px 20px;">BRUNO MAJOR 내한 공연</p>
			</div>
		</a> 
		<a href="" style="display: inline-block; width: 264px; height: 360px; margin: 15px 15px; border: 1px solid #ddd; vertical-align: top;">
			<img src="img/MY AUNT MARY.jpg"	style="display: inline-block; width: 264px; height: 360px; border: 1px solid #ddd; vertical-align: top;">
			<div style="overflow:auto; width: 100%; height: 70px; background: #fff; text-align: center; border-top: 1px solid #ddd;">
				<p style="font-size: 16px; color: #333; line-height: 22px; margin: 18px 20px 12px 20px;">MY AUNT MARY 단독 공연</p>
			</div>
		</a> 
	</div>
	
	<div style="width: 900px; margin: 0 auto; font-size: 0; padding-bottom: 100px; text-align: center;">
		<a href="" style="display: inline-block; width: 264px; height: 360px; margin: 15px 15px; border: 1px solid #ddd; vertical-align: top;">
			<img src="img/UFO STATION.jpg" style="display: inline-block; width: 264px; height: 360px; border: 1px solid #ddd; vertical-align: top;">
			<div style="overflow:auto; width: 100%; height: 70px; background: #fff; text-align: center; border-top: 1px solid #ddd;">
				<p style="font-size: 16px; color: #333; line-height: 22px; margin: 18px 20px 12px 20px;">UFO STATION 페스티벌</p>
			</div>
		</a> 
		<a href="" style="display: inline-block; width: 264px; height: 360px; margin: 15px 15px; border: 1px solid #ddd; vertical-align: top;">
			<img src="img/나캠든개론.jpg" style="display: inline-block; width: 264px; height: 360px; border: 1px solid #ddd; vertical-align: top;">
			<div style="overflow:auto; width: 100%; height: 70px; background: #fff; text-align: center; border-top: 1px solid #ddd;">
				<p style="font-size: 16px; color: #333; line-height: 22px; margin: 18px 20px 12px 20px;">나캠든 팬미팅</p>
			</div>
		</a> 
		<a href="" style="display: inline-block; width: 264px; height: 360px; margin: 15px 15px; border: 1px solid #ddd; vertical-align: top;">
			<img src="img/스마일러브위크엔드.jpg"	style="display: inline-block; width: 264px; height: 360px; border: 1px solid #ddd; vertical-align: top;">
			<div style="overflow:auto; width: 100%; height: 70px; background: #fff; text-align: center; border-top: 1px solid #ddd;">
				<p style="font-size: 16px; color: #333; line-height: 22px; margin: 18px 20px 12px 20px;">SMILE LOVE WEEKEND</p>
			</div>
		</a> 
	</div>
	
	<div style="width: 900px; margin: 0 auto; font-size: 0; padding-bottom: 100px; text-align: center;">
		<a href="" style="display: inline-block; width: 264px; height: 360px; margin: 15px 15px; border: 1px solid #ddd; vertical-align: top;">
			<img src="img/죠지 단독.jpg" style="display: inline-block; width: 264px; height: 360px; border: 1px solid #ddd; vertical-align: top;">
			<div style="overflow:auto; width: 100%; height: 70px; background: #fff; text-align: center; border-top: 1px solid #ddd;">
				<p style="font-size: 16px; color: #333; line-height: 22px; margin: 18px 20px 12px 20px;">GEORGE 단독 콘서트</p>
			</div>
		</a> 
		<a href="" style="display: inline-block; width: 264px; height: 360px; margin: 15px 15px; border: 1px solid #ddd; vertical-align: top;">
			<img src="img/차학연.jpg"	style="display: inline-block; width: 264px; height: 360px; border: 1px solid #ddd; vertical-align: top;">
			<div style="overflow:auto; width: 100%; height: 70px; background: #fff; text-align: center; border-top: 1px solid #ddd;">
				<p style="font-size: 16px; color: #333; line-height: 22px; margin: 18px 20px 12px 20px;">차학연 팬미팅</p>
			</div>
		</a> 
		<a href="" style="display: inline-block; width: 264px; height: 360px; margin: 15px 15px; border: 1px solid #ddd; vertical-align: top;">
			<img src="img/코다라인.jpg" style="display: inline-block; width: 264px; height: 360px; border: 1px solid #ddd; vertical-align: top;">
			<div style="overflow:auto; width: 100%; height: 70px; background: #fff; text-align: center; border-top: 1px solid #ddd;">
				<p style="font-size: 16px; color: #333; line-height: 22px; margin: 18px 20px 12px 20px;">코다라인 내한 공연</p>
			</div>
		</a> 
	</div>
</section>




		<script type="text/javascript">
/* Light YouTube Embeds by @labnol */
/* Web: http://labnol.org/?p=27941 */
document.addEventListener("DOMContentLoaded",
        function() {
            var div, n,
                v = document.getElementsByClassName("youtube-player");
            for (n = 0; n < v.length; n++) {
                div = document.createElement("div");
                div.setAttribute("data-id", v[n].dataset.id);
                div.innerHTML = labnolThumb(v[n].dataset.id);
                div.onclick = labnolIframe;
                v[n].appendChild(div);
            }
        });

function labnolThumb(id) {
        var thumb = '<img src="https://i.ytimg.com/vi/ID/maxresdefault.jpg">',
            play = '<div class="play"></div>';
        return thumb.replace("ID", id) + play;
    }

function labnolIframe() {
        var iframe = document.createElement("iframe");
        var embed = "https://www.youtube.com/embed/ID?autoplay=1";
        iframe.setAttribute("src", embed.replace("ID", this.dataset.id));
        iframe.setAttribute("frameborder", "0");
        iframe.setAttribute("allowfullscreen", "1");
        this.parentNode.replaceChild(iframe, this);
}

// Stop all videos on slide transition.

$(function() {

function stopVideos() {
  
  $('.youtube-player iframe').each( function() {
    var url = $(this).attr('src');
    url = url.replace('?autoplay=1','');
    $(this).attr('src','');
    $(this).attr('src', url);
  });
  
}

$('.slick-prev').click( function() {
  console.log('Button Clicked');
  stopVideos();
});
                       
$('.slick-next').click( function() {
  console.log('Button Clicked');
  stopVideos();
});
  
});
</script>
</div>

<%@ include file="../footer2.jsp" %>
</body>
</html>