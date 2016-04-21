class Category < ActiveRecord::Base
	extend FriendlyId
	friendly_id :category_link
	has_many :subcategories
end
