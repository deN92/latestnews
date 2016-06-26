class UsersController < ApplicationController

	def index
	end

	def show
		begin
			@user = User.find(params[:id])
			@user_posts = User.where.not(count_posts: 0).order("count_posts desc")
		rescue
			render_404
		end
	end

	def edit
		unless current_user 
			render_404
		else 
			@user = User.find(current_user.id)
		end
	end

	def update
		if current_user
			@user = User.find(current_user.id)
			begin
				@user.update_attributes(user_params)
				redirect_to user_path(@user)
			rescue
				redirect_to :back
			end
		else
			render_404
		end
	end

	private
		def user_params
			params.require(:user).permit(:email, :surname, :name, :photo, :birthday, :city).merge(id: current_user.id)
		end
end
