ActiveAdmin.register Category do
	permit_params :id, :category_name, :category_link, :priority, :menu_show

	before_filter :only => [:edit, :update, :show, :destroy] do
		@category = Category.friendly.find(params[:id])
	end

	form do |f|
		div do f.label :category_name 
		end
		div do f.text_field :category_name 
		end
		div do f.label :category_link 
		end
		div do f.text_field :category_link 
		end
		div do f.label :priority
		end
		div do f.number_field :priority
		end
		div do f.label :menu_show
		end
		div do f.check_box :menu_show
		end
		f.button :ok
	end
end