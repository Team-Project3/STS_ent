<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
</head>
<style>

    img {
	width: 400px;
    height: 450px;
}
.info{
	margin-left: 500px;
	margin-top: -400px;
}
.seatbutton{
border-radius: 50px;
}
.buttontd{
width: 100px;
}
  </style>

<body>
<img src="img/concert/좌석배치도.png" id="chair">
<div class="info">
<h2>좌석 선택</h2>
<table border="1">
<tr>
<td class="buttontd">
<button type="button" value="R" class="seatbutton">R석</button>
</td>
<td>
잔여석 : ${head1}
</td>
</tr>
<tr>
<td>
<button type="button" value="A" class="seatbutton">A석</button>
</td>
<td>
잔여석 : ${head2}
</td>
</tr>
<tr>
<td>
<button type="button" value="B" class="seatbutton">B석</button>
</td>
<td>
잔여석 : ${head3}
</td>
<tr>
<td>
<div class="seat" id="seat">좌석을 선택해주세요</div>
</td>
</tr>
</table>
<button type="button" id="nextButton" onclick="submit()">Next</button>
</div>
</body>
  <script>
  
  $('.seatbutton').on('click', function(e) {
		console.log(e.target.value);
		var seatgrade = e.target.value;
		document.getElementById('chair').src = "img/concert/" + seatgrade + "석.png";
		document.getElementById('seat').innerHTML = seatgrade;
	});
    
    function submit() {
    	var seatvalue = document.getElementById('seat').innerHTML;
    	
    	if(seatvalue =="" || seatvalue =="좌석을 선택해주세요"){
    		alert("못가");
    	}
    	else{
    		alert("가자");
    	}
	}
  </script>
</html>