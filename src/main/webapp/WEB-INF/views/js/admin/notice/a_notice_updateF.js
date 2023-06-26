/**
 * 
 */
//공지사항 수정
function editform() {
	if (document.getElementById("title").value == "") {
		alert("제목을 입력해 주세요");
		document.getElementById("title").focus();
		return false;
	} else if (document.getElementById("ncontent").value == "") {
		alert("내용을 입력해 해주세요");
		document.getElementById("ncontent").focus();
		return false;
	} else {
		var theform = document.getElementById("updateform");
		alert("공지사항이 수정되었습니다.");
		theform.action = "a_notice_update";
		theform.submit();
	}
}

//공지사항 삭제 페이지 이동
function deleteform() {
	if (confirm("공지사항을 삭제하시겠습니까?")) {
		var form = document.getElementById("updateform");
		alert("삭제되었습니다.");
        form.action = "a_notice_delete";
        form.submit(); 
    }
}