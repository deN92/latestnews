class CategoriesController < ApplicationController
	def index
		@articles = Article.all
		@articles_last = []
		Category.order(:id).each do |c|
			c.subcategories.last(1).each do |s|
				s.articles.each do |a|
					@articles_last << a
				end
			end
		end
	end
end