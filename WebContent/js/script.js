$(document).ready(function() {
	$('#colorIcon').click(function() {
		$('.colorOptions').slideDown();
		$('html, body').animate({
			scrollTop : ($('.colorOptions').offset().top - 90)
		}, "slow");
	});
	var expanded =false;
	$('#more').click(function(){
		if(!expanded){
			$('.colorPicker').slideDown(200);
			expanded=true;
		}else if(expanded){
			$('.colorPicker').slideUp(200);
			expanded =false;
		}
	});
});