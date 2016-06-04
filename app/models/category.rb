class Category < ActiveRecord::Base
	extend FriendlyId
	friendly_id :category_link
	has_many :catsubcategories
	has_many :subcategories, through: :catsubcategories
	has_many :articles
	has_many :blogs

	validates :category_name, presence: true
	validates :category_link, presence: true
	validates :priority, presence: true

	paginates_per 20
	
	scope :curr_cat, -> (category_id){where(category_link: category_id)}

end
