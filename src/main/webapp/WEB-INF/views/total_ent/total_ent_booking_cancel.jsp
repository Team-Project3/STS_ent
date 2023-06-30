<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
alert('세션이 만료되었습니다. 다시 로그인해 주세요');
window.close();
window.opener.location.href="login_form";
</script>
</body>
</html>