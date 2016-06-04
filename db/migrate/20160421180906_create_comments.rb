class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.integer :user_id
			t.integer :article_id
			t.string  :body
			t.integer :count_votes_like, default: 0
			t.integer :count_votes_dislike, default: 0
			t.timestamps null: false
		end
	end
end