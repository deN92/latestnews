class Article < ActiveRecord::Base
	extend FriendlyId
	friendly_id :article_link
	belongs_to :category
	belongs_to :subcategory
	has_many   :comments
	mount_uploader :main_image, MainImageUploader

end
