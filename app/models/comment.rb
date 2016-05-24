class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :article
	acts_as_votable
	after_create { article.update_attribute(:count_comments, article.count_comments+1) }
end