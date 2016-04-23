class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

	has_many :comments

	validates :email, :password, :password_confirmation, :current_password, presence: true
	validates :email, uniqueness: true
end
