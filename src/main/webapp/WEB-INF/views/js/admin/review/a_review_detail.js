function reviewdelete(rseq) {
	if (confirm("해당 후기글을 삭제하시겠습니까?")) {
		alert("삭제되었습니다.");
        location.href = "a_review_delete?rseq=" + rseq;
    }
}