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
