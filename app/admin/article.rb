ActiveAdmin.register Article do

	permit_params :id, :category_id, :subcategory_id, :article_link, :tittle, :body, :main_article, :main_image, :enable_comments,             
			categories_ids: [:id],
		subcategories_ids: [:id]

	action_item :edit do
		"<%= asset_path 'application.css' %>".html_safe
		"<script src=\"//cdn.tinymce.com/4/tinymce.min.js\"></script>".html_safe
	end

	before_filter :only => [:edit, :update, :show] do
		@article = Article.friendly.find(params[:id])
	end

	before_create do |product|
		
	end

	before_filter :only => [:create] do
		#params[:article][:article_link] = params[:article][:tittle].to_s.to_slug.normalize(transliterations: :ukrainian).to_s
		render text: "#{params}"
		
		# sbc = Subcategory.friendly.find(params[:article][:subcategory_id])
		# sbc_subcategory_name = sbc.subcategory_name
		# sbc_category_name = sbc.category.category_name
		# fname = "./public/articles/#{sbc_category_name}__#{sbc_subcategory_name} | #{params[:article][:tittle]}.txt"
		# somefile = File.open(fname, "w")
		# somefile.puts "#{params[:article][:body]}"
		# somefile.close
		# params[:article][:body] = fname
		# @article = Article.create(permitted_params[:article])
		# if @article.save
		# 	unless params[:article_images].nil? 
		# 		params[:article_images]['article_imgs'].each do |a|
		# 			@article_images = @article.article_images.create(:article_imgs => a)
		# 		end
		# 	end
		# end
	end

	form do |f|

		div do f.label :category
		end
		div do 
			f.select :category_id, Category.all.map{|c| [c.category_name, c.id]}, :include_blank => false, label: false
		end
		div do
			f.select :subcategory_id, option_groups_from_collection_for_select(Category.all, :subcategories, :category_name, :id, :subcategory_name, f.object.subcategory_id)
		end
		div do f.label :main_article 
		end
		div do f.check_box :main_article 
		end
		div do f.label :enable_comments
		end
		div do f.check_box :enable_comments
		end
		div do f.label :tittle 
		end
		div do f.text_field :tittle
		end
		div do f.hidden_field :article_link 
		end
		div do f.label :body 
		end
		div do 
			f.text_area :body, :class => "tinymce"
		end

		div do
			ArticleImage.last(10).each do |a|
				fields_for "Head image", :multipart => true do	
					image_tag(a.article_imgs, style: "max-height: 50px; max-width: 100px;")
				end
			end
		end
		if controller.action_name == 'edit'
			div do
				f.inputs "Head image", :multipart => true do
					f.input :main_image, :as => :file, :hint => image_tag(f.object.main_image.url, style: "max-height: 50px; max-width: 100px;")
					f.input :main_image_cache, :as => :hidden
					f.check_box :remove_main_image
					f.label "Видалити"
				end
			end
		else
			div do
				f.inputs "Head image", :multipart => true do
					f.input :main_image, :as => :file
					f.input :main_image_cache, :as => :hidden 
				end
			end
		end
		f.button :ok
	end

	index do
		selectable_column
		column :id do |c|
			link_to c.id, admin_article_path(c)
		end
		column :tittle
		column :article_link
		column :main_image do |n|
			image_tag(n.main_image, style: "max-height: 50px; max-width: 200px;")
		end
		column :enable_comments
		column :main_article
		actions
	end


end