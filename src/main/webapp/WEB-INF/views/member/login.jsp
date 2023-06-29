<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>LOG IN</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="img/favicon.png">
	<link rel="stylesheet" type="text/css" href="css/member/login.css" />
	<script type="text/javascript" src="js/member/member.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>

</script>
</head>
<body>

<div class="login_form">
        
    
    <form method="post" action="login" id="loginform">
        <h3>Sign In</h3>
		<br><br>
        
        <input type="text" placeholder="ID" name="id" value="${id}">
        <input type="password" placeholder="PASSWORD" name="password">
		<br>
		<div style="text-align: right;">
			<a type="button" class="submit" onclick="find_id_form()">ID/PW 찾기</a>
			
        </div>
        
        <button type="submit" class="submit">Log In</button>
        <br><br>
        <div style="text-align: right;">
			아직 회원이 아니신가요?&nbsp;&nbsp;
			<a class="submit" href="signup_form">SIGN UP</a>
        </div>
        <div id="naverIdLogin"></div>
        <a id="kakao-login-btn" href="javascript:loginWithKakao()">
  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    alt="카카오 로그인 버튼" />
</a>
<p id="token-result"></p>
<button class="api-btn" onclick="requestUserInfo()" style="visibility:hidden">사용자 정보 가져오기</button>

    </form>
    
</div>
<div class="footer">
<%@ include file="../footer.jsp" %>
</div>
</body>
  <script type="text/javascript">
  
  	const naverLogin = new naver.LoginWithNaverId(
	        {
	            clientId: "IK04q9z9rJMeoi3tE_bf",
	            callbackUrl: "http://localhost:8506/biz/naverlogin",
	            loginButton: {color: "green", type: 1, height: 40, width: 120}
	        }
	    );
  	naverLogin.init();
  </script>
<script type="text/javascript">
Kakao.init('e6642bc88fd411b12f3c678d2f563941'); // 사용하려는 앱의 JavaScript 키 입력

function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8506/biz/kakaologin',
    });
  }

/*  
function requestUserInfo() {
    Kakao.API.request({
      url: '/v2/user/me',
    })
      .then(function(res) {
        alert(JSON.stringify(res));
      })
      .catch(function(err) {
        alert(
          'failed to request user information: ' + JSON.stringify(err)
        );
      });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      document.querySelector('#token-result').innerText = 'login success, ready to request API';
      document.querySelector('button.api-btn').style.visibility = 'visible';
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  } */

</script>
</html>