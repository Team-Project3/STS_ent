<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<link rel="shortcut icon" href="img/favicon.png">
<link rel="stylesheet" type="text/css" href="css/member/review.css" />
</head>
<body>
	<div id="review-container">
	</div>
	<div class="rcontainer">
		<form id="reviewForm" name="reviewForm" method="post">
			<div id="reviewinsert">
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
                	<input type="text" maxlength="50" id="rcontent" name="rcontent" placeholder="50자 이내로 후기를 입력해주세요" />
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
	<script type="text/javascript" src="js/member/review.js"></script>			
</body>
</html>