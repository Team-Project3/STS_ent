<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
    	<title>회원 정보</title>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/a_performance.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
    </head>
    <script type="text/javascript">
	function a_editMember() {
    	var id = "${membervo.id}";
        window.location.href = "a_member_editF?id=" + id;
    }
	</script> 
    <body class="sb-nav-fixed">
       <%@ include file="../a_header.jsp" %>
                <div id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원 정보</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Member Information</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                          		     회원 정보<br>
                            </div>
                            <form id="update" name="formm" method="post">
                            <input type="hidden" value="${membervo.id}" id="id">
                            <div class="card-body">
                                                                        아이디 : ${membervo.id }<br>
                          		비밀번호 : ${membervo.password }<br>
                          		이름: ${membervo.name}<br>
                          		전화번호 : ${membervo.phone }<br>
                          		<fmt:formatDate value="${membervo.birth}" pattern="yyyy-MM-dd" var="birth" />
                          		생년월일 : ${birth}<br>
                          		이메일 : ${membervo.email }<br>
                            
                          		<button type="button" onclick="a_editMember()">수정</button>&emsp;&emsp;
                            </div>
                            </form>
                        </div>
                    </div>
                 </div>
                 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>