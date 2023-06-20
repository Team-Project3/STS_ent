<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/concert_detail.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<div id="review-container">
	</div>
	
	<div class="rcontainer">
		<form id="reviewForm" name="reviewForm" method="post">
			<div>
				<div id="reviewpoint">
					<fieldset>
						<span class="text-bold">평점을 선택해주세요</span>
						<input type="radio" name="rpoint" value="5" id="rpoint5"><label
							for="rpoint5">💗</label>
						<input type="radio" name="rpoint" value="4" id="rpoint4"><label
							for="rpoint4">💗</label>
						<input type="radio" name="rpoint" value="3" id="rpoint3"><label
							for="rpoint3">💗</label>
						<input type="radio" name="rpoint" value="2" id="rpoint2"><label
							for="rpoint2">💗</label>
						<input type="radio" name="rpoint" value="1" id="rpoint1"><label
							for="rpoint1">💗</label>
					</fieldset>
				</div>
				<span>
                	<input type="text" maxlength="100" id="rcontent" name="rcontent" placeholder="100자 이내로 후기를 입력해주세요"></input>
                </span>
				&emsp;&emsp;
				<span id="button">
					<a href='#' onClick="save_review()" class="btn">등록</a>
				</span>
			</div>
			<input type="hidden" value="${total_ent.tseq}" id="tseq" name="tseq" />
        	 
		</form>
	</div>
	
	<div class="container">
    <form id="reviewListForm" name="reviewListForm" method="post">
        <div id="reviewList"></div>
    </form>
    </div>
				
				
	<script type="text/javascript">

	$(document).ready(function() {
		// 상품상세정보 로딩 시에 상품평 목록을 조회하여 출력
		reviewList();
	});
	
	var tseq = ${total_ent.tseq};
	
	// 상품평 목록 불러오기
	function reviewList() {
		$.ajax({
			type: 'GET',
			url: 'reviews/list',
			dataType: 'json',
			data: {tseq: tseq},
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				console.log(data);
				  $("#review-container").empty();
				  var reviewList = data.commentList;

				  if (reviewList.length > 0) {
				    var html = "";

				    reviewList.forEach(function(review) {
				      html += "<div class='review-item'>";
				      html += "<strong>작성자 : " + review.id + "</strong>";
				      html += "&emsp;&emsp;<span>작성일 : " + formatDate(review.regdate) + "</span>";
				      html += "<br>";
				      html += review.rcontent;
				      html += "</div>";
				    });

				    $("#review-container").html(html);
				    
				  } else {
				    $("#review-container").html("<p>등록된 후기가 없습니다.</p>");
				  }
				},		
				
			error: function() {
				alert("조회하지 못했습니다.")
			}
		});
	}
	
	function formatDate(dateString) {
		var date = new Date(dateString);
		var year = date.getFullYear();
		var month = String(date.getMonth() + 1).padStart(2, '0');
		var day = String(date.getDate()).padStart(2, '0');
		  
		return year + "-" + month + "-" + day;
	}
	
	//상품 댓글 등록
	function save_review() {
		var selectedRating = $('input[name="rpoint"]:checked').val();
	    
	    if (selectedRating === undefined) {
	        alert("별점을 선택해주세요.");
	        return;
	    }

	    
		$.ajax({
			type: 'POST',
			url: 'reviews/save',
			data: {
            	tseq: tseq,
            	rcontent:$("#rcontent").val(),
            	rpoint: selectedRating
        	},
        	success: function(data) {
        		var membervo = document.getElementById("id").value;
            	if (data == 'success') {
            		reviewList(); // 상품평 목록 요청함수 호출
                	$("#rcontent").val("");
                	$('input[name="rpoint"]').prop('checked', false); 
            	} else if (membervo == null || membervo == "") {
	                alert("로그인 후에 이용해주시기 바랍니다.");
	                location.href = "login_form";
    	        }
        	},
        	error: function(request, status, error) {
            	alert("error:" + error);
        	}
    	});
	}

	</script>			
</body>
</html>