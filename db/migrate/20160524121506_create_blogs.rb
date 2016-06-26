class CreateBlogs < ActiveRecord::Migration
	def change
		create_table :blogs do |t|
			t.integer :user_id
			t.integer :category_id
			t.string :post_title
			t.string :post_theme
			t.string :post_body
			t.timestamps null: false
		end
	end
end