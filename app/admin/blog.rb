ActiveAdmin.register Blog do
	menu :label => "Blogs", :priority => 9, :link_to =>  'admin/blogs'
	actions :all, except: [:new, :create, :edit, :update]

	index do
		selectable_column
		column :id do |c|
			link_to c.id, admin_blog_path(c)
		end
		column :user do |u|
			link_to u.user.email, admin_user_path(u.user.id)
		end
		column :post_title
		column :post_theme
		column :created_at
		column :count_comments

		actions
	end


end
