class ArticlesController < ApplicationController
	def show
		begin
			@article = Article.friendly.find(params[:id])
			render text: "404" if @article.category.category_link != params[:category_id]
			@articles_last = []
			Category.order(:id).each do |c|
				c.articles.last(1).each do |a|
					@articles_last << a
				end
			end
			@comment_new = Comment.new
		rescue
			render text: "404"
		end
	end
end
