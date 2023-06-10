<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Movie Seat Booking</title>
<link rel='stylesheet' href='css/thboard.css'>

</head>
<body>
	<div class="movie-container"><form action="thboarddetail" id="thboard" method="post">
		<label style="color:white; font-weight:bold;">영화 제목</label> 
		<select id="movie">
			<option value='${theater.price}'>${theater.tname}</option>
		</select>
	</div>
	<input type="hidden" name="tseq" value="${theater.tseq}">
	<ul class="showcase">
		<li>
			<div class="seat"></div> <small>선택가능</small>
		</li>
		<li>
			<div class="seat selected"></div> <small>선택한 좌석</small>
		</li>
		<li>
			<div class="seat occupied"></div> <small>예약됨</small>
		</li>
	</ul>
	
	<div class="container">
		<div class="screen"></div>

		<%
			for (int i = 1; i <= 10; i++) {
		%>
		<div class="row">
			<%
			List<String> seatlist1 = (List<String>) request.getAttribute("seatlist1");
			
				for (int j = 1; j <= 7; j++) {
					
					String[] a = {"0","A","B","C","D","E","F","G","H","I","J"};
			        String str2 = Integer.toString(j);
			        String str3 = a[i] + str2;
			        
			        String seatClass = ""; // Initialize the seat class
					
			   
			        
			        // Check if the seat identifier exists in the seatlist1
			        if (seatlist1.contains(str3)) {
			            seatClass = "occupied"; // Set the seat class to "occupied"
			        }
			%>
			<div class="seat <%= seatClass %>"><input type="hidden" value="<%=str3%>" id="seatList"><%=str3%></div> 
			<!-- <div class="seat"></div> -->
			<%
				}
			%>
		</div>
		<%
			}
		%>
	</div>
	<div class="th_button">
		<button onclick="return go_save()" type="button">이전</button>&emsp;
		<button onclick="return go_save()" type="button">다음</button>
	</div>


	<p class="text">
		고른 좌석 <span id="count">0</span> 총 가격<span
			id="total">0</span>
	</p>
<input type="hidden" value="${dday}" name="dday" id="dday">
<script src="js/thboard.js" type="text/javascript"></script>
</form>
</body>
</html>