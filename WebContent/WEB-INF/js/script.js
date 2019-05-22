$(document).ready(function(){
	$('#formato').click(function(){
		if($(this).html()=="view_module"){
			$(this).html("view_list");
			$(this).parent("a").attr({
				href: 'index.jsp?formato=lista&seleccion='+request.getParameter("seleccion")
			});
		}else{
			$(this).html("view_module");
			$(this).parent("a").attr({
				href: 'index.jsp?formato=modulo&seleccion='+request.getParameter("seleccion")
			});
		}
	});
});