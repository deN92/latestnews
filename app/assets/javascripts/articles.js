$(document).ready(function(){

	function vote_count(btn_ld, ld){
		$(btn_ld).click(function(){
			var vote_id = $(this).attr("data-vote_id");
			$.ajax({
				url: "/comments/"+ vote_id +"/"+ld+"",
				type: "POST",
				data: { _method:'PUT'},
				success: function(result){
					$("#like_count-"+vote_id+"").text(result.up);
					$("#dislike_count-"+vote_id+"").text(result.down);
				}
			});
		});
	}
	vote_count(".btn-like","like");
	vote_count(".btn-dislike","dislike");

});