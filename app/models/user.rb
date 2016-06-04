class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

	has_many :comments

	validates :email, presence: true, uniqueness: true, length: { in: 6..30 }
	validates :password, :password_confirmation, presence: true, on: :create
	validates :password, length: { maximum: 30 }
	validates :name, presence: true, length: { in: 2..30 }
	validates :surname, presence: true, length: { in: 2..30 }

	acts_as_votable

	has_many :blogs
	mount_uploader :photo, UserPhotoUploader

	def self.age(date)
		now = Time.now.utc.to_date
		now.year - date.year - ((now.month > date.month || (now.month == date.month && now.day >= date.day)) ? 0 : 1)
	end


end