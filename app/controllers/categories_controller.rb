class CategoriesController < ApplicationController
	def index
		@articles = Article
		@articles = Article.search_articles(@articles, params[:search_article]) 
		@articles = Article.select_region(@articles, params[:region_id]) unless params[:region_id].nil?
		@articles = @articles.order("created_at DESC").page(params[:page])
		@articles_last = Article.articles_last
		@articles_comments = Article.order("count_comments DESC").limit(5)
	end
end