//회원 탈퇴
function submitForm() {
	var pw = document.getElementById("pw").value;
	var password = document.getElementById("password").value;
	console.log(pw);
	console.log(password);

	if (password == "") {
		alert("비밀번호를 입력하세요.");
		document.getElementById("password").focus();
		return false;
	} else if (pw !== password) {
		alert("비밀번호가 일치하지 않습니다.");
		document.getElementById("password").focus();
		return false;
	} else {
		alert('탈퇴 처리가 완료되었습니다.\n감사합니다.');
		window.close();
		window.opener.location.href = 'mypage_delete';
	}
}

//회원 수정
function submitUpdate() {
	var email = document.getElementById("email").value;
    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    
    var password = document.getElementById('password').value;
	var num = password.search(/[0-9]/g);
	var eng = password.search(/[a-z]/ig);
	var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
    var phone = document.getElementById("phone").value;
    var phonePattern = /^[\d-]+$/;
	
	if (document.getElementById("name").value == "") {
		alert("이름을 입력하세요.");
		document.getElementById("name").focus();
		return false;
	} else if(password.length <= 8 || password.length >= 12){
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
	} else if (document.getElementById("email").value == "") {
		alert("이메일을 입력하세요.");
		document.getElementById("email").focus();
		return false;
	} else if(!emailPattern.test(email)) {
		alert("이메일을 다시 입력해주세요.");
	    document.getElementById("email").focus();
	    return false;
	} else if (document.getElementById("phone").value == "") {
		alert("핸드폰번호를 입력하세요.");
		document.getElementById("phone").focus();
		return false;
	} else if(phone.length < 13 || phone.length > 14) {
		alert("전화번호를 다시 입력해주세요.");
		phone.focus();
		return false;
	} else if (!phonePattern.test(phone)) {
	    alert("전화번호는 숫자만 입력해주세요.");
	    phone.focus();
	    return false;
	} else {
		var theform = document.getElementById("update");
		alert("회원 정보가 수정되었습니다.");
		theform.action = "mypage_update";
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

//회원 수정 페이지 이동
function editMember() {
	window.location.href = "mypage_updateF";
}

//회원 탈퇴 페이지 이동
function deleteMember() {
    var membervo = document.getElementById("id").value;
    var concertElement = document.getElementById("concert");
    var theaterElement = document.getElementById("theater");
    var exhibitionElement = document.getElementById("exhibition");
    var concertlist = concertElement ? concertElement.value : "";
    var theaterlist = theaterElement ? theaterElement.value : "";
    var exhibitionlist = exhibitionElement ? exhibitionElement.value : "";

    if (concertlist !== "" || theaterlist !== "" || exhibitionlist !== "") {
        if (confirm("회원님의 예약 내역이 존재합니다.\n환불 처리가 안되오니 신중하게 생각해")) {
            var url = "mypage_deleteF?membervo=" + membervo;
            window.open(url, "_blank_",
                "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=700");
        }
    } else {
        if (confirm("정말로 탈퇴하시겠습니까?")) {
            var url = "mypage_deleteF?membervo=" + membervo;
            window.open(url, "_blank_",
                "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=700");
        }
    }
}

//리뷰 삭제
function deleteReview(rseq) {
	if(confirm("리뷰를 삭제하시겠습니까?")) {
		location.href="reviewDelete?rseq="+rseq;
	}
}

//예약 삭제
function deleteReservation(bseq) {
	if(confirm("환불 서비스를 지원하지 않습니다.\n해당 예매 내역을 삭제하시겠습니까?")) {
		location.href="reservationDelete?bseq="+bseq;
	}
}
