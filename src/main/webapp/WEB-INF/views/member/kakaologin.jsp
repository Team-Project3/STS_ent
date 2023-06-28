<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>



<%-- <% String code = request.getParameter("code"); %>
<%=code%>
<input type="hidden" value="<%=code%>" id="code"> --%>
<!-- <script type="text/javascript">

var code = document.getElementById("code").value;
Kakao.init('e6642bc88fd411b12f3c678d2f563941');


	
	$.ajax({
		type : "POST",
		url : 'https://kauth.kakao.com/oauth/token',
		dataType : "text",
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		data : {
			grant_type : authorization_code,
			client_id : 'e6642bc88fd411b12f3c678d2f563941',
			redirect_uri : 'http://localhost:8506/biz/kakaologin',
			code : code
		},
	    success: function(res) {

	        console.log('User email:', res.kakao_account.email);
	        console.log('User phone number:', res.kakao_account.phone_number);
	        console.log('User name:', res.properties.nickname);
	      },
	      fail: function(error) {
	        console.log('Failed to get user information:', error);
	      }


    
});
</script> -->
</body>
</html>