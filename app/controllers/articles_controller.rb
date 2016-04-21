class ArticlesController < ApplicationController
	def show
		@article = Article.friendly.find(params[:id])
		@comment_new = Comment.new
	end
end
