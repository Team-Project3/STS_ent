<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<script type="text/javascript">
Kakao.init('e6642bc88fd411b12f3c678d2f563941');
Kakao.API.request({
    url: '/v2/user/me',
    
    success: function(response) {
      console.log('User email:', response.kakao_account.email);
      console.log('User phone number:', response.kakao_account.phone_number);
      console.log('User name:', response.properties.nickname);
    },
    fail: function(error) {
      console.log('Failed to get user information:', error);
    }
  });
</script>
</body>
</html>