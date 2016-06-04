require "rails_helper"
require "spec_helper"

describe UsersController do

	describe "show" do		
		it "show_access" do
			user = FactoryGirl.create(:user)
			get :show, {id: user.id}
			response.should render_template('show')
		end
		it "show_404" do
			get :show, {id: "q"}
			response.status.should == 404
		end
	end

	describe "update" do		
		it "update_access" do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			current_user = FactoryGirl.create(:user)
			sign_in current_user
			put :update, id: current_user.id, user: {email: "email@examle.com", surname: "surname_example", name: "name_example", photo: "photo_example", birthday: "1990-05-27"}
			response.should redirect_to(user_path(assigns(:user)))
		end

		it "update_back" do
			put :update, id: "ex", user: {email: "email@examle.com", surname: "surname_example", name: "name_example", photo: "photo_example", birthday: "1990-05-27"}
			response.status.should == 404
		end

		before(:each) do
			request.env["HTTP_REFERER"] = "redirect_to_back"
		end

		it "update_back" do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			current_user = FactoryGirl.create(:user)
			sign_in current_user
			put :update, id: current_user.id, user: {}
			response.should redirect_to "redirect_to_back"
		end
	end

end
