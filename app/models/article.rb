class Article < ActiveRecord::Base
	extend FriendlyId
	friendly_id :article_link

	belongs_to :category
	belongs_to :subcategory
	belongs_to :region
	has_many   :comments

	# mount_uploader :main_image, MainImageUploader

	validates :category_id, :subcategory_id, :tittle, :article_link, :body, :region_id, presence: true
	validates :tittle, :article_link, uniqueness: true, presence: true, length: { in: 5..150}
	validates :body, length: { in: 50..100000}

	paginates_per 20

	scope :search_articles,   -> (article, search) { article.where("tittle LIKE ? ", "%#{search}%") unless search.nil? }
	scope :search_articles_a, -> (article, search) { article.select{|s| s.tittle =~/#{search}/ } unless /#{search}/.nil? }
	scope :sort_page, -> (article, page1){order(created_at: :desc).page(page1).per(20)}
	scope :sort_comments, -> (article){article.sort_by{|ac| -ac[:count_comments]}.take(5)}
	scope :curr_subcat, -> (sc, category_id){sc.subcategory.articles.where(category_id: category_id)}
	scope :select_region, -> (article, region_id) { article.where(region_id: region_id)  }

	def self.articles_last
		articles_last = Array.new
		Category.order(:id).each do |c|
			c.articles.last(1).each do |a|
				articles_last << a
			end
		end
		return articles_last
	end

	def self.articles(sc, region_id, art, category_id)
		articles = sc.articles.where(category_id: category_id)
		articles = Article.select_region(articles, region_id) unless region_id.nil?
		articles.each do |a|
			art << a
		end
		return art
	end

end
