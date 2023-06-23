/**
 * 
 */
//공지사항 수정
function editform() {
	var theform = document.getElementById("updateform");
	alert("공지사항이 수정되었습니다.");
	theform.action = "a_notice_update";
	theform.submit();
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