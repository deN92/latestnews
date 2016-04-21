class Article < ActiveRecord::Base
	extend FriendlyId
	friendly_id :article_link
	belongs_to :subcategory
	has_many   :comments
end
