var formSubmitted = false;

function goindex() {
	formSubmitted = true;
	window.close();
	window.opener.location.href="index";
}
function gomypage() {
	formSubmitted = true;
	window.close();
	window.opener.location.href="mypage";
}

window.addEventListener('beforeunload', function() {
	if (!formSubmitted) {
		window.opener.postMessage('successClosed', '*');
	}
});

function NotReload(){
    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
        event.keyCode = 0;
        event.cancelBubble = true;
        event.returnValue = false;
    } 
}
document.onkeydown = NotReload;