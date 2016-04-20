class CreateSubcategories < ActiveRecord::Migration
	def change
		create_table :subcategories do |t|
			t.integer :category_id,      limit:  3, null: false
			t.string  :subcategory_name, limit: 50, null: false
			t.string  :subcategory_link, limit: 20, null: false
			t.integer :priority,         limit:  2, null: false
			t.boolean  :menu_show,       default: true
			t.timestamps null: false
		end
	end
end
