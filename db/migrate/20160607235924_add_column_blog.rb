class AddColumnBlog < ActiveRecord::Migration
	def change
		add_column :blogs, :count_comments, :integer
	end
end
