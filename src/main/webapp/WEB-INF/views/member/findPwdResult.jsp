<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/member.js"></script>

<script type="text/javascript">
function idok(){
  self.close();
}
</script>
</head>
<body>
<div id="wrap">
  <h1>비밀번호 찾기 결과</h1>
  <form method="post" name="formm" action="change_pwd" id="pwd_form" style="margin-right:0" >
    <c:if test="${message == 1}">
	    <label>User ID</label><input type=text name="id" value="${id}" readonly="readonly">   
	    <div style="margin-top: 20px">   
	      	<label>새 비밀번호</label> 
	        <input type="password"  name="password" id="password"><br> 
	        <label>새 비밀번호 확인</label> 
	        <input type="password"  name="pwdCheck" id="pwdcheck"><br> 
	        <input type="button" value="확인" class="cancel" onclick="changePassword()">
	    </div>
    </c:if>
    <c:if test="${message == -1 }">
    	가입하지 않은 ID입니다.
    	<input type="button" value="확인"class="cancel" onclick="idok()">
>    </c:if>
  </form>
</div>  
</body>
</html>