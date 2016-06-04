require "rails_helper"
require "spec_helper"

describe Admin::CategoriesController, :type => :controller do

	module MacrosActiveAdmin
		def auth_admin
			admin = FactoryGirl.create(:admin_user)
			sign_in admin
		end
	end

	it 'rendex_index' do
		extend MacrosActiveAdmin
		auth_admin
		get :index
		response.should render_template('index')
	end

	it 'create_access' do
		extend MacrosActiveAdmin
		auth_admin
		post :create, category: {id: 1, category_name: "category_name_test", category_link: "category_name_test", priority: 7, menu_show: 1}
		response.should redirect_to(admin_category_path(assigns(:category)))
	end

	it 'create_error' do
		extend MacrosActiveAdmin
		auth_admin
		post :create, category: {id: 1, category_name: "category_name_test", priority: 7, menu_show: 1}
		response.status.should == 200
	end

	it 'destroy_access' do
		extend MacrosActiveAdmin
		auth_admin
		category = FactoryGirl.create(:category)
		delete :destroy, id: category.id
		response.should redirect_to(admin_categories_path)
	end
end

describe Admin::SubcategoriesController, :type => :controller do

	module MacrosActiveAdmin
		def auth_admin
			admin = FactoryGirl.create(:admin_user)
			sign_in admin
		end
	end

	it 'rendex_index' do
		extend MacrosActiveAdmin
		auth_admin
		get :index
		response.should render_template('index')
	end

	it 'create_access' do
		extend MacrosActiveAdmin
		auth_admin
		post :create, subcategory: {id: 1, subcategory_name: "subcategory_name_test", subcategory_link: "subcategory_name"}
		(Subcategory.all.count).should == 1
		response.should redirect_to(admin_subcategory_path(assigns(:subcategory)))
	end

	it 'create_error' do
		extend MacrosActiveAdmin
		auth_admin
		post :create, category: {id: 1, subcategory_name: "subcategory_name"}
		response.status.should == 200
	end

	it 'update_access' do
		extend MacrosActiveAdmin
		auth_admin
		subcategory = FactoryGirl.create(:subcategory)
		put :update, id: subcategory.id, subcategory: {}
		response.should redirect_to(admin_subcategory_path(subcategory.subcategory_link))
	end

	it 'destroy_access' do
		extend MacrosActiveAdmin
		auth_admin
		subcategory = FactoryGirl.create(:subcategory)
		delete :destroy, id: subcategory.id
		response.should redirect_to(admin_subcategories_path)
	end
end

describe Admin::ArticlesController, :type => :controller do

	module MacrosActiveAdmin
		def auth_admin
			admin = FactoryGirl.create(:admin_user)
			sign_in admin
		end
		def create_article(body)
			category = FactoryGirl.create(:category)
			subcategory = FactoryGirl.create(:subcategory)
			region = FactoryGirl.create(:region)
			post :create, article: {id: 1, category_id: category.id, subcategory_id: subcategory.id, article_link: "article_link", tittle: "tittle", 
			region_id: region.id, body: body, main_article: 0, main_image: "qwe", enable_comments: 1}
		end
	end

	it 'rendex_index' do
		extend MacrosActiveAdmin
		auth_admin
		get :index
		response.should render_template('index')
	end

	it 'create_access' do
		extend MacrosActiveAdmin
		auth_admin
		create_article("titletitletitletitletitletitletitletitletitletitletitletitle")
		response.should redirect_to(admin_article_path(assigns(:article)))
	end

	it 'create_error' do
		extend MacrosActiveAdmin
		auth_admin
		create_article("")
		response.status.should == 200
	end

	it 'update_access' do
		extend MacrosActiveAdmin
		auth_admin
		category = FactoryGirl.create(:category)
		subcategory = FactoryGirl.create(:subcategory)
		region = FactoryGirl.create(:region)
		article = FactoryGirl.create(:article)
		put :update, id: article.id, article: {}
		response.should redirect_to(admin_article_path(article.article_link))
	end

	it 'destroy_access' do
		extend MacrosActiveAdmin
		auth_admin
		article = FactoryGirl.create(:article)
		delete :destroy, id: article.id
		response.should redirect_to(admin_articles_path)
	end
end