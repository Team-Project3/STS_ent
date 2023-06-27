<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<link rel="stylesheet" type="text/css" href="css/member/popup.css" />
<script type="text/javascript" src="js/member/member.js"></script>
</head>
<body class="idcheck">
<div id="wrap">
  <h1 class="idcheckhead">ID 중복확인</h1>
  <form method="post" name="formm" id="theform" style="margin-right:0 " action="id_check_form" >
    User ID&emsp;<input type="text" name="id" value="${id}"> 
            <input type="submit" value="검색" class="submit"><br>     
    <div style="margin-top: 20px">   
      <c:if test="${message == 1}">
        <script type="text/javascript">
        openerForm.id.value="";
        </script>
        <i>${id}</i>는 이미 사용중인 아이디입니다.
      </c:if>
      <c:if test="${message == -1}">
        <i>${id}</i>는 사용 가능한 ID입니다.
        <input type="button" value="사용" class="cancel" onclick="idok()">
      </c:if>
    </div>
  </form>
</div> 


</body>
</html>