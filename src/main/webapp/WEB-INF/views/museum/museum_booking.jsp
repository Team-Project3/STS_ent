<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
var am = ${am};
var pm = ${pm};
	
function calculateTotal() {
	var ticketPrice = parseInt("${museum.price}");
    var ticketQuantity = parseInt(document.getElementById("head").value);
    var totalPrice = ticketPrice * ticketQuantity;
    var seatOption = document.getElementById("seat");
    var selectedSeat = seatOption.options[seatOption.selectedIndex].value;
    var currentReservation = parseInt("${head}"); // 현재 예약 인원

    // 예약 시간이 오전인 경우
    if (selectedSeat === "오전") {
        var availableSeats = am - currentReservation; // 오전 예약 가능한 자리 수 계산
        if (availableSeats < 0) {
            availableSeats = 0; // 음수 값이면 0으로 설정
        }

        // 선택한 인원이 예약 가능한 자리 수보다 크면 선택한 인원을 예약 가능한 자리 수로 제한
        if (ticketQuantity > availableSeats) {
            alert("오전 예약 가능한 인원은 " + availableSeats + "명까지입니다.");
            document.getElementById("head").value = availableSeats;
            ticketQuantity = availableSeats;
        }
    }
    // 예약 시간이 오후인 경우
    else if (selectedSeat === "오후") {
        var availableSeats = pm - parseInt("${head2}"); // 오후 예약 가능한 자리 수 계산
        if (availableSeats < 0) {
            availableSeats = 0; // 음수 값이면 0으로 설정
        }

        // 선택한 인원이 예약 가능한 자리 수보다 크면 선택한 인원을 예약 가능한 자리 수로 제한
        if (ticketQuantity > availableSeats) {
            alert("오후 예약 가능한 인원은 " + availableSeats + "명까지입니다.");
            document.getElementById("head").value = availableSeats;
            ticketQuantity = availableSeats;
        }
    }

    totalPrice = ticketPrice * ticketQuantity; // 변경된 인원에 따른 총 가격 계산
    document.getElementById("totalPrice").textContent = totalPrice;
}
function submitForm() {
	var form = document.getElementById("museum_booking");
    var totalPriceInput = document.querySelector('input[name="totalPrice"]');
    var totalPrice = parseInt(document.getElementById("totalPrice").textContent);
    var head = parseInt(document.getElementById("head").value);
    var seat = document.getElementById("seat").value;
    var morningReservation = ${head};
    var afternoonReservation = ${head2};
    var mseat=morningReservation + head;
    var aseat=afternoonReservation + head;
    if (document.getElementById("seat").value == "") {
		alert("시간대를 선택해주세요");
		document.getElementById("seat").focus();
		return false;
	}
    else if (seat == "오전" && mseat > am) {
    	alert("오전 예약 가능한 인원을 초과하였습니다. "+"(잔여석 :"+(am-morningReservation)+" 석)");
        return false; // 함수 종료
    }
    // 예약 시간이 오후인 경우
    else if (seat == "오후" && aseat > pm) {
        alert('오후 예약 가능한 인원을 초과하였습니다. (잔여석 :' + (pm-afternoonReservation) +' 석)');
        return false; // 함수 종료
    }
    else if(head == 0){
    	alert("좌석을 선택해주세요");
    }
    else{
   		totalPriceInput.value = totalPrice;
    	form.submit();
    }    
}
</script>
<body>
	<form action="mbooking_detail" method="post" id="museum_booking" onsubmit="return false;">
	
		<input type="hidden" name="tseq" value="${museum.tseq}">
		전시회 제목: ${museum.tname}<br>
	
		<img id="img" src="img/museum/${museum.pimg}.jpg" style="width:400px; height:450px;"><br>
		선택 날짜 : ${dday}<br>
		
		<label for="seat">시간 선택&nbsp;:&nbsp;</label>
				<select id="seat" name="seat">
					<option value="" selected disabled hidden>시간 선택</option>
					<option value="오전">오전</option>
					<option value="오후">오후</option>
				</select>
		<br>
		인원 수 : <input type="number" id="head" min="1" value="1" oninput="calculateTotal()" name="head">매<br>
	
		결제금액 : <span id="totalPrice">${museum.price}</span>원<br>
		
		오전 예약인원 : ${head}<br>
		오후 예약인원 : ${head2}<br>
	
		<input type="hidden" value="${dday}" name="dday">
		<input type="hidden" value="" name="totalPrice">
		
		<button onclick="history.back()">이전</button>&emsp;&emsp;
		<button onclick="return submitForm()">다음</button>	
	</form>

</body>
</html>