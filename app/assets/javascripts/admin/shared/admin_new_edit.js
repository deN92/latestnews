function new_edit(){

	$(document).ready(function() {
		var def_category_id = $("#article_category_id").val();
		var def_category_text = $("#article_category_id option[value="+def_category_id+"]").text();
		var def_subcategory_id = $("#article_subcategory_id optgroup[label="+ def_category_text+"] option:selected").val();

		$("#article_category_id").change(function () {
	    var str = "";
	    $("#article_category_id option:selected").each(function() {
	      str = $(this).text() + " ";
	    });
	    $("#article_subcategory_id optgroup[label="+ str+"]").show();
	    $("#article_subcategory_id optgroup").not("[label="+str+"]").hide();
	    if($(this).val() == def_category_id){
	    	$("#article_subcategory_id optgroup[label="+def_category_text+"] option[value="+def_subcategory_id+"]").attr('selected','selected');
	    }
	    else{
	    	$("#article_subcategory_id optgroup[label="+str+"] option[value=1]").attr('selected','selected');
	    }

	  }).change();

		$(".bbc_news").click(function(eventObject){
			news_tittle = $("#" + $(this).attr("id") + " .bbc_title p").text();
			alert(news_tittle);
			$("#article_tittle").val(news_tittle);
			news_img = $("#" + $(this).attr("id") + " .bbc_img p").text();
			$("#article_main_image").val(news_img);
		});	

		$(".block_xml_content").hide();
		$('#source_xml').change(function(eventObject){
			var sx = $(this).val()
			$(".block_xml_content").hide();
			$("#"+sx+"").show();
		});





	});
};