//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .
$(document).ready(function(){
	$("nav ul#menu_categories li").mouseover(function(){
		var c_id = $(this).attr("id");
		$("nav ul#menu_categories li ul ." + c_id).show();
	});
	$("nav ul#menu_categories li").mouseout(function(){
		var c_id = $(this).attr("id");
		$("nav ul#menu_categories li ul ." + c_id).hide();
	});

	var main_menu_width = $("nav ul#menu_categories").width();
	var li_length = $("nav ul#menu_categories .categories").length;
	var li_width = 0;
	for(var i = 0; i< li_length; i++){
		li_width += $("nav ul#menu_categories .categories").eq(i).width();
		if(li_width>=main_menu_width){
			$("nav ul#menu_categories .categories").eq(i).hide();
		}
	}

	$("#other").click(function(){
		if($("#bl_other").css("display") == "none"){
			$("#bl_other").show();}
		else $("#bl_other").hide();
	});
});