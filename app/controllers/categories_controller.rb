class CategoriesController < ApplicationController
	def index
		@articles = Article.order(:id).page(params[:page]).per(20)
		@articles_last = []
		Category.order(:id).each do |c|
			c.articles.last(1).each do |a|
				@articles_last << a
			end
		end
		@articles_comments = Article.order("count_comments DESC").limit(5)
	end
end