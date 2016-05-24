class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

	has_many :comments

	validates :email, presence: true, length: { in: 6..30 }
	validates :password, :password_confirmation, presence: true, on: :create
	validates :password, length: { maximum: 30 }

	acts_as_votable
end
