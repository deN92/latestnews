class SubcategoriesController < ApplicationController

	def index
		@categories = Category.where(category_link: params[:category_id])
		if (params[:controller] == "subcategories" && params[:action] = "index")
			unless @categories.first.nil?
				@articles = []
				@articles_last = []
				@categories.each do |c|
					c.subcategories.each do |sc|
						sc.articles.each do |a|
							@articles << a
						end
						@articles = Kaminari.paginate_array(@articles).page(params[:page]).per(10)
						sc.articles.last(1).each do |a|
							@articles_last << a
						end
					end
				end
			else render text: "404"
			end
		end
	end

	def show
		@categories = Category.where(category_link: params[:category_id])
		@articles = []
		@articles_last = @articles
		if (params[:controller] == "subcategories" && params[:action] = "show")
			unless @categories.first.nil?
				@categories.each do |c|
					subcategories = c.subcategories.where(subcategory_link: params[:id])
					unless subcategories.first.nil?	
						subcategories.each do |sc|
							sc.articles.each do |a|
								@articles << a
							end
							@articles = Kaminari.paginate_array(@articles).page(params[:page]).per(10)
						end
					else render text: "404"
					end
				end
				else render text: "404"
			end
		end
	end
end
