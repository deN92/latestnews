ActiveAdmin.register Article do

	permit_params :id, :category_id, :subcategory_id, :region_id, :article_link, :tittle, :body, :main_article, :main_image, :enable_comments,             
		categories_ids: [:id], subcategories_ids: [:id]

	action_item :edit do
		"<%= asset_path 'application.css' %>".html_safe
		"<script src=\"//cdn.tinymce.com/4/tinymce.min.js\"></script>".html_safe
	end

	before_filter :only => [:edit, :update, :show, :destroy] do
		@article = Article.friendly.find(params[:id])
	end

	before_create do |product|
		
	end

	before_filter :only => [:create] do
		params[:article][:article_link] = params[:article][:tittle].to_s.to_slug.normalize(transliterations: :ukrainian).to_s
		# render text: "#{params}"
		
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
		div do 
			f.select :region_id, Region.all.map{|c| [c.region_name, c.id]}, :include_blank => false, label: false
		end
		div do f.label :main_article 
		end
		div do f.check_box :main_article 
		end
		div do f.label :enable_comments
		end
		div do f.check_box :enable_comments
		end



		div do 
			select_tag 'source_xml', options_for_select(["bbc", "dw", "liga_net"])
		end

		div(id: "bbc", class: "block_xml_content") do
			xml = Nokogiri::XML(open('http://feeds.bbci.co.uk/ukrainian/topics/world_news/rss.xml'))
			xml = xml.xpath('//item')
			a = xml.size - 1
			(0..a).to_a.each do |i|
				div(id: "bbc_#{i}" , class: "bbc_news") do
					div(class: "bbc_title") do para xml[i].at('title').text end 
					div(class: "bbc_desc") do para xml[i].at('description').text end
					div(class: "bbc_link", style: "display: none") do 
						doc = Nokogiri::HTML(open(xml[i].at('link').text))
						para doc.css('.column--primary h2[class=story-body__crosshead], .column--primary p, .column--primary img, .column--primary [class=media-caption__text]')
					end
				end
			end
		end

		div(id: "dw", class: "block_xml_content") do
			xmldw = SimpleRSS.parse open('http://rss.dw.com/rdf/rss-ukr-all')
			(0..20).to_a.each do |i|
				div(id: "dw_#{i}" , class: "bbc_news") do
					div(class: "bbc_title") do para xmldw.items[i].title.force_encoding("UTF-8") end 
					div(class: "bbc_desc") do para xmldw.items[i].description.force_encoding("UTF-8") end
					div(class: "bbc_link", style: "display: none") do 

						query = xmldw.items[i].link
						query.force_encoding('binary')
						query=WEBrick::HTTPUtils.escape(query)

						doc2 = Nokogiri::HTML(open(query))
						para doc2.css('.col3 h1, .col3 .intro, .col3 .longText p, .col3 img[0]')
					end
				end
			end
		end

		div(id: "liga_net", class: "block_xml_content") do
			xmlln = Nokogiri::XML(open('http://news.liga.net/ua/all/rss.xml'))
			xmlln = xmlln.xpath('//item')
			(0..10).to_a.each do |i|
				div(id: "ln_#{i}" , class: "bbc_news") do
					div(class: "bbc_title") do para xmlln[i].at('title').text end 
					div(class: "bbc_desc") do para xmlln[i].at('description').text end
					div(class: "bbc_link", style: "display: none") do 
						doc3 = Nokogiri::HTML(open(xmlln[i].at('link').text))
						para doc3.css('.news_content .annotation, .news_content .img, .news_content .text _ga1_on_')
					end
				end
			end
		end



		div do f.label :tittle 
		end
		div do f.text_field :tittle
		end
		div do f.hidden_field :article_link 
		end

		# div do
		# 	xml = Nokogiri::XML(open('http://bank-ua.com/export/currrate.xml'))
		# 	xml = xml.xpath('//item[code=840]', '//item[code=978]','//item[code=643]', '//item[code=985]')
		# 	(0..3).to_a.each do |i|
		# 		div do
		# 			span do xml[i].at('size').text end
		# 			span do xml[i].at('char3').text end
		# 			span do xml[i].at('rate').text end
		# 		end
		# 	end
		# end

		div do f.label :body 
		end
		div do 
			f.text_area :body, :class => "tinymce", style: "min-height: 500px;"
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