class CreateArticles < ActiveRecord::Migration
	def change
		create_table :articles do |t|
			t.integer  :subcategory_id,    limit:  3,  null: false
			t.string   :tittle,            limit: 150, null: false
			t.string   :article_link,      limit: 150, null: false
			t.string   :body,              limit: 150, null: false
			t.string   :main_image,        limit: 150
			t.boolean  :enable_comments,   default: true
			t.boolean  :main_article,      default: false
			t.timestamps null: false
		end
	end
end
