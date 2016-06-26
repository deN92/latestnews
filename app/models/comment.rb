class Comment < ActiveRecord::Base

	belongs_to :user
	belongs_to :article
	belongs_to :blog
	acts_as_votable
	after_create { choose_article_blog }


	validates :user_id, :body, presence: true

	def choose_article_blog
	  if [self.article_id].reject(&:blank?).size == 1
	  	article.update_attribute(:count_comments, article.count_comments+1) 
	  end
	  if [self.blog_id].reject(&:blank?).size == 1
	  	blog.update_attribute(:count_comments, blog.count_comments+1) 
	  end
	end 

end