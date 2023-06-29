<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
	integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx"
	crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>


	<p id="token-result"></p>
	<%
		String code = request.getParameter("code");
	%>
	<input type="hidden" value="<%=code%>" id="code">
	<script type="text/javascript">

var code = document.getElementById("code").value;
Kakao.init('66997d3bd40d109787898fc9a5889973');

$.ajax({
	  type: "POST",
	  url: 'https://kauth.kakao.com/oauth/token',
	  dataType: 'json',
	  contentType: 'application/x-www-form-urlencoded;charset=utf-8',
	  data: {
	    grant_type: 'authorization_code',
	    client_id: '66997d3bd40d109787898fc9a5889973',
	    redirectUri: 'http://localhost:8506/biz/kakaologin',
	    code: code
	  },
	  success: function(response) {
		  Kakao.Auth.setAccessToken(response.access_token);
	    Kakao.API.request({
	    	  url: '/v2/user/me',
	    	})
	    	  .then(function(response) {
	    		  
	    		  var id = response.id;
	    		  var name = response.kakao_account.name;
	    		  var email = response.kakao_account.email;
		    	  var birthday = response.kakao_account.birthday;
		    	  var month = birthday.substring(0,2);
		    	  var day = birthday.substring(2);
		          var formattedBirthday = month + '-' + day;
		    	  var birth = response.kakao_account.birthyear+'-'+formattedBirthday;
		    	  var phoneNumber = response.kakao_account.phone_number;
	    	  	  phoneNumber = phoneNumber.substring(4);
	    		  var phone = 0+phoneNumber;
	    		  	    		  
	    	    	$.ajax({
	    	    		type : "POST",
	    	    		url : 'kakaologin',
	    	    		dataType : "text",
	    	    		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	    	    		data : {
	    	    			id : id,
	    	    			password : '1',
	    	    			name : name,
	    	    			phone : phone,
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

	    	  })
	    	  .catch(function(error) {
	    		  alert('에러가 발생했습니다');
	    	  });
	  },
	  error: function(jqXHR, error) {
	    alert('Failed to obtain access token: ' + error);
	  }
	});
	</script>
</body>
</html>