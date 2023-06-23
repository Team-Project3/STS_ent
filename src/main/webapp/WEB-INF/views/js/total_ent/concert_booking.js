  $('.seatbutton').on('click', function(e) {
		
	  //기존의 클릭한 애들의 클래스를 원상복구
	  	var clickButtons = document.getElementsByClassName('clickbutton');
	  	var seatheads = document.getElementsByClassName('seathead');
	  	for (var i = 0; i < clickButtons.length; i++) {
	    	clickButtons[i].className = 'seatbutton';
	 	}
	  	for (var i = 0; i < seatheads.length; i++) {
	  		seatheads[i].type = 'hidden';
	  		seatheads[i].value = '';
	 	}
	  	//금액 0으로 설정 초기화
	  	document.getElementById('totalprice').innerHTML ='0';
	  	
	  	//클릭한 버튼의 클래스 변경
	  	e.target.className = 'clickbutton'; 
	  	//클릭한 좌석의 등급 가져오기
	  	var seatgrade = e.target.value;
	  	
	  	//클릭한 곳에 좌석 수 창 생성
	  	document.getElementById(seatgrade+'seathead').type = "number";
	  	//클릭한 좌석에 따른 이미지 변경
		document.getElementById('chair').src = "img/concert/" + seatgrade + "석.png";
	  	//밑에 등급 표시
		document.getElementById('seat').innerHTML = seatgrade;
	});
  
  //input number 가 활성화 되었을때의 함수
  $('.seathead').on('input', function(e){
	  //숫자 높일때마다의 값을 가져옴
	  var clickhead = parseInt($(this).val());
	  //좌석 등급 가져오기
	  var seatgrade = document.getElementById('seat').innerHTML;
	  //등급에 따른 좌석 가져오기
	  var price = document.getElementById(seatgrade+'price').value;
	  //총 가격 표시
	  totalAmount =  clickhead * price;
	  document.getElementById('totalprice').innerHTML = totalAmount;
  	});
  
  
    function submit() {
    	//밑에 표시된 등급의 값 가져오기
    	var seatvalue = document.getElementById('seat').innerHTML;
    	if(seatvalue =="" || seatvalue =="좌석을 선택해주세요"){
    		alert("좌석을 선택해주세요");
    		return false;
    	}else{
    	//인원 수 가져오기
    	var seathead = document.getElementById(seatvalue+"seathead").value;
    	//잔여 석 가져오기
    	var maxhead =  document.getElementById(seatvalue).value;
    	//submit 판단
    	if(seatvalue =="" || seatvalue =="좌석을 선택해주세요"){
    		alert("좌석을 선택해주세요");
    		return false;
    	}
    	else if(seathead < 1){
    		alert("인원을 선택해주세요");
    		return false;
    	}
    	else if(parseInt(seathead) > parseInt(maxhead)){
    		alert("최대 예약 할수있는 좌석은"+maxhead+" 석 입니다.");
    		return false;
    	}
    	else{
    		
    		var seattrim = seathead.trim();
    		
    		seattrim = seattrim.replace(/^0+/, '');
    		
    		var seat = document.createElement('input');
    		seat.setAttribute("type", "hidden");
    		seat.setAttribute("name", "seat");
    		seat.setAttribute("value", seatvalue);
    		
    		var head = document.createElement('input');
    		head.setAttribute("type", "hidden");
    		head.setAttribute("name", "head");
    		head.setAttribute("value", seattrim);

    		var form = document.getElementById("total_ent_booking");
    		form.appendChild(seat);
    		form.appendChild(head);
    		
    		form.submit();
    		}
    	}
	}
    window.addEventListener('beforeunload', function() {
  	  // Send a message to the opener window indicating that it is being closed
  	  window.opener.postMessage('windowClosed', '*');
  	});