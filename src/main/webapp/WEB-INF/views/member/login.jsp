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
	            loginButton: {color: "green", type: 3, height: 40, width: 120}
	        }
	    );
  	naverLogin.init();
  </script>
</html>