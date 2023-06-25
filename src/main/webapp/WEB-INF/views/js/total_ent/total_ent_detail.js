function booking() {
	var tseq = document.getElementById("tseq").value;
	var membervo = document.getElementById("id").value;
	var dday = document.getElementById("datePicker").value;
	if (membervo == null || membervo == "") {
		alert("로그인 후 이용해주세요.")
		location.href = 'login_form';
	} else if (dday == "") {
		alert("날짜를 선택해주세요.");
	} else {
		document.body.style.pointerEvents = "none";
		document.body.style.opacity = "0.2";
		
		var url = "total_ent_booking?tseq=" + tseq + "&dday=" + dday;
		window.open(url, "_blank_","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=900, height=700");
		
		 window.addEventListener('message', function(event) {
		      if (event.data === 'windowClosed') {
		        document.body.style.pointerEvents = "auto";
		        document.body.style.opacity = "1";
		        alert("예매가 취소되었습니다.");
		      }
		      else{
		    	  var oseq = event.data;
		    	  
		    	  $.ajax({
		    			type : "POST",
		    			url : 'order_delete',
		    			dataType : "text",
		    			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		    			data : {
		    				oseq : oseq
		    			},
		    			success : function(data) {
		    				if (data == 'success') {
		    					document.body.style.pointerEvents = "auto";
		    			        document.body.style.opacity = "1";
		    			        alert("예매가 취소되었습니다.");
		    				} else {
		    					alert("로그인 후 예매 해 주세요.");
		    					window.opener.location.href="login_form";
		    				}
		    			},
		    			error : function(data) {
		    				if (data.status == 401) {
		    					alert('failed.');

		    					return;
		    				}
		    			}
		    		});
		      }
		    });
		    var openerOrigin = window.location.origin;
		    newWindow.postMessage(openerOrigin, '*');
		  }
}
function validateDate(input) {
	if (input.value === "") {
		alert("Please select a date.");
	}
}
$(document).ready(function(){
	$('body').removeClass('jsOff');
	$('body').addClass('jsOn');
	$('#tabs a').on ('click', function(e){
	$('#tabs a.current').removeClass('current');
	$('.tab-section:visible').hide();
	$(this.hash).show();
	$(this).addClass('current');
	e.preventDefault;
	}).filter(':first').click();
});
