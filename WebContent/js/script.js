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
	switch(getUrlVars()["seleccion"]){
		case "vehiculos":
			$('#vehiculos').addClass('seleccionado');
			break;
		case "coches":
			$('#coches').addClass('seleccionado');
			break;
		case "camiones":
			$('#camiones').addClass('seleccionado');
			break;
	}
});

function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}