var formSubmitted = false;

function bookingdetail() {
	var BookingMain = document.getElementById("BookingMain");
	formSubmitted = true;
	BookingMain.submit();
}

window.addEventListener('beforeunload', function() {
	if (!formSubmitted) {
		window.opener.postMessage('windowClosed', '*');
	}
});
