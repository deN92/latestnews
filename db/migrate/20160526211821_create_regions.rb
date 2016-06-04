class CreateRegions < ActiveRecord::Migration
	def change
		create_table :regions do |t|
			t.string :region_name, limit: 20, null: false
			t.timestamps null: false
		end
	end
end