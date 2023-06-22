/**
 * 
 */
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