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

function submitUpdate() {
	if (document.getElementById("id").value == "") {
		alert("아이디를 입력하세요.");
		document.getElementById("id").focus();
		return false;
	} else if (document.getElementById("name").value == "") {
		alert("이름을 입력하세요.");
		document.getElementById("name").focus();
		return false;
	} else if (document.getElementById("email").value == "") {
		alert("이메일을 입력하세요.");
		document.getElementById("email").focus();
		return false;
	} else if (document.getElementById("phone").value == "") {
		alert("핸드폰번호를 입력하세요.");
		document.getElementById("phone").focus();
		return false;
	} else {
		var theform = document.getElementById("update");
		alert("회원 정보가 수정되었습니다.");
		theform.action = "mypage_update";
		theform.submit();
	}
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
