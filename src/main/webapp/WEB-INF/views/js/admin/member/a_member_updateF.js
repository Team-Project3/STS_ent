//회원 수정
function editform() {
	if (document.getElementById("password").value == "") {
		alert("비밀번호를 입력해 주세요");
		document.getElementById("password").focus();
		return false;
	} else if (document.getElementById("name").value == "") {
		alert("이름을 입력해 해주세요");
		document.getElementById("name").focus();
		return false;
	} else if (document.getElementById("phone").value == "") {
		alert("전화번호를 입력해 주세요");
		document.getElementById("phone").focus();
		return false;
	} else if (document.getElementById("email").value == "") {
		alert("이메일을 입력해 주세요");
		document.getElementById("email").focus();
		return false;
	} else {
		var theform = document.getElementById("update");
		alert("회원 정보가 수정되었습니다.");
		theform.action = "a_member_editt";	
		theform.submit();
	}
	
	
}

//전화번호 하이픈 자동 생성
function hypenTel(target) {
	  const maxLength = 11; // 최대 글자 수

	  let value = target.value.replace(/[^0-9]/g, ''); // 숫자 이외의 문자 제거
	  value = value.substring(0, maxLength); // 최대 글자 수로 제한

	  target.value = value.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`); // 형식 변환
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


