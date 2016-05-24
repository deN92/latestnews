//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require categories
//= require subcategories
//= require articles
//= require comments
//= require stats



$(document).ready(function(){
	$("nav ul#menu_categories li").mouseover(function(){
		var c_id = $(this).attr("id");
		$("nav ul#menu_categories li ul ." + c_id).show();
	});
	$("nav ul#menu_categories li").mouseout(function(){
		var c_id = $(this).attr("id");
		$("nav ul#menu_categories li ul ." + c_id).hide();
	});

	$("#authentication ul li#in").click(function(eventObject){
		eventObject.preventDefault();
		if ($('#outsidePopup').css("display") === "none"){
			$('#outsidePopup').show();}
		else{
			$('#outsidePopup').hide();}
	});

	$('#blClose').click(function(eventObject){
		$('#outsidePopup').hide();})


	$("#authentication #blCurrentUser").mouseover(function(eventObject){
		$("#authentication #menu_curr_user").show();
		$("#authentication #blCurrentUser a").css("color","black");
	});

	$("#authentication #blCurrentUser").mouseout(function(eventObject){
		$("#authentication #menu_curr_user").hide();
		$("#authentication #blCurrentUser a").css("color","white");
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