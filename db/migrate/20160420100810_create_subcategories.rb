class CreateSubcategories < ActiveRecord::Migration
	def change
		create_table :subcategories do |t|
			t.string  :subcategory_name, limit: 50, null: false
			t.string  :subcategory_link, limit: 20, null: false
			t.timestamps null: false
		end
	end
end
