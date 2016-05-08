ActiveAdmin.register Catsubcategory do

		permit_params :id, :category_id, :subcategory_id, :priority, :menu_show, category_ids: [], subcategory_ids: []

	form do |f|

		
		div do 
			f.label :category
			f.label f.object.category.category_name
		end
		div do 
			f.label :subcategory
			f.label f.object.subcategory.subcategory_name
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
			f.text_field :priority
		end
		# f.select(:categories, Category.all.collect {|p| [ p.category_name, p.id ]}, {}, :multiple => true)
		#f.input :categories, :collection => Category.pluck(:category_name, :id), :as => :check_boxes, :input_html => {:multiple => true}
		#f.input :catsubcategories, :collection => Catsubcategory.where(subcategory_id: f.object.id).pluck(:menu_show, :id), :as => :check_boxes, :input_html => {:multiple => true}
		#f.input :catsubcategories, :collection => Catsubcategory.where(category_id: f.object.id).pluck(:priority, :id), :as => :check_boxes, :input_html => {:multiple => true }
		#end
		div do f.button :ok
		end
	end

end
