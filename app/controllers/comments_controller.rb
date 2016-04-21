class CommentsController < ApplicationController
	def create
		begin
			Comment.create(comment_params)
			redirect_to :back
		rescue => e
			redirect_to :back
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:article_id, :body).merge(user_id: current_user.id)
		end
end
