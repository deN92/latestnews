class CategoriesController < ApplicationController
	def index
		@articles = Article.order(:id).page(params[:page]).per(20)
		@articles_last = []
		# Category.order(:id).each do |c|
		# 	c.catsubcategories.where().each do |s|
		# 		s.subcategory.articles.each do |a|
		# 			@articles_last << a
		# 		end
		# 	end
		# end
		Category.order(:id).each do |c|
			c.articles.last(1).each do |a|
				@articles_last << a
			end
		end
	end
end