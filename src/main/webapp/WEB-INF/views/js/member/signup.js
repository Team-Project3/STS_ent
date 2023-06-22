

function idcheck() {
	// ID값 입력 여부 확인
	if (document.getElementById("id").value == "") {
		alert("아이디를 입력해주세요");
		document.getElementById("id").focus();

		return false;
	}

	// 아이디가 입력된 경우 작은 팝업 윈도우 표시
	var url = "id_check_form?id=" + document.getElementById("id").value;
	window.open(url, "_blank_", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=350");
	document.getElementById("password").focus();
}

//생년월일 오늘 일자 기준 이후 날짜 선택불가
function handleDateClick() {
    var birthInput = document.getElementById("birth");
    var nowUtc = Date.now();
    var timeOffset = new Date().getTimezoneOffset() * 60000;
    var today = new Date(nowUtc - timeOffset).toISOString().split("T")[0];
    birthInput.max = today;
}

//회원 가입 시 필수 입력 확인
function go_save() {
	if (document.getElementById("id").value == "") {
		alert("사용자 아이디를 입력해 주세요");
		document.getElementById("id").focus();
		return false;
	} else if (document.getElementById("reid").value == "") {
		alert("아이디 중복체크를 해주세요");
		document.getElementById("reid").focus();
		return false;
	} else if (document.getElementById("password").value == "") {
		alert("비밀번호를 입력해 주세요");
		document.getElementById("password").focus();
		return false;
	} else if (document.getElementById("passwordCheck").value != document.getElementById("password").value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.getElementById("passwordCheck").focus();
		return false;
	} else if (document.getElementById("name").value == "") {
		alert("이름을 입력해 주세요");
		document.getElementById("name").focus();
		return false;

	} else if (document.getElementById("birth").value ==="") {
		alert("생년월일을 입력해 주세요");
		document.getElementById("birth").focus();
		return false;

	} else if (document.getElementById("email").value == "") {
		alert("이메일을 입력해 주세요");
		document.getElementById("email").focus();
		return false;
	} else {
		alert('회원가입이 완료되었습니다.');
		document.getElementById("signup").action = "signup"
		document.getElementById("signup").submit();
	}
}

function check_pwd(){
	var password = document.getElementById('password').value;
	var num = password.search(/[0-9]/g);
	var eng = password.search(/[a-z]/ig);
	var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	if(password.length <= 8 || password.length >= 12){
		alert("비밀번호는 8글자 이상, 12글자 이하만 이용 가능합니다.");
		document.getElementById("password").value = "";
        return false;
	}else if(password.search(/\s/) != -1){
		alert("비밀번호는 공백 없이 입력해주세요.");
		document.getElementById("password").value = "";
		return false;
	}else if(num < 0 || eng < 0 || spe < 0 ){
		alert("영문,숫자,특수문자를 혼합하여 입력해주세요.");
		return false;
	}
    
	if (!passwordCheck.equals(password)){

	alert("비밀번호가 일치하지 않습니다.");
	history.back(-1);
	}

}

function hypenTel(target) {
	  const maxLength = 11; // 최대 글자 수

	  let value = target.value.replace(/[^0-9]/g, ''); // 숫자 이외의 문자 제거
	  value = value.substring(0, maxLength); // 최대 글자 수로 제한

	  target.value = value.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`); // 형식 변환
}



//아이디 찾기 창 띄우기
function find_id_form() {
	var url = "find_id_form";
	
	window.open(url,"_blank_","toolbar=no, menubar=no,scrollbars=yes,width=700,height=450, resizable =no")
}

//이름과 이메일로 아이디 찾기 요청
function findMemberId() {
	if (document.getElementById("name").value=="") {
		alert("이름을 입력해 주세요");
		document.getElementById("name").focus();
		return false;
	} else if (document.getElementById("email").value=="") {
		alert("이메일을 입력해 주세요");
		document.getElementById("email").focus();
		return false;
	} else {
		var form = document.getElementById("findId");
		form.action = "find_id";
		form.submit();
	}
}

//비밀번호 찾기
function findPassword() {
	if (document.getElementById("id2").value=="") {
		alert("아이디를 입력해 주세요");
		document.getElementById("id2").focus();
		return false;
	}else if (document.getElementById("name2").value=="") {
		alert("이름을 입력해 주세요");
		document.getElementById("name2").focus();
		return false;
	} else if (document.getElementById("email2").value=="") {
		alert("이메일을 입력해 주세요");
		document.getElementById("email2").focus();
		return false;
	} else {
		var form = document.getElementById("findPW");
		form.action = "find_pwd";
		form.submit();
	}
}

//비밀번호 찾기 후 새 비밀번호 변경
function changePassword() {
	if (document.getElementById("password").value == "") {
		alert("비밀번호를 입력해 주세요");
		document.getElementById("password").focus();
		return false;
	} else if (document.getElementById("password").value
				!= document.getElementById("pwdcheck").value) {
		alert("비밀번호가 맞지 않습니다.");
		document.getElementById("password").focus();
		return false;
	} else {
		var form = document.getElementById("pwd_form");
		form.action = "change_pwd";
		form.submit();
	}
}