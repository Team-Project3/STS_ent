<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Screen</title>
    <link rel="stylesheet" type="text/css" href="css/error.css" />
</head>
<body>
    <div class="container">
        <h1>Error</h1>
        <div class="error-image"><img alt="" src="img/error1.png"></div>
        <div class="error-details">
            Error <%= request.getAttribute("javax.servlet.error.status_code") %><br>
            <%= exception.getClass().getSimpleName() %>
        </div>
        <div class="error-message">
           페이지를 로드할 수 없습니다. 혼란을 끼쳐 죄송합니다.
        </div>
        <div class="button-container">
            <a class="button" href="javascript:popclose();">팝업 닫기</a>
            <a class="button" href="javascript:close();">메인 페이지 가기</a>
        </div>
    </div>
</body>
<script type="text/javascript">
function popclose(){
self.close();
opener.location.href = "index";
}
</script>
</html>