function booking() {
	var tseq = document.getElementById("tseq").value;
	var membervo = document.getElementById("id").value;
	var dday = document.getElementById("dday").value;
	if (membervo == null || membervo == "") {
		alert("로그인 후 이용해주세요.")
		location.href = 'login_form';
	} else if (dday == "") {
		alert("날짜를 선택해주세요.");
	} else {
		var url = "total_ent_booking?tseq=" + tseq + "&dday=" + dday;
		window.open(url, "_blank_","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=900, height=700")
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
