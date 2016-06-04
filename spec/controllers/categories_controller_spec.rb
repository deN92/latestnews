require "rails_helper"
require "spec_helper"

describe CategoriesController do

	describe "index" do		
		it "render_index" do
			# article = FactoryGirl.create(:article)
			# category = FactoryGirl.create(:category)
			get :index
			response.should render_template('index')
		end
	end
end