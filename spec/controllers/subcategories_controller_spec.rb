require "rails_helper"
require "spec_helper"

describe SubcategoriesController do

	describe "index" do		
		it "render_index" do
			category = FactoryGirl.create(:category)
			get :index, {category_id: category.category_link}
			response.should render_template('index')
		end
		
		it "render_index_404" do
			category = FactoryGirl.create(:category)
			get :index, {category_id: ""}
			response.status.should == 404
		end
	end

	describe "show" do
		it "render_show" do
			category = FactoryGirl.create(:category)
			subcategory = FactoryGirl.create(:subcategory)
			category.subcategories << subcategory
			Catsubcategory.first.category.should == category
			Catsubcategory.first.subcategory.should == subcategory
			get :show, {category_id: category.category_link , id: subcategory.subcategory_link }
			response.should render_template('show')
		end

		it "render_show_404" do
			category = FactoryGirl.create(:category)
			subcategory = FactoryGirl.create(:subcategory)
			category.subcategories << subcategory
			Catsubcategory.first.category.should == category
			Catsubcategory.first.subcategory.should == subcategory
			get :show, {category_id: category.category_link , id: "subcategory" }
			response.status.should == 404
		end
	end
end