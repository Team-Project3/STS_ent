<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/concert.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
</head>


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
	<div class="contentmain">
		<a href="" class="contenta">
			<img src="img/Cafe 유월.jpg" class="contentimg">
			<div class="contentel">
				<p class="contentp">노을 콘서트 Cafe 유월</p>
			</div>
		</a> 
		<a href="" class="contenta">
			<img src="img/BRUNO MAJOR.jpg" class="contentimg">
			<div class="contentel">
				<p class="contentp">BRUNO MAJOR 내한 공연</p>
			</div>
		</a> 
		<a href="" class="contenta">
			<img src="img/MY AUNT MARY.jpg"	class="contentimg">
			<div class="contentel">
				<p class="contentp">MY AUNT MARY 단독 공연</p>
			</div>
		</a> 
	</div>
	
	<div class="contentmain">
		<a href="" class="contenta">
			<img src="img/UFO STATION.jpg" class="contentimg">
			<div class="contentel">
				<p class="contentp">UFO STATION 페스티벌</p>
			</div>
		</a> 
		<a href="" class="contenta">
			<img src="img/나캠든개론.jpg" class="contentimg">
			<div class="contentel">
				<<p class="contentp">나캠든 팬미팅</p>
			</div>
		</a> 
		<a href="" class="contenta">
			<img src="img/스마일러브위크엔드.jpg"	class="contentimg">
			<div class="contentel">
				<p class="contentp">SMILE LOVE WEEKEND</p>
			</div>
		</a> 
	</div>
	
	<div class="contentmain">
		<a href="" class="contenta">
			<img src="img/죠지 단독.jpg" class="contentimg">
			<div class="contentel">
				<p class="contentp">GEORGE 단독 콘서트</p>
			</div>
		</a> 
		<a href="" class="contenta">
			<img src="img/차학연.jpg"	class="contentimg">
			<div class="contentel">
				<p class="contentp">차학연 팬미팅</p>
			</div>
		</a> 
		<a href="" class="contenta">
			<img src="img/코다라인.jpg" class="contentimg">
			<div class="contentel">
				<p class="contentp">코다라인 내한 공연</p>
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
<div class="footer">
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>