class SubcategoriesController < ApplicationController

	def index
		@categories = Category.where(category_link: params[:category_id])
		@articles = []
		@articles_last = []
		@categories.each do |c|
			c.subcategories.each do |sc|
				sc.articles.each do |a|
					@articles << a
				end
				sc.articles.last(1).each do |a|
					@articles_last << a
				end
			end
		end
	end

	def show
		@categories = Category.where(category_link: params[:category_id])
		@articles = []
		@articles_last = @articles
		@categories.each do |c|
			c.subcategories.where(subcategory_link: params[:id]).each do |sc|
				sc.articles.each do |a|
					@articles << a
				end
			end
		end
	end
end
