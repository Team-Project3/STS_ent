//회원 수정
function editform() {
	var theform = document.getElementById("update");
	alert("회원 정보가 수정되었습니다.");
	theform.action = "a_member_editt";
	theform.submit();
}

// 회원 삭제
function deleteform() {
	var id = document.getElementById("id").value;
	var promptObj = prompt('관리자 비밀번호를 입력하세요.', '');
	$.ajax({
		type : "POST",
		url : 'a_member_delete',
		data : {
			a_password : promptObj,
			id : id
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
