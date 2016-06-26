class CreateStatsUsersSigns < ActiveRecord::Migration
	def change
		create_table :stats_users_signs do |t|
			t.date :date_sign_in, null: false, default: "2016-05-25"
			t.integer :count_sign_in, null: false, default: 0
		end
	end
end