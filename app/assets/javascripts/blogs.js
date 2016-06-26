$(document).ready(function(){
	var curr_val = $('#blog_category_id').val();
	$('#blog_category_id').click(function(){
			var select_val = $(this).val();
			var url = "?category_id="+select_val
			if (select_val == ""){
				url = "?"+select_val
			}
			if (curr_val != select_val){
				window.location.replace(url);
			}
	});
});