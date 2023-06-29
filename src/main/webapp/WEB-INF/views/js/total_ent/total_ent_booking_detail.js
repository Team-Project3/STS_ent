var formSubmitted = false;

function bookingdetail() {
	var BookingMain = document.getElementById("BookingMain");
	formSubmitted = true;
	BookingMain.submit();
}

function prevpage(){
	formSubmitted = true;
	history.back();
}

window.addEventListener('beforeunload', function() {
	if (!formSubmitted) {
		window.opener.postMessage('windowClosed', '*');
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