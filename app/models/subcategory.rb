class Subcategory < ActiveRecord::Base
	extend FriendlyId
	friendly_id :subcategory_link
	has_many :catsubcategories
	has_many :categories, through: :catsubcategories
	has_many :articles

	validates :id,   presence: true
	validates :subcategory_name, presence: true
	validates :subcategory_link, presence: true

	accepts_nested_attributes_for :catsubcategories

	
	scope :subcategory_link, -> (article, id) { article.subcategories.where(subcategory_link: id)  }
end
