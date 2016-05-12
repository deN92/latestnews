class SubcategoriesController < ApplicationController

	def index
		@categories = Category.where(category_link: params[:category_id])
		if (params[:controller] == "subcategories" && params[:action] = "index")
			unless @categories.first.nil?
				@articles = []
				@articles_last = []
				@articles_comments = []

				@categories.each do |c|
					c.catsubcategories.each do |sc|
						subcategory = sc.subcategory.articles.where(category_id: @categories.first.id)
						subcategory.each do |s|
							@articles << s
							@articles_comments << s
							@articles_comments = @articles_comments.sort_by{|ac| ac["count_comments DESC"]}.take(5)
						end
						subcategory.last(1).each do |sl|
							@articles_last << sl
						end
					end
					@articles = Kaminari.paginate_array(@articles).page(params[:page]).per(10)
				end

			else render text: "404"
			end
		end
	end

	def show
		@categories = Category.where(category_link: params[:category_id])
		@articles = []
		@articles_last = []
		@articles_comments = []
		if (params[:controller] == "subcategories" && params[:action] = "show")
			unless @categories.first.nil?
				@categories.each do |c|
					subcategories = c.subcategories.where(subcategory_link: params[:id])
					unless subcategories.first.nil?	
						subcategories.each do |sc|
							sc.articles.each do |a|
								@articles << a
								@articles_last << a
								@articles_comments = @articles.sort_by{|ac| ac["count_comments DESC"]}.take(5)
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
