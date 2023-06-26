/**
 * 
 */

function a_updateperformance() {
	location.href = "a_performance_edit?tseq="
			+ document.getElementById("tseq").value;
}
function a_deleteperformance() {
	var tseq = document.getElementById("tseq").value;
	var promptObj = prompt('관리자 비밀번호를 입력하세요.', '');
	$.ajax({
		type : "POST",
		url : 'a_performance_deleteAction',
		dataType : "text",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		data : {
			a_password : promptObj,
			tseq : tseq
		},
		success : function(data) {
			console.log(data);
			if (data == 'fail') {
				alert("비밀번호를 틀렸습니다.");
			} else {
				console.log(data);
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