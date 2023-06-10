<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function calculateTotal() {
	var ticketPrice = parseInt("${concert.price}");
    var ticketQuantity = parseInt(document.getElementById("head").value);
    var totalPrice = ticketPrice * ticketQuantity;
    var seatOption = document.getElementById("seat");
    var selectedSeat = seatOption.options[seatOption.selectedIndex].value;
    var currentReservation = parseInt("${head}"); // 현재 예약 인원

    // 선택 구역이 S석일 경우
    if (selectedSeat === "S") {
        var availableSeats = 10 - currentReservation; // S석 예약 가능한 자리 수 계산
        if (availableSeats < 0) {
            availableSeats = 0; // 음수 값이면 0으로 설정
        }

        // 선택한 인원이 예약 가능한 자리 수보다 크면 선택한 인원을 예약 가능한 자리 수로 제한
        if (ticketQuantity > availableSeats) {
            alert("S석 예약 가능한 인원은 " + availableSeats + "명까지입니다.");
            document.getElementById("head").value = availableSeats;
            ticketQuantity = availableSeats;
        }
    }
    // 선택 구역이 A석일 경우
    else if (selectedSeat === "A") {
        var availableSeats = 10 - parseInt("${head2}"); // 오후 예약 가능한 자리 수 계산
        if (availableSeats < 0) {
            availableSeats = 0; // 음수 값이면 0으로 설정
        }

        // 선택한 인원이 예약 가능한 자리 수보다 크면 선택한 인원을 예약 가능한 자리 수로 제한
        if (ticketQuantity > availableSeats) {
            alert("A석 예약 가능한 인원은 " + availableSeats + "명까지입니다.");
            document.getElementById("head").value = availableSeats;
            ticketQuantity = availableSeats;
        }
    }
 	// 선택 구역이 B석일 경우
    else if (selectedSeat === "B") {
        var availableSeats = 10 - parseInt("${head3}"); // 오후 예약 가능한 자리 수 계산
        if (availableSeats < 0) {
            availableSeats = 0; // 음수 값이면 0으로 설정
        }

        // 선택한 인원이 예약 가능한 자리 수보다 크면 선택한 인원을 예약 가능한 자리 수로 제한
        if (ticketQuantity > availableSeats) {
            alert("B석 예약 가능한 인원은 " + availableSeats + "명까지입니다.");
            document.getElementById("head").value = availableSeats;
            ticketQuantity = availableSeats;
        }
    }

    totalPrice = ticketPrice * ticketQuantity; // 변경된 인원에 따른 총 가격 계산
    document.getElementById("totalPrice").textContent = totalPrice;
}
</script>
<body>
	<form action="cbooking_detail" method="post" id="concert_booking">
	
		<input type="hidden" name="tseq" value="${concert.tseq }">
		콘서트명 : ${concert.tname }<br>
		
		공연시간 : ${concert.time }<br>
		
		<img id="img" src="img/concert/좌석배치도.png">
		<br>
		<label for="seat">구역 선택&nbsp;&nbsp;</label>
			<select id="seat" name="seat">
					<option value="" selected disabled hidden>구역 선택</option>
					<option value="S">S석</option>
					<option value="A">A석</option>
					<option value="B">B석</option>
			</select>
			
			<br>
			인원 수 : <input type="number" id="head" min="1" max="30" value="1" oninput="calculateTotal()" name="head">명<br>
	
			결제금액 : <span id="totalPrice">${concert.price}</span>원<br>
		
			S석 예약인원 : ${head}<br>
			A석 예약인원 : ${head2}<br>
			B석 예약인원 : ${head3}<br>
		
			<input type="hidden" value="${dday}" name="dday">
			<input type="hidden" value="" name="totalPrice">
			
			<button onclick="history.back()">이전</button>&emsp;&emsp;
			<button onclick="return submitForm()">다음</button>


	</form>



	<script>
	function submitForm() {
		var form = document.getElementById("concert_booking");
	    var totalPriceInput = document.querySelector('input[name="totalPrice"]');
	    var totalPrice = parseInt(document.getElementById("totalPrice").textContent);
	    var head = parseInt(document.getElementById("head").value);
	    var seat = document.getElementById("seat").value;
		    if (document.getElementById("seat").value == "") {
			alert("구역을 선택해주세요");
			document.getElementById("seat").focus();
			return false;
		}
	    
	    // 예약 구역이 S석일 경우
	    if (seat === "S") {
	        var morningReservation = ${head};
	        // 오전 예약인원(morningReservation)이 5명 이상이면 예약할 수 없음
	        if (morningReservation >= 10) {
	            alert("S석 예약 가능한 인원을 초과하였습니다.");
	            return false; // 함수 종료
	        }
	    }
		// 예약 구역이 A석일 경우
	    else if (seat === "A") {
	        var afternoonReservation = ${head2};
	        // 오후 예약인원(afternoonReservation)이 5명 이상이면 예약할 수 없음
	        if (afternoonReservation >= 10) {
	            alert("A석 예약 가능한 인원을 초과하였습니다.");
	            return false; // 함수 종료
	        }
	    }
		// 예약 구역이 B석일 경우
	    else if (seat === "B") {
	        var afternoonReservation = ${head3};
	        // 오후 예약인원(afternoonReservation)이 5명 이상이면 예약할 수 없음
	        if (afternoonReservation >= 10) {
	            alert("B석 예약 가능한 인원을 초과하였습니다.");
	            return false; // 함수 종료
	        }
	    }
	    totalPriceInput.value = totalPrice;
	    headInput.value = head;

	    form.submit();
	}
	</script>

</body>
</html>