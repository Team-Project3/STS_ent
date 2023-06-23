/**
 * 
 */
$(document).ready(function() {
	$('#time').timepicker({
		timeFormat : 'HH:mm',
		interval : 30,
		startTime : '00:00',
		dynamic : false,
		dropdown : true,
		scrollbar : true
	});
});

function a_update_p() {
	document.getElementById("formm").submit();
}