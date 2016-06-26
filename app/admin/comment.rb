ActiveAdmin.register Comment, :as => "PostComment" do

	actions :all, except: [:new, :create, :edit, :update]

	index do
		selectable_column
		column :id do |c|
			link_to c.id, admin_comment_path(c)
		end
		column :user do |u|
			link_to u.user.email, admin_user_path(u.user.id)
		end
		column :body
		column :created_at
		column :count_votes_like
		column :count_votes_dislike

		actions
	end




end
