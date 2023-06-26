/**
 * 
 */
function a_updatebooking() {
	if (confirm("결제상태를 변경할까요??") == true) { // 확인
		document.getElementById("formm").submit();
	} else { // 취소
		return false;
	}
}
function a_deletebooking() {
	var bseq = document.getElementById("bseq").value;
	var promptObj = prompt('관리자 비밀번호를 입력하세요.', '');
	$.ajax({
		type : "POST",
		url : 'a_performance_booking_delete',
		dataType : "text",
		data : {
			a_password : promptObj,
			bseq : bseq
		},
		success : function(data) {
			if (data == 'fail') {
				alert("비밀번호를 틀렸습니다.");
			} else {
				document.write(data);
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