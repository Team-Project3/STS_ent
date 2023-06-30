/**
 * 
 */
$(document).ready(function() {
	$('#time').timepicker({
		timeFormat : 'HH:mm',
		interval : 30,
		startTime : '00:00',
		dynamic : false,
		dropdown : true,
		scrollbar : true
	});
});

function a_update_p() {

	if(document.getElementById("tname").value ==""){
		alert("공연명을 입력 해주세요");
		return false;
	} 
	if (document.getElementById("tname").value.includes("<") || document.getElementById("tname").value.includes(">")) {
        alert("'<'와 '>' 문자를 사용할 수 없습니다.");
        return false;
    } 
	if(document.getElementById("place").value ==""){
		alert("공연명을 입력 해주세요");
		return false;
	} 
	if (document.getElementById("place").value.includes("<") || document.getElementById("place").value.includes(">")) {
        alert("'<'와 '>' 문자를 사용할 수 없습니다.");
        return false;
    } 
	if (/\D/.test(document.getElementById("price").value) || /\./.test(document.getElementById("price").value)) {
	    alert("공연가격은 숫자만 입력 가능합니다.");
	    return false;
	}
	if(document.getElementById("price").value < 1000 || document.getElementById("price").value%1000 !== 0){
		alert("공연가격을 1000단위로 해주세요");
		return false;
	}
	
	
	document.getElementById("formm").submit();
}