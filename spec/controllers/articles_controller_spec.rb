require "rails_helper"
require "spec_helper"

describe ArticlesController do

	describe "show action" do		
		it "render_show" do
			article = FactoryGirl.create(:article)
			category = FactoryGirl.create(:category)
			get :show, {id: article.article_link}
			response.should render_template('show')
		end

		it "render_404" do
			get :show, {id: 1}
			response.status.should == 404
		end
	end
end