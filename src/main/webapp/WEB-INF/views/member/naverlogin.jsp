<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인</title>
<link rel="shortcut icon" href="img/favicon.png">
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
const naverLogin = new naver.LoginWithNaverId(
        {
            clientId: "IK04q9z9rJMeoi3tE_bf",
            callbackUrl: "http://192.168.0.70:8506/biz/naverlogin"
        }
    );
naverLogin.init();
naverLogin.getLoginStatus(function (status) {
    if (status) {
    	
    	const id = naverLogin.user.getId();
    	var idstring = id.substring(0,8);
    	const name=naverLogin.user.getName();
        const birthday=naverLogin.user.getBirthday();
        const birthYear = naverLogin.user.getBirthyear();
        const email=naverLogin.user.getEmail();
        const mobile=naverLogin.user.getMobile();
        const birth = birthYear+"-"+birthday;
        
    	$.ajax({
    		type : "POST",
    		url : 'naverlogin',
    		dataType : "text",
    		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
    		data : {
    			id : idstring,
    			password : '1',
    			name : name,
    			phone : mobile,
    			birth : birth,
    			email : email
    		},
    		success : function(data) {
    			if (data == 'fail') {
    				alert("데이터가 들어가지 못했습니다.");
    			} else {
    				document.write(data);
    			}
    		},
    		error : function(data) {
    			if (data.status == 401) {
    				alert('failed.');

    				return;
    			}
    		}
    	});
    }
  });
</script>
</body>
</html>