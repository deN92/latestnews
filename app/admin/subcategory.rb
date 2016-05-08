ActiveAdmin.register Subcategory do

	permit_params :id, :subcategory_name, :category_id, category_ids: []

	before_filter :only => [:edit, :update, :show] do
		@subcategory = Subcategory.friendly.find(params[:id])
	end

	  # panel "Patients" do
	  #   table_for physician.appointments do
	  #     column "name" do |appointment|
	  #       appointment.patient.name
	  #     end
	  #     column :appointment_date
	  #   end
	  # end

	form do |f|
		# f.label "#{params}"
		# f.select(:categories, Category.all.collect {|p| [ p.category_name, p.id ]}, {}, :multiple => true)
		f.input :categories, :collection => Category.pluck(:category_name, :id), :as => :check_boxes, :input_html => {:multiple => true}
		#f.input :catsubcategories, :collection => Catsubcategory.where(subcategory_id: f.object.id).pluck(:menu_show, :id), :as => :check_boxes, :input_html => {:multiple => true}
		#f.input :catsubcategories, :collection => Catsubcategory.where(category_id: f.object.id).pluck(:priority, :id), :as => :check_boxes, :input_html => {:multiple => true }
		div do f.label :subcategory_name
		end
		div do f.text_field :subcategory_name
		end
		div do f.label :subcategory_link
		end
		div do f.text_field :subcategory_link
		# end
		# div do f.label :priority
		# end
		# div do f.text_field :priority
		end
		div do f.button :ok
		end
	end

end
