var am = document.getElementById("am").value;
var pm = document.getElementById("pm").value;
	
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
    var head = parseInt(document.getElementById("headvalue").value);
    var headtrimm = document.getElementById("headvalue").value;
    var seat = document.getElementById("seat").value;
    var morningReservation = document.getElementById("head1").value;
    var afternoonReservation = document.getElementById("head2").value;
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
		var headtrim = headtrimm.trim();
		
		headtrim = headtrim.replace(/^0+/, '');
		
		var headinput = document.createElement('input');
		headinput.setAttribute("type", "hidden");
		headinput.setAttribute("name", "head");
		headinput.setAttribute("value", headtrim);
		
		form.appendChild(headinput);
		
   		totalPriceInput.value = totalPrice;
    	form.submit();
    }    
}
window.addEventListener('beforeunload', function() {
	  // Send a message to the opener window indicating that it is being closed
	  window.opener.postMessage('windowClosed', '*');
	});