function idcheck() {
	// ID값 입력 여부 확인
	var id = document.getElementById("id").value;
	var num = id.search(/[0-9]/g);
	var eng = id.search(/[a-z]/ig);
	var spe = id.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	if (id.length < 5 || id.length >= 12) {
		alert("아이디는 5글자 이상, 12글자 이하만 이용 가능합니다.");
		return false;
	} else if (id.search(/\s/) != -1) {
		alert("아이디는 공백 없이 입력해주세요.");
		return false;
	} else if (num < 0 || eng < 0) {
		alert("영문 및 숫자를 혼합하여 입력해주세요.");
		return false;
	}

	if (id == "") {
		alert("아이디를 입력해주세요");
		id.focus();
		return false;
	}

	// 아이디가 입력된 경우 작은 팝업 윈도우 표시
	var url = "id_check_form?id=" + id;
	window
			.open(url, "_blank_",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=350");
	document.getElementById("password").focus();
}

// 생년월일 오늘 일자 기준 이후 날짜 선택불가
function handleDateClick() {
	var birthInput = document.getElementById("birth");
	var nowUtc = Date.now();
	var timeOffset = new Date().getTimezoneOffset() * 60000;
	var today = new Date(nowUtc - timeOffset).toISOString().split("T")[0];
	birthInput.max = today;
}

// 중복 체크 버튼을 클릭할 때 중복 체크 여부를 확인하고, 체크되지 않았다면 알림창 띄우기
function checkDuplicate() {
	if (document.getElementById("reid").value == "") {
		alert("아이디 중복체크를 해주시기 바랍니다.");
		return false;
	} else {
		go_save1();
	}
}

function go_save1() {
var email=document.getElementById("email").value;
	
	$.ajax({
		type : "POST",
		url : 'emailcheck',
		dataType : "text",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		data : {
			email : email
		},
		success : function(data) {
			if (data == 'fail') {
				alert('이미 가입한 회원의 이메일입니다');
				return false;
			} else {
				go_save();
			}
		},
		error : function(data) {
			if (data.status == 401) {
				alert('failed.');

				return false;
			}
		}
	});
}
// 회원 가입 시 필수 입력 확인
function go_save() {
	
	var email = document.getElementById("email").value;
	var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	var phone = document.getElementById("phone").value;
	var phonePattern = /^[\d-]+$/;
	
	if (document.getElementById("id").value == "") {
		alert("사용자 아이디를 입력해 주세요");
		document.getElementById("id").focus();
		return false;
	}
	if (document.getElementById("reid").value == "") {
		alert("아이디 중복체크를 해주세요");
		document.getElementById("reid").focus();
		return false;
	}
	if (document.getElementById("password").value == "") {
		alert("비밀번호를 입력해 주세요");
		document.getElementById("password").focus();
		return false;
	}
	if (document.getElementById("passwordCheck").value != document
			.getElementById("password").value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.getElementById("passwordCheck").focus();
		return false;
	}
	if (document.getElementById("password").value.length < 8 || document.getElementById("password").value.length > 12) {
		alert("비밀번호는 8글자 이상, 12글자 이하만 이용 가능합니다.");
		document.getElementById("password").value = "";
		return false;
	}
	
	if (document.getElementById("name").value == "") {
		alert("이름을 입력해 주세요");
		document.getElementById("name").focus();
		return false;
	}
	if (document.getElementById("birth").value === "") {
		alert("생년월일을 입력해 주세요");
		document.getElementById("birth").focus();
		return false;
	}
	if (document.getElementById("email").value == "") {
		alert("이메일을 입력해 주세요");
		document.getElementById("email").focus();
		return false;
	}
	if (!emailPattern.test(email)) {
		alert("이메일을 다시 입력해주세요.");
		document.getElementById("email").focus();
		return false;
	}
	if (document.getElementById("phone").value == "") {
		alert("전화번호를 입력해 주세요");
		document.getElementById("phone").focus();
		return false;
	}
	if (phone.length < 13 || phone.length > 14) {
		alert("전화번호를 다시 입력해주세요.");
		phone.focus();
		return false;
	}
	if (!phonePattern.test(phone)) {
		alert("전화번호는 숫자만 입력해주세요.");
		phone.focus();
		return false;
	}
	alert('회원가입이 완료되었습니다.');
	document.getElementById("signup").action = "signup"
	document.getElementById("signup").submit();

}

// 비밀번호 체크
function check_pwd() {
	var password = document.getElementById('password').value;
	var num = password.search(/[0-9]/g);
	var eng = password.search(/[a-z]/ig);
	var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	if (password.length <= 8 || password.length >= 12) {
		alert("비밀번호는 8글자 이상, 12글자 이하만 이용 가능합니다.");
		document.getElementById("password").value = "";

        return false;
	} else if(password.search(/\s/) != -1){
		alert("비밀번호는 공백 없이 입력해주세요.");
		document.getElementById("password").value = "";
		return false;

	} else if(num < 0 || eng < 0 || spe < 0 ){
		alert("영문,숫자,특수문자를 혼합하여 입력해주세요.");
		return false;
	}

	if (!passwordCheck.equals(password)) {

		alert("비밀번호가 일치하지 않습니다.");
		history.back(-1);
	}

}

// 전화번호 하이픈 자동 생성
function hypenTel(target) {
	const maxLength = 11; // 최대 글자 수

	let value = target.value.replace(/[^0-9]/g, '');
	value = value.substring(0, maxLength);

	target.value = value.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}

// 아이디 찾기 창 띄우기
function find_id_form() {
	var url = "find_id_form";

	window
			.open(url, "_blank_",
					"toolbar=no, menubar=no,scrollbars=yes,width=700,height=450, resizable =no")
}

// 이름과 이메일로 아이디 찾기 요청
function findMemberId() {
	if (document.getElementById("name").value == "") {
		alert("이름을 입력해 주세요");
		document.getElementById("name").focus();
		return false;
	} else if (document.getElementById("email").value == "") {
		alert("이메일을 입력해 주세요");
		document.getElementById("email").focus();
		return false;
	} else {
		var form = document.getElementById("findId");
		form.action = "find_id";
		form.submit();
	}
}

// 비밀번호 찾기
function findPassword() {
	if (document.getElementById("id2").value == "") {
		alert("아이디를 입력해 주세요");
		document.getElementById("id2").focus();
		return false;
	} else if (document.getElementById("name2").value == "") {
		alert("이름을 입력해 주세요");
		document.getElementById("name2").focus();
		return false;
	} else if (document.getElementById("email2").value == "") {
		alert("이메일을 입력해 주세요");
		document.getElementById("email2").focus();
		return false;
	} else {
		var form = document.getElementById("findPW");
		form.action = "find_pwd";
		form.submit();
	}
}

// 비밀번호 찾기 후 새 비밀번호 변경
function changePassword() {
	var password = document.getElementById("password").value;
	var num = password.search(/[0-9]/g);
	var eng = password.search(/[a-z]/ig);
	var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	if(password.length <= 8 || password.length >= 12){
		alert("비밀번호는 8글자 이상, 12글자 이하만 이용 가능합니다.");
		document.getElementById("password").value = "";
        return false;
	} else if(password.search(/\s/) != -1){
		alert("비밀번호는 공백 없이 입력해주세요.");
		document.getElementById("password").value = "";
		return false;
	} else if(num < 0 || eng < 0 || spe < 0 ){
		alert("영문,숫자,특수문자를 혼합하여 입력해주세요.");
		return false;
	} else if (document.getElementById("password").value == "") {
		alert("비밀번호를 입력해 주세요");
		document.getElementById("password").focus();
		return false;
	} else if(document.getElementById("password").value
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

function updateIdInput(value) {
	var idInput = document.getElementById("id");
	idInput.value = value;
	idInput.readOnly = true;
}

function idok() {
	var openerForm = window.opener.document.forms["go_signup"];
	var id = document.getElementById("id").value;

	openerForm.id.value = id;
	openerForm.reid.value = id;
	window.opener.updateIdInput(id);
	self.close();
}

const naverLogin = new naver.LoginWithNaverId({
	clientId : "IK04q9z9rJMeoi3tE_bf",
	callbackUrl : "http://192.168.0.70:8506/biz/naverlogin",
	loginButton : {
		color : "green",
		type : 3,
		height : 50,
		width : 120
	}
});
naverLogin.init();

$(document).on("click", "#naverLogin", function() {
	var naverLogin = document.getElementById("naverIdLogin").firstChild;
	naverLogin.click();
});

Kakao.init('e6642bc88fd411b12f3c678d2f563941'); // 사용하려는 앱의 JavaScript 키 입력

function loginWithKakao() {
	Kakao.Auth.authorize({
		redirectUri : 'http://localhost:8506/biz/kakaologin',
	});
}


function init() {
	gapi
			.load(
					'auth2',
					function() {
						gapi.auth2.init();
						options = new gapi.auth2.SigninOptionsBuilder();
						options.setPrompt('select_account');
						// 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
						options
								.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
						// 인스턴스의 함수 호출 - element에 로그인 기능 추가
						// GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
						gapi.auth2.getAuthInstance().attachClickHandler(
								'GgCustomLogin', options, onSignIn,
								onSignInFailure);
					})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
		// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url : 'https://people.googleapis.com/v1/people/me'
		// key에 자신의 API 키를 넣습니다.
		,
		data : {
			personFields : 'birthdays',
			key : 'AIzaSyDszcgM8PSJDCIbKJ_kYzkSRiOOxLwW3wg',
			'access_token' : access_token
		},
		method : 'GET'
	}).done(function(e) {
		//프로필을 가져온다.
		var profile = googleUser.getBasicProfile();
		console.log(profile)
	}).fail(function(e) {
		console.log(e);
	})
}
function onSignInFailure(t) {
	console.log(t);
}