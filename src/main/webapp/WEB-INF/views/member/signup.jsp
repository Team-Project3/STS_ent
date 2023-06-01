<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
body {
	 overflow: auto;
	 height: 1200px;
	 background-color:#34333b;
}
form {
	height: 113%;
	width: 40%;
    background-color: rgba(255,255,255,0.13);
    position: absolute;
    transform: translate(-50%,-50%);
    top: 600px;
    left: 50%;
    border-radius: 10px;
    backdrop-filter: blur(10px);
    border: 2px solid rgba(255,255,255,0.1);
    box-shadow: 0 0 40px rgba(8,7,16,0.6);
    padding: 5px 5px;
}
fieldset {
	margin: 0 auto;
	width: 85%;
	margin-top: 30px;
}
input{
	margin: 0 auto;
    display: block;
    height: 40px;
    width: 95%;
    background-color: rgba(255,255,255,0.07);
    border-radius: 3px;
    padding: 0 10px;
    margin-top: 8px;
    font-size: 14px;
    font-weight: 300;
}
legend {
	font-size: 28px;
	font-weight: bold;
	color: white;
}
label {
	color: white;
	font-weight: bold;
}
button{
    margin: 10px 0;
    width: 30%;
    background-color: #ffffff;
    color: black;
    padding: 10px 0;
    font-size: 15px;
    font-weight: bold;
    border-radius: 4rem;
    cursor: pointer;
}
.signup_footer {
	margin-top: 900px;
}
</style>
<article>
	<form id="signup" action="signup" method="post" name="form">
		<fieldset>
			<legend>Sign Up</legend><br>
		        <label>&emsp;User ID</label>
		        <input type="text"      name="id"  id="id" value="${id}"  size="12"  >
		        <input type="hidden"    name="reid" id="reid" value="${reid}">
		        <input type="button"    value="중복 체크"  class="dup" onclick="idcheck()"><br>
		        <label>&emsp;Password</label> 
		        <input type="password"  name="pwd" id="pwd"><br> 
		        <label>&emsp;Retype Password</label> 
		        <input type="password"  name="pwdCheck" id="pwdCheck"><br> 
		        <label>&emsp;Name</label>
		        <input type="text" name="name" id="name"><br> 
		        <label>&emsp;E-Mail</label>
		        <input type="text" name="email" id="email"><br>
		        <label>&emsp;Phone</label>
		        <input type="text" name="phone" id="phone"><br>
		        
		        <div class="clear" style="text-align: center;">
					<div id="buttons">
						<button type="button" class="submit"  onclick="go_save()">회원가입</button>&nbsp;&nbsp;&nbsp;&nbsp;	
						<button type="reset"  class="cancel" onclick="location='index'">취소</button>
					</div>
				</div>
		</fieldset>
		
		
		
	</form>
</article>
<%@ include file="../footer.jsp" %>