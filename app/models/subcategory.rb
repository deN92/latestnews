class Subcategory < ActiveRecord::Base
	extend FriendlyId
	friendly_id :subcategory_link
	has_many   :articles
	belongs_to :category
end
