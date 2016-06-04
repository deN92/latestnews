ActiveAdmin.register Catsubcategory do

	permit_params :id, :category_id, :subcategory_id, :priority, :menu_show, category_ids: [], subcategory_ids: []

	index do
		selectable_column
		column :id do |c|
			link_to c.id, admin_catsubcategory_path(c)
		end
		column :category_id do |c|
			c.category.category_name
		end
		column :subcategory_id do |c|
			c.subcategory.subcategory_name
		end
		column :menu_show
		column :priority
		actions
	end


	form do |f|
		div do
			label :category
		end
		div do
			f.select :category_id, Category.all.map{|c| [c.category_name, c.id]}, :include_blank => false, label: false
		end
		div do
			label :subcategory
		end
		div do 
			f.select :subcategory_id, Subcategory.all.map{|c| [c.subcategory_name, c.id]}, :include_blank => false, label: false
		end
		div do
			f.label :menu_show
		end
		div do
			f.check_box :menu_show
		end
		div do 
			f.label :priority
		end
		div do
			f.number_field :priority
		end
		div do 
			f.button :ok
		end
	end
end