class CommentsController < ApplicationController
	def create
		begin
			Comment.create(comment_params)
			redirect_to :back
		rescue => e
			redirect_to :back
		end
	end

	def upvote
		@com = Comment.find(params[:id])
		unless @com.get_upvotes.voters.map(&:id).include?(current_user.id)
			@com.upvote_from current_user
		else @com.unliked_by current_user
		end
		render json: {up: @com.get_upvotes.size.to_s, down: @com.get_downvotes.size.to_s}
	end

	def downvote
		@com = Comment.find(params[:id])
		unless @com.get_downvotes.voters.map(&:id).include?(current_user.id)
			@com.downvote_from current_user
		else @com.undisliked_by current_user	
		end
		render json: {up: @com.get_upvotes.size.to_s, down: @com.get_downvotes.size.to_s}
	end

	private
		def comment_params
			params.require(:comment).permit(:article_id, :body).merge(user_id: current_user.id)
		end
end
