<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원 정보</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/a_performance.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
</head>
<script type="text/javascript">
	//회원 수정
	function editform() {
		var theform = document.getElementById("update");
		alert("회원 정보가 수정되었습니다.");
		theform.action = "a_member_editt";
		theform.submit();
	}
	
	//회원 삭제
	function deleteform() {
		var id = document.getElementById("id").value;
		var promptObj = prompt('관리자 비밀번호를 입력하세요.', '');
		 $.ajax({
	           type: "POST",
	           url: 'a_member_delete',
	           data: {
	        	   a_password:promptObj,
	        	   id:id
	           }, 
	           success: function(data){
	        	   if(data =='fail'){
	        		   alert("비밀번호를 틀렸습니다.");
	        	   }
	        	   else{
	        		   document.write(data);
	        	   }
	           },
	           error: function(data)
	           {
	            if (data.status == 401) {
	                alert('failed.');
	                
	               return;
	            }
	           }
	        });
	}
	
</script>
<style>
table {
  border-collapse: collapse;
  width: 30%;
}

/* 테이블 셀 스타일 */
td {
  padding: 10px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

td:first-child {
  width: 10%;
}
td:nth-child(2) {
  width: 20%;
  
}

/* 입력 필드 스타일 */
input[type="text"],
input[type="date"] {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 100%;
  font-size: 14px;
}

/* ID 입력 필드 스타일 */
#id {
  background-color: #f9f9f9;
  font-weight: bold;
}

/* 버튼 스타일 */
button {
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 14px;
}

/* 테이블 헤더 스타일 */
th {
  padding: 10px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
  font-weight: bold;
}

/* 전화번호 입력 필드 스타일 */
#phone {
  font-family: "Courier New", Courier, monospace;
}

/* 이메일 입력 필드 스타일 */
#email {
  text-transform: lowercase;
}

/* 생년월일 입력 필드 스타일 */
#birth {
  background-color: #f9f9f9;
  font-weight: bold;
  cursor: not-allowed;
}
</style>
<body class="sb-nav-fixed">
	<%@ include file="../a_header.jsp"%>
	<!-- <form action="a_member_edit" id="edit" method="post"> -->

	<div id="layoutSidenav_content">
		<div class="container-fluid px-4">
			<h1 class="mt-4">회원 정보 수정</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Member Information</li>
			</ol>
			<form name="formm" id="update" method="post">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 회원 정보 수정<br>
				</div>
				
					<div class="card-body">

						<table>
							<tr>
								<td>아이디</td>
								<td><input id="id" name="id" type="text"
									value="${membervo.id}" readonly="readonly"></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input id="password" name="password" type="text"
									value="${membervo.password}"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input id="name" name="name" type="text"
									value="${membervo.name}"></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input id="phone" name="phone" type="text"
									value="${membervo.phone}"></td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><fmt:formatDate value="${membervo.birth}"
										pattern="yyyy-MM-dd" var="birth" /> <input id="birth"
									name="birth" type="date" value="${birth}" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input id="email" name="email" type="text"
									value="${membervo.email}"></td>
							</tr>
						</table>
					</div>
				</div>
				<div align="right">
					<input class="btn btn-primary" type="button" onClick="editform()" value="수정"> 
					<input class="btn btn-primary" type="button" onClick="deleteform()" value="삭제">
				</div>
				</form>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>