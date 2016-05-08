class Category < ActiveRecord::Base
	extend FriendlyId
	friendly_id :category_link
	has_many :catsubcategories
	has_many :subcategories, through: :catsubcategories
	has_many :articles
end
