

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
	} else if (document.getElementById("birth").value="") {
		alert("생년월일을 입력해 주세요");
		document.getElementById("birth").focus();
		return false;
	} else if (document.getElementById("email").value == "") {
		alert("이메일을 입력해 주세요");
		document.getElementById("email").focus();
		return false;
	} else {
		document.getElementById("signup").action = "signup";//회원가입 요청
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


