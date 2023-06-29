<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>LOG IN</title>
<meta charset="UTF-8" name="google-signin-client_id"
	content="339044029339-uhke0src7j98mqp928fvijnkrmhf3e06.apps.googleusercontent.com">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="img/favicon.png">
<link rel="stylesheet" type="text/css" href="css/member/login.css" />

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap"
	rel="stylesheet">
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
	integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx"
	crossorigin="anonymous"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
</head>
<body>

	<div class="login_form">
		<form method="post" action="login" id="loginform">
			<h3>Sign In</h3>
			<br> <br> <input maxlength="30" type="text"
				placeholder="ID" name="id" value="${id}"> <input
				maxlength="30" type="password" placeholder="PASSWORD"
				name="password"> <br>
			<div style="text-align: right;">
				<a type="button" class="submit1" onclick="find_id_form()">ID/PW
					찾기</a>
			</div>

			<button type="submit" class="submit2">Log In</button>
			<br>
			<div id="naverIdLogin" style="display: none;"></div>


			<div id="dd">
				<hr>
				&emsp;간편 로그인&emsp;
				<hr>
			</div>
			<br>

			<div class="social-login">

				<a href="#no" title="네이버ID로 로그인" class="naver-login" id="naverLogin">
					<i class="xi-naver"></i> <img id="naver" src="img/naverlogin.png">
				</a> &emsp;&emsp;&emsp;&emsp; <a id="kakao-login-btn"
					href="javascript:loginWithKakao()"> <img
					src="img/kakaologin.png" alt="카카오 로그인 버튼" id="kakao" />
				</a> &emsp;&emsp;&emsp;&emsp;
				<ul>
					<li id="GgCustomLogin"><a href="javascript:void(0)"> <img
							src="img/googlelogin.png" id="google" />
					</a></li>
				</ul>
			</div>

			<br>
			<div style="text-align: right;">
				아직 회원이 아니신가요?&nbsp;&nbsp; <a class="submit3" href="signup_form">SIGN
					UP</a>
			</div>
		</form>

	</div>
	<div class="footer">
		<%@ include file="../footer.jsp"%>
	</div>
</body>
<script type="text/javascript" src="js/member/member.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer></script>
</html>