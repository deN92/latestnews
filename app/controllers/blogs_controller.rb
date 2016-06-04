class BlogsController < ApplicationController

	before_filter :blog_find, only: [:show, :edit, :update, :destroy]

	def index
		@blogs = Blog.order(created_at: :desc)
		@blogs = @blogs.where(user_id: params[:user_id]) unless params[:user_id].nil?
	end

	def show
		render_404 unless @blog.user_id.to_s == params[:user_id]
	end

	def new
		if user_signed_in?
			@blog = Blog.new
		else
			render_404
		end
	end

	def edit
		unless current_user && @blog.user_id == current_user.id
			render_404
		end
	end
	
	def create
		if user_signed_in?
			begin
				@blog = Blog.create(blog_params)
				redirect_to user_blog_path(@blog.user_id, @blog.id)
			rescue
				redirect_to :back
			end
		else render_404
		end
	end

	def update
		@blog.update_attributes(blog_params)
		redirect_to user_blog_path(@blog.user_id, @blog.id)
	end

	def destroy
		@blog.destroy
		redirect_to blogs_path
	end

	private
		def blog_params
			params.require(:blog).permit(:category_id, :post_title, :post_theme, :post_body).merge(user_id: current_user.id)
		end

		def blog_find
			begin
				@blog = Blog.find(params[:id]) 
			rescue
				render_404
			end
		end
end
