class CreateCategories < ActiveRecord::Migration
	def change
		create_table :categories do |t|
			t.string  :category_name, limit: 50, null: false
			t.string  :category_link, limit: 20, null: false
			t.integer :priority,      limit:  2, null: false
			t.boolean  :menu_show,    default: true
			t.timestamps null: false
		end
	end
end
