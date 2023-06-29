<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="shortcut icon" href="img/favicon.ico">
   <link rel="stylesheet" type="text/css" href="css/member/signup.css" />
   <script type="text/javascript" src="js/member/member.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
</head>
<body>
<article> 
	<form id="signup" action="signup" method="post" name="go_signup">
		<fieldset>
			<legend>Sign Up</legend><br> 
		        <label>&emsp;User ID</label>
		        
		        <input type="text" maxlength="20" name="id" id="id" value="${id}" size="12" placeholder="아이디">
		        <input type="hidden" name="reid" id="reid" value="${reid}">
		        <input type="button" value="중복 체크" class="dup" onclick="idcheck()"><br>
		        
		        <label>&emsp;Password</label> 
		        <input type="password" maxlength="30" name="password" id="password" placeholder="비밀번호"><br> 
		        
		        <label>&emsp;Retype Password</label> 
		        <input type="password" maxlength="30" name="passwordCheck" id="passwordCheck" placeholder="비밀번호 체크" onchange="check_pwd()"><br> 
		        
		        <label>&emsp;Name</label>
		        <input type="text" maxlength="20" name="name" id="name" placeholder="이름"><br> 
		       
		        <label>&emsp;Birth</label>
		        <input type="date" name="birth" id="birth" onclick="handleDateClick()" /><br> 
		        
		        <label>&emsp;E-Mail</label>
		        <input type="text" maxlength="50" name="email" id="email" placeholder="e-mail"><br>
		       
		        <label>&emsp;Phone</label>
		        <input type="text" maxlength="50" name="phone" id="phone" placeholder="전화번호" oninput="hypenTel(this)"><br>
		        
		        <div class="clear" style="text-align: center;">
					<div id="buttons">
						<button type="button" class="submit"  onclick="checkDuplicate()">회원가입</button>&nbsp;&nbsp;&nbsp;&nbsp;	
						<button type="reset"  class="cancel" onclick="location='index'">취소</button>
					</div>
				</div>
		</fieldset>		
	</form>
</article>
<div class="footer">
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>