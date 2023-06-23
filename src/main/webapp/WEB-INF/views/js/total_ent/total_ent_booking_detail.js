function bookingdetail() {
	var BookingMain = document.getElementById("BookingMain");
	BookingMain.submit();
}

window.opener.document.body.style.pointerEvents = "none";
window.opener.document.body.style.opacity = "0.2";

window.addEventListener('onbeforeunload ', function() {
	  // Send a message to the opener window indicating that it is being closed
	  window.opener.postMessage('windowClosed', '*');
	});