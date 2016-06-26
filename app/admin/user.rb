ActiveAdmin.register User do

	menu :label => "Users", :priority => 3, :link_to => 'admin/user'
	permit_params :is_ban, :is_admin

	actions :all, except: [:new, :create]

	index do
		selectable_column
		column :id do |c|
			link_to c.id, admin_user_path(c)
		end
		column :email
		column :name
		column :surname
		column :middle_name
		column :birthday
		column :city
		column :photo do |n|
			image_tag(n.photo, style: "max-height: 50px; max-width: 200px;") if n.photo.present?
		end
		column :is_admin
		column :is_ban
		column :count_posts

		actions
	end

	form do |f|
		if(f.object.email.present?)
			div(class: "user_lv_blocks") do
				para do
					span(class: "user_label") do f.label :email  end
					span(class: "user_value") do f.object.email  end
				end
			end
		end

		if(f.object.name.present?)
			div(class: "user_lv_blocks") do
				para do
					span(class: "user_label") do f.label :name  end
					span(class: "user_value") do f.object.name  end
				end
			end
		end

		if(f.object.surname.present?)
			div(class: "user_lv_blocks") do
				para do
					span(class: "user_label") do f.label :surname  end
					span(class: "user_value") do f.object.surname  end
				end
			end
		end

		if(f.object.middle_name.present?)
			div(class: "user_lv_blocks") do
				para do
					span(class: "user_label") do f.label :middle_name  end
					span(class: "user_value") do f.object.middle_name  end
				end
			end
		end

		if(f.object.birthday.present?)
			div(class: "user_lv_blocks") do
				para do
					span(class: "user_label") do f.label :birthday  end
					span(class: "user_value") do f.object.birthday  end
				end
			end
		end

		if(f.object.city.present?)
			div(class: "user_lv_blocks") do
				para do
					span(class: "user_label") do f.label :city  end
					span(class: "user_value") do f.object.city  end
				end
			end
		end

		if(f.object.photo.present?)
			div(class: "user_lv_blocks") do
				para do
					span(class: "user_label") do f.label :photo  end
					span(class: "user_value") do image_tag(f.object.photo, width: 100)  end
				end
			end
		end

		div(class: "user_lv_blocks") do 
			span(class: "user_label") do f.label     :is_admin  end
			span(class: "user_value") do f.check_box :is_admin end
		end

		div(class: "user_lv_blocks") do 
			span(class: "user_label") do f.label     :is_ban  end
			span(class: "user_value") do f.check_box :is_ban end
		end

		if(f.object.count_posts.present?)
			div(class: "user_lv_blocks") do
				para do
					span(class: "user_label") do f.label :count_posts  end
					span(class: "user_value") do f.object.count_posts  end
				end
			end
		end

		div(class: "user_lv_blocks") do 
			span(class: "user_label") do f.label :current_sign_in_at  end
			span(class: "user_value") do f.object.current_sign_in_at.strftime("%k:%M | %d/%m/%y ") end
		end

		div(class: "user_lv_blocks") do 
			span(class: "user_label") do f.label :last_sign_in_at  end
			span(class: "user_value") do f.object.last_sign_in_at.strftime("%k:%M | %d/%m/%y ") end
		end

		div(class: "user_lv_blocks") do 
			span(class: "user_label") do f.label :sign_in_count  end
			span(class: "user_value") do f.object.sign_in_count end
		end

		div(class: "user_lv_blocks") do 
			span(class: "user_label") do f.label :current_sign_in_ip  end
			span(class: "user_value") do f.object.current_sign_in_ip end
		end

		div do 
			f.button :ok
		end
	end


end
