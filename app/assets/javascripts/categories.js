$(document).ready(function(){
	var img_count = $("#slider_main_images .main_image").length;
	$("#slider_main_images .main_image").not(".main_image:first-of-type").hide();

	function slider(elem){
		var img_v = $("#slider_main_images .main_image:visible");
		var img_index_v = img_v.index();
		if (img_index_v == img_count-1){
			img_index_v = -1;}
		img_v.hide();
		$("#slider_main_images .main_image").eq(img_index_v + (elem)).fadeIn("slow");
	}

	$("#main_image_next").click(function(){
		slider(1);
	});

	$("#main_image_back").click(function(){
		slider(-1);
	});
});