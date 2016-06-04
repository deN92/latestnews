class RenameColumn < ActiveRecord::Migration
	def change
		rename_column :blogs, :blog_title, :post_title
		rename_column :blogs, :blog_theme, :post_theme
		rename_column :blogs, :blog_body, :post_body
	end
end
