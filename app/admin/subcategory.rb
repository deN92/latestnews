ActiveAdmin.register Subcategory do
	permit_params :id, :subcategory_name, :subcategory_link

	before_filter :only => [:edit, :update, :show, :destroy] do
		@subcategory = Subcategory.friendly.find(params[:id])
	end

	form do |f|
		div do f.label :subcategory_name
		end
		div do f.text_field :subcategory_name
		end
		div do f.label :subcategory_link
		end
		div do f.text_field :subcategory_link
		end
		div do f.button :ok
		end
	end

end
