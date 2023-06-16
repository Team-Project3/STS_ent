<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
    	<title>회원 정보</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/a_performance.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
    </head>
    <script type="text/javascript">
	function submitForm() {
		if (document.getElementById("password").value == "") {
			alert("비밀번호를 입력하세요.");
			document.getElementById("password").focus();
			return false;
		} else if (document.getElementById("name").value == "") {
			alert("이름을 입력하세요.");
			document.getElementById("name").focus();
			return false;
		} else if (document.getElementById("email").value == "") {
			alert("이메일을 입력하세요.");
			document.getElementById("email").focus();
			return false;
		} else if (document.getElementById("phone").value == "") {
			alert("핸드폰번호를 입력하세요.");
			document.getElementById("phone").focus();
			return false;
		} else {
			var theform = document.getElementById("edit");
			alert("회원 정보가 수정되었습니다.");
			theform.action = "a_member_edit";
	        theform.submit();
		}
	}
	</script>
    <body class="sb-nav-fixed">
        <%@ include file="a_member_header.jsp" %>
                <div id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원 정보 수정</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Member Information</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                          		     회원 정보 수정<br>
                            </div>
                            <div class="card-body">
             					<form name="formm" id="edit" method="post">
                            	<table>
                            		<tr>
                            			<td>아이디</td>
                            			<td><input id="name" name="name" type="text" value="${membervo.id}" readonly="readonly"></td>
                            		</tr>
                            		<tr>
                            			<td>비밀번호</td>
                            			<td><input id="password" name="password" type="text" value="${membervo.password}"></td>
                            		</tr>
                            		<tr>
                            			<td>이름</td>
                            			<td><input id="name" name="name" type="text" value="${membervo.name}"></td>
                            		</tr>
                            		<tr>
                            			<td>전화번호</td>
                            			<td><input id="phone" name="phone" type="text" value="${membervo.phone}"></td>
                            		</tr>
                            		<tr>
                            			<td>생년월일</td>
                            			<td><input id="birth" name="birth" type="text" value="${membervo.birth}" readonly="readonly"></td>
                            		</tr>
                            		<tr>
                            			<td>이메일</td>
                            			<td><input id="email" name="email" type="text" value="${membervo.email}"></td>
                            		</tr>
                            	</table>

                          		<button onclick="editform()">수정</button>
                          		<button onclick="deleteform()">삭제</button>
                          		</form>
                            </div>
                        </div>
                    </div>
                 </div>
                
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>