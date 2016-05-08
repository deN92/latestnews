class CreateArticleImages < ActiveRecord::Migration
	def change
		create_table :article_images do |t|
			t.string  :article_imgs, :limit => 250
			t.timestamps null: false
		end
	end
end
