class Blog < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	validates :user_id, :category_id, :post_title, :post_theme, presence: true
	validates :post_title, length: { in: 5..150}
	validates :post_theme, length: { in: 5..250}
	validates :post_theme, length: { in: 5..25000}

	after_create  { user.update_attribute(:count_posts, user.count_posts+1) }
	after_destroy { user.update_attribute(:count_posts, user.count_posts-1) }
end