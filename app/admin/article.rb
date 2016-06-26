ActiveAdmin.register Article do

	menu :label => "Article", :priority => 7, :link_to => 'admin/article'

	permit_params :id, :category_id, :subcategory_id, :region_id, :article_link, :tittle, :body, :main_article, :main_image, :enable_comments,             
		categories_ids: [:id], subcategories_ids: [:id]

	action_item :edit do
		"<%= asset_path 'application.css' %>".html_safe
		"<script src=\"//cdn.tinymce.com/4/tinymce.min.js\"></script>".html_safe
	end

	before_filter :only => [:edit, :update, :show, :destroy] do
		@article = Article.friendly.find(params[:id])
	end

	before_filter :only => [:create, :update] do
		params[:article][:article_link] = params[:article][:tittle].to_s.to_slug.normalize(transliterations: :ukrainian).to_s
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
			begin
			xml = Nokogiri::XML(open('http://feeds.bbci.co.uk/ukrainian/topics/world_news/rss.xml'))
			xml = xml.xpath('//item')
			# a = xml.size - 1
			(0..10).to_a.each do |i|
				div(id: "bbc_#{i}" , class: "bbc_news") do
					div(class: "bbc_title") do para xml[i].at('title').text end 
					div(class: "bbc_desc") do para xml[i].at('description').text end
					div(class: "bbc_link", style: "display: none") do 
						doc = Nokogiri::HTML(open(xml[i].at('link').text))
						para doc.css('.column--primary h2[class=story-body__crosshead], .column--primary p, .column--primary img, .column--primary [class=media-caption__text]')
					end
				end
			end
			rescue
				para "Немає зв'язку із сервером..."
			end
		end

		div(id: "dw", class: "block_xml_content") do
			begin
			xmldw = SimpleRSS.parse open('http://rss.dw.com/rdf/rss-ukr-all')
			(0..10).to_a.each do |i|
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
			rescue
				para "Немає зв'язку із сервером..."	
			end
		end

		div(id: "liga_net", class: "block_xml_content") do
			begin
			xmlln = Nokogiri::XML(open('http://news.liga.net/ua/all/rss.xml'))
			xmlln = xmlln.xpath('//item')
			(0..10).to_a.each do |i|
				div(id: "ln_#{i}" , class: "bbc_news") do
					div(class: "bbc_title") do para xmlln[i].at('title').text end 
					div(class: "bbc_desc") do para xmlln[i].at('description').text end
					div(class: "bbc_img") do para xmlln[i].at('enclosure').attr('url') end
					div(class: "bbc_link", style: "display: none") do 
						doc3 = Nokogiri::HTML(open(xmlln[i].at('link').text))
						para doc3.css('.news_content .annotation, .news_content .text')
					end
				end
			end
			rescue
				para "Немає зв'язку із сервером..."
			end
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
			f.text_area :body, :class => "tinymce", style: "min-height: 500px;"
		end

		div do
			ArticleImage.last(10).each do |a|
				fields_for "Head image", :multipart => true do	
					image_tag(a.article_imgs, style: "max-height: 50px; max-width: 100px;")
				end
			end
		end
		f.text_field :main_image
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
			image_tag(n.main_image, style: "max-height: 50px; max-width: 200px;") if n.main_image.present?
		end
		column :enable_comments
		column :main_article
		actions
	end


end