class SubcategoriesController < ApplicationController

	before_filter :current_categories, only: [:index, :show]

	def index
		if (params[:controller] == "subcategories" && params[:action] = "index")
			unless @categories.first.nil?
				@categories.each do |c|
					c.catsubcategories.each do |sc|
						subcategories = Article.curr_subcat(sc, @categories.first.id)
						subcategories = Article.select_region(subcategories, params[:region_id]) unless params[:region_id].nil?
						subcategories.each do |s|
							@articles << s
							@articles_comments << s
						end
						subcategories.last(1).each do |sl|
							@articles_last << sl
						end
					end
				end
					@articles = Article.search_articles_a(@articles, params[:search_article])
					@articles_comments = Article.sort_comments(@articles_comments)
					@articles = Kaminari.paginate_array(@articles).page(params[:page]).per(15)
			else render_404
			end
		end
	end

	def show
		@subcategory = Array.new
		if (params[:controller] == "subcategories" && params[:action] = "show")
			unless @categories.first.nil?
				@categories.each do |c|
					c.subcategories.each do |s|
						@subcategory << s
					end
					subcategories = Subcategory.subcategory_link(c, params[:id])
					unless subcategories.first.nil?	
						subcategories.each do |sc|
							@articles = Article.articles(sc, params[:region_id], @articles, c.id)
							@articles_last = @articles
							@articles_comments = Article.sort_comments(@articles)
							@articles = Article.search_articles_a(@articles, params[:search_article])
							@articles = Kaminari.paginate_array(@articles).page(params[:page]).per(10)
						end
					else render_404
					end
				end
				else render_404
			end
		end
	end

	private
		def current_categories
			@categories = Category.curr_cat(params[:category_id])
			@articles = Array.new
			@articles_last = Array.new
			@articles_comments = Array.new
		end
end
