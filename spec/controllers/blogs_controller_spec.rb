require "rails_helper"
require "spec_helper"

module SumMacro
	def render_show_with_id(v1)
			@request.env["devise.mapping"] = Devise.mappings[:user]
			current_user = FactoryGirl.create(:user)
			sign_in current_user
			post :create, blog: {category_id: 1, post_title: v1, post_theme: "post_theme_test", post_body: "post_body_test"}
	end
end


describe BlogsController do

	describe "index action" do
		it "render_index" do
			get :index
			response.should render_template('index')
		end
	end

	describe "show_action" do

		it "render_show" do
			user = FactoryGirl.create(:user)
			blog = FactoryGirl.create(:blog)
			get :show, {user_id: user.id, id: blog.id}
			response.should render_template('show')
		end

		it "render_404" do
			user = FactoryGirl.create(:user)
			blog = FactoryGirl.create(:blog)
			get :show, {user_id: 100, id: blog.id}
			response.status.should == 404
		end
	end

	describe "create_action" do

		it "create_success" do
			extend SumMacro
			render_show_with_id("post_title_test")
			response.should redirect_to(user_blog_path(1, assigns(:blog)))
		end

		before(:each) do
			request.env["HTTP_REFERER"] = "redirect_to_back"
		end

		it "create_false" do
			extend SumMacro
			render_show_with_id("")
			response.should redirect_to "redirect_to_back"
		end

		it "create_404" do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			current_user = FactoryGirl.create(:user)
			sign_in current_user
			sign_out current_user
			category = FactoryGirl.create(:category)
			post :create, blog: {category_id: category.id, post_title: "post_title_test", post_theme: "post_theme_test", post_body: "post_body_test"}
			response.status.should == 404
		end
	end

	describe "edit_action" do
		it "update_success" do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			current_user = FactoryGirl.create(:user)
			sign_in current_user
			blog = FactoryGirl.create(:blog)
			category = FactoryGirl.create(:category)
			put :update, id: blog.id, blog: {category_id: category.id, post_title: "post_title_test", post_theme: "post_theme_test", post_body: "post_body_test"}
			response.should redirect_to(user_blog_path(current_user.id, assigns(:blog)))
		end
	end

end