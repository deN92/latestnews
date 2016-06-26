class CreateCatsubcategories < ActiveRecord::Migration
	def change
		create_table :catsubcategories do |t|
			t.integer :category_id,    limit: 3, null: false
			t.integer :subcategory_id, limit: 3, null: false
			t.boolean :menu_show,      default: true
			t.integer :priority,      default: 1
			t.timestamps null: false
		end
	end
end
