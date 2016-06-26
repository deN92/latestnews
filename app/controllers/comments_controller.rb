class CommentsController < ApplicationController

	before_filter :comment_find, only: [:upvote, :downvote]

	def create
		begin
			Comment.create(comment_params)
			# unless params[:blog_id].nil?
			# 	blog = Blog.find(params[:blog_id])
			# 	blog.update_attribute(:count_comments, blog.count_comments + 1)
			# end
			redirect_to :back
		rescue
			redirect_to :back
		end
	end

	def upvote
		comment = Comment.find(params[:id])
		unless comment.user_id == current_user.id
			unless comment.get_upvotes.voters.map(&:id).include?(current_user.id)
				comment.upvote_from current_user
			else 
				comment.unliked_by current_user
			end
			comment.update_attribute(:count_votes_like, comment.get_upvotes.size)
			comment.update_attribute(:count_votes_dislike, comment.get_downvotes.size)
		end
			render json: {up: comment.get_upvotes.size.to_s, down: comment.get_downvotes.size.to_s}
		
	end

	def downvote
		comment = Comment.find(params[:id])
		unless comment.user_id == current_user.id
			unless comment.get_downvotes.voters.map(&:id).include?(current_user.id)
				comment.downvote_from current_user
			else 
				comment.undisliked_by current_user
			end
			comment.update_attribute(:count_votes_like, comment.get_upvotes.size)
			comment.update_attribute(:count_votes_dislike, comment.get_downvotes.size)
		end
			render json: {up: comment.get_upvotes.size.to_s, down: comment.get_downvotes.size.to_s}
		
	end

	private
		def comment_params
			params.require(:comment).permit(:article_id, :body).merge(user_id: current_user.id, blog_id: params[:blog_id])
		end

		def comment_find
			# comment = Comment.find(params[:id])
		end
end
