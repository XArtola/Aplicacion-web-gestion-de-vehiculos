$(document).ready(function() {
	$('#colorIcon').click(function() {
		$('.colorOptions').slideDown();
		$('html, body').animate({
			scrollTop : ($('.colorOptions').offset().top - 90)
		}, "slow");
	});
});