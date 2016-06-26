ActiveAdmin.register ArticleImage do

		menu :label => "Article images", :priority => 8, :link_to => 'admin/article_image'

	permit_params :id, :article_imgs
	before_filter :only => [:edit, :update, :show] do

		# @article_image = ArticleImage.friendly.find(params[:id])
	end

	index do
		require 'fastimage' 
		selectable_column
		column :id
		column :images do |n|
			image_tag(n.article_imgs, style: "max-height: 50px; max-width: 200px;")
		end
		column :images_size do |n|
			size = FastImage.size(Rails.root.join("public/#{n.article_imgs}"))
			"#{size[0]} x #{size[1]}" unless size.nil?
		end
		column :images_url do |n|
			n.article_imgs
		end
		actions
	end

	before_filter :only => [:create] do
		unless params[:article_image].nil?
			params[:article_image][:article_imgs].each do |a|
				ArticleImage.create(:article_imgs => a)
			end
		end
		redirect_to :admin_article_images
	end

	show do
		attributes_table do
			row :id
			row :article_imgs
			row :article_imgs do |n|
				image_tag(n.article_imgs.url, style: "max-height: 250px; max-width: 500px;")
			end
			row :images_size do |n|
				size = FastImage.size(Rails.root.join("public/#{n.article_imgs}"))
				"#{size[0]} x #{size[1]}" unless size.nil?
			end
			row :created_at
			row :updated_at
		end
	end

	form do |f|
		if controller.action_name == 'new'
			f.inputs "Image", :multipart => true do
				f.file_field :article_imgs, :as => :file, multiple: true
				f.button :ok
			end
		else
			f.inputs "Image", :multipart => true do
				f.input :article_imgs, :as => :file, :hint => image_tag(f.object.article_imgs.url, style: "max-height: 250px; max-width: 500px;")
				f.input :article_imgs_cache, :as => :hidden
				f.button :ok
			end
		end
	end


end
