class Subcategory < ActiveRecord::Base
	extend FriendlyId
	friendly_id :subcategory_link
	has_many   :articles
	has_many :catsubcategories
	accepts_nested_attributes_for :catsubcategories
	has_many :categories, through: :catsubcategories
end
