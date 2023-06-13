<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

    img {
	width: 400px;
    height: 400px;
}
table {
	margin-left: 700px;
	margin-top: -300px;
}
  </style>
  <script>
    function choiceR() {
      document.getElementById('chair').src = "img/concert/R석.png";
      document.getElementById('seat').innerHTML = document.getElementById('Rseat').value; 
    }
    function choiceA() {
    	 document.getElementById('chair').src = "img/concert/A석.png";
    	 document.getElementById('seat').innerHTML = document.getElementById('Aseat').value; 
      }
    function choiceB() {
    	 document.getElementById('chair').src = "img/concert/B석.png";
    	 document.getElementById('seat').innerHTML = document.getElementById('Bseat').value; 
      }
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
<body>
<img src="img/concert/좌석배치도.png" id="chair">
<table>
<tr>
<td>
<button type="button" onclick="choiceR()" id="Rseat" value="R">R석</button>
</td>
</tr>
<tr>
<td>
<button type="button" onclick="choiceA()" id="Aseat" value="A">A석</button>
</td>
</tr>
<tr>
<td>
<button type="button" onclick="choiceB()" id="Bseat" value="B">B석</button>
</td>
<td>
<div class="seat" id="seat">좌석을 선택해주세요</div>
</td>
</tr>
</table>
<button type="button" id="nextButton" onclick="submit()">Next</button>

</body>
</html>