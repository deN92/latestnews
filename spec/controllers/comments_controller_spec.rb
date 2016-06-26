require "rails_helper"
require "spec_helper"

describe CommentsController do

	module MacrosComments
		def test_comments(v1, v2)
			@request.env["devise.mapping"] = Devise.mappings[:user]
			current_user = FactoryGirl.create(:user)
			sign_in current_user
			article = FactoryGirl.create(:article)
			post :create, comment: {article_id: article.id, body: v1}
			(Comment.all.count).should == v2
			response.should redirect_to("redirect_to_back")
		end
	end

	describe "create" do

		before(:each) do
			request.env["HTTP_REFERER"] = "redirect_to_back"
		end

		it "create_true" do
			extend MacrosComments
			test_comments("qwe",1)
		end

		it "create_false" do
			extend MacrosComments
			test_comments("",0)
		end
	end

end
