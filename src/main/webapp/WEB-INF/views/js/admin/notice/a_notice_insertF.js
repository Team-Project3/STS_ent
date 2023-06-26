/**
 * 
 */
//공지사항 등록
function insertform() {
	if (document.getElementById("title").value == "") {
		alert("제목을 입력해 주세요");
		document.getElementById("title").focus();
		return false;
	} else if (document.getElementById("ncontent").value == "") {
		alert("내용을 입력해 해주세요");
		document.getElementById("ncontent").focus();
		return false;
	} else {
		var theform = document.getElementById("insertform");
		alert("공지사항이 등록되었습니다.");
		theform.action = "a_notice_insert";
		theform.submit();
	}
}
