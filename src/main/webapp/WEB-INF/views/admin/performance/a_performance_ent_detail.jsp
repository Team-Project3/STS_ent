<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
    	<title>공연 정보 상세</title>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/a_performance.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
    </head>

    <body class="sb-nav-fixed">
       <%@ include file="../a_header.jsp" %>
                <div id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">공연 정보 상세</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Performance Information</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                          		     공연 정보<br>
                            </div>
                            <div class="card-body">
                            <div class="detailimg">
                            	<c:choose>
                            	<c:when test="${total.category ==1}"><img alt="" src="img/concert/${total.pimg}.jpg"></c:when>
                            	<c:when test="${total.category ==2}"><img alt="" src="img/theater/${total.pimg}.jpg"></c:when>
                            	<c:when test="${total.category ==3}"><img alt="" src="img/museum/${total.pimg}.jpg"></c:when>
                            </c:choose>
                            </div>
                            <div class="detailtable">
                            <input type="hidden" id="tseq" value="${total.tseq}">
                            <table class="detailtable1">
                            	<tr>
                            	<td>공연 번호</td>
                            	<td>${total.tseq}</td>
                            	</tr>
                            	<tr>
                            	<td>공연 종류</td>
                            	<td>
                            	<c:choose>
                            		<c:when test="${total.category ==1}">콘서트</c:when>
                            		<c:when test="${total.category ==2}">연극</c:when>
                            		<c:when test="${total.category ==3}">전시회</c:when>
                           		</c:choose>
                            	</td>
                            	</tr>
                            	<tr>
                            	<td>공연 이름</td>
                            	<td>${total.tname}</td>
                            	</tr>
                            	<tr>
                            	<td>공연 장소</td>
                            	<td>${total.place}</td>
                            	</tr>
                            	<tr>
                            	<td>공연시간</td>
                            	<td>${total.time}</td>
                            	</tr>
                            	<tr>
                            	<td>공연 날짜</td>
                            	<td>
                            	<fmt:formatDate value="${total.sdate}" pattern="yyyy-MM-dd" var="sdate" />
								<fmt:formatDate value="${total.edate}" pattern="yyyy-MM-dd" var="edate" />
								${sdate} ~ ${edate}
                            	</td>
                            	</tr>
                            	<tr>
                            	<td>공연 가격</td>
                            	<td>${total.price} 원</td>
                            	</tr>
                            	<tr>
                            	<td>좌석 배치</td>
                            	<td>${total.seat}</td>
                            	</tr>
                            </table>
							</div>
								<div>
                          		<button type="button" onclick="a_updateperformance()">수정</button>&emsp;&emsp;
                          		<button type="button" onclick="a_deleteperformance()">삭제</button>&emsp;&emsp;
                          		</div>
                            </div>
                        </div>
                    </div>
                 </div>
         	<script type="text/javascript">
	function a_updateperformance() {
        location.href = "a_performance_edit?tseq=" + document.getElementById("tseq").value;
    }
	function a_deleteperformance(){
		var tseq = document.getElementById("tseq").value;
		var promptObj = prompt('관리자 비밀번호를 입력하세요.', '');
		 $.ajax({
	           type: "POST",
	           url: '${pageContext.request.contextPath}/a_performance_deleteAction',
	           dataType: "text",
	           contentType: 'application/x-www-form-urlencoded; charset=utf-8',
	           data: {
	        	   a_password:promptObj,
	        	   tseq:tseq
	           }, 
	           success: function(data){
	        	   var result = data;
	        	   console.log(result);
	        	   if(result =='success'){
		        	   alert();   
	        	   }
	        	   else{
						//다음페이지로 가게하는 매직
	        		   document.write(result);
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>