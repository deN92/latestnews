class ArticlesController < ApplicationController
	def show
		begin
			@article = Article.friendly.find(params[:id])
			render text: "404" if @article.category.category_link != params[:category_id]
			@comment_new = Comment.new
		rescue
			render text: "404"
		end
	end
end
