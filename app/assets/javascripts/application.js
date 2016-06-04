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

	$("#bl_open_search i").click(function(eventObject){
		if($("#bl_search #text_search").css("display") == "none"){
			$("#bl_search #text_search").show(); 
			$("#bl_search #bt_search").show();}
		else{ 
			$("#bl_search #bt_search").hide();
			$("#bl_search #text_search").hide(); }
	});

	var def_search_href = $("#bl_search a").attr("href");
	$("#bl_search #text_search").change(function(eventObject){
		var text_val = $(this).val();
		$("#bl_search a").attr("href", ""+def_search_href + text_val+"");
	}).change();

	$("#bl_search #bt_search").click(function(eventObject){
		if($("#bl_search #text_search").val() == ""){
			alert("Введіть значення для пошуку!");
			return false;
		}
	});

	var main_menu_width = $("nav ul#menu_categories").width();
	var li_length = $("nav ul#menu_categories .categories").length;
	var li_width = 0;
	for(var i = 0; i< li_length; i++){
		li_width += $("nav ul#menu_categories .categories").eq(i).width();
		if(li_width>=main_menu_width-100){
			$("nav ul#menu_categories .categories").eq(i).hide();
		}
	}

	$("#other").click(function(){
		if($("#bl_other").css("display") == "none"){
			$("#bl_other").show();}
		else $("#bl_other").hide();
	});
});